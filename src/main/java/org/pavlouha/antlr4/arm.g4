grammar arm;
//TODO сделать парсинг
compilationUnit
   : (segments )* END Identifier
   ;

segments
   : Identifier 'segments' 'para' 'public' (statement | proc)* Identifier 'ends'
   ;

proc
   : Identifier PROC (statement)* 'ret' Identifier ENDP ;

   //TODO список команд

statement
   : addsubstracts | logicalands | b_instr_label | b_instr_rm | adrs | arythmetics | rrxs | bfc | bfi | bkpt | cbz_cbnzs
   | clz | clrex | cmp_cmn | cmp_cmns | cpss | dmb | dsb | isb | it | ldm_stms | ldrs | ldrex | strex | ldrexb | strexb
   | ldrexh | strexh | mul | mla_mls | movs_mvn | movt | mrs | msr | pkhbt | pkhtb | push_pops | qadd_qsubs | qasx_qsaxs
   | qdadd_qdsubs | revs | sadds | sasx_ssax | sbfx_ubfx | sdiv_udiv | sel | sev | shadd | shasx_shsax | shsub | smlas
   | smlad | umulls | smlsds | smmlas | smull | smulwb | smusd | ssat_usat | ssat_usat16 | ssub8_16 | svc | sxta_uxtas
   | sxt_uxts | tbb | tbh | tst_teq | uadd8_16 | uhasx_uhsax | uhsub8_16 | uqadd_uqsubs | uqasx_uqsax | usad8 | usada8
   | uasx_usax | usub8_16 | vabs | vadd | vcmp_vcmpe | vcvt_vcvtr32 | vcvt16 | vcvtb_vcvtts | vdiv | vfma_vfms | vfnma_vfnms
   | vldm | vldr | vlma_vlms | vmov_immediate | vmov_register | vmov_scalar | vmov_arm_core | vmov_two_arm | vmov_arm_scalar
   | vmrs | vmsr | vmul | vneg | vnmla_vnmls
   ;

//TODO доделать команды
//КОМАНДЫ
addsubstracts : addsubstract cond_code (register Separator)? register Separator second_operand ;

logicalands : logicaland (register Separator)? register Separator second_operand ;

adrs : ADR cond_code register Separator Identifier;

arythmetics : arythmetic cond_code register Separator register Separator (register | constant);

rrxs : rrx cond_code register Separator register;

b_instr_label : b_instr cond_code Identifier;

b_instr_rm : b_instr cond_code register;

bfc : BFC cond_code register Separator constant Separator constant ;

bfi : BFI cond_code register Separator register Separator constant Separator constant ;

bkpt : BKPT constant ;

cbz_cbnzs : cbz_cbnz register Separator Identifier ;

clrex: CLREX cond_code ;

clz: CLZ cond_code register Separator register ;

cmp_cmns: cmp_cmn cond_code register Separator second_operand ;

cpss : cps ('i' | 'f') ;

dmb : DMB cond_code ;

dsb : DSB cond_code ;

isb : ISB Hexnum;

it : IT ('E' | 'T' | 'EE' | 'ET' | 'TT' | 'TE' | 'EEE' | 'EET' | 'ETT' | 'TTT' | 'TTE' | 'TEE' | 'ETE' | 'TET')? ;

ldm_stms : ldm_stm cond_code register ('!')? Separator '{' (register | register '-' register) (Separator register | Separator register '-' register )* '}' ;

ldrs : ldr_str cond_code ((register Separator offset ) | (register Separator offset_all '!') | (register Separator '[' register ']' Separator constant )
| (register Separator register Separator offset ) | (register Separator register Separator offset_all '!')
| (register Separator register Separator '[' register ']' Separator constant ));

ldrex: LDREX cond_code register Separator offset;

strex: STREX cond_code register Separator register Separator offset;

ldrexb: LDREXB cond_code register Separator '[' register ']' ;

strexb: STREXB cond_code register Separator register Separator '[' register ']' ;

ldrexh: LDREXH cond_code register Separator '[' register ']' ;

strexh: STREXH cond_code register Separator register Separator '[' register ']' ;

mul : multiply cond_code (register Separator)? register Separator register ;

mla_mls : mla cond_code register Separator register Separator register Separator register ;

movs_mvn : mov_mvn cond_code register Separator second_operand | MOV cond_code register Separator constant ;

movt : MOVT cond_code register Separator constant ;

mrs : MRS cond_code register Separator (APSR | IPSR | EPSR | IEPSR | IAPSR | EAPSR | PSR | MSP | PSP | PRIMASK | BASEPRI
| BASEPRI_MAX| FAULTMASK | CONTROL) ;

msr : MSR cond_code (APSRR_nzcvq | APSR_g | APSR_nzcv | MSP | PSP | PRIMASK | BASEPRI| BASEPRI_MAX| FAULTMASK
| CONTROL) Separator register ;

pkhbt : PKHBT cond_code (register Separator)? register Separator register (Separator LSL constant)? ;

pkhtb : PKHTB cond_code (register Separator)? register Separator register (Separator ASR constant)? ;

push_pops : push_pop cond_code '{' register (Separator register '-' register)? (Separator register)? '}' ;

qadd_qsubs : qadd cond_code (register Separator)? register Separator register ;

qasx_qsaxs: qasx_qsax cond_code (register Separator)? register Separator register ;

qdadd_qdsubs : qdadd_qdsub cond_code (register Separator)? register Separator register ;

revs: rev cond_code register Separator register ;

sadds : sadd cond_code (register Separator)? register Separator register ;

sasx_ssax : (SASX | SSAX) cond_code (register Separator)? register Separator register ;

sbfx_ubfx : (SBFX | UBFX) cond_code register Separator register Separator constant Separator constant ;

sdiv_udiv : (SDIV | UDIV) cond_code (register Separator)? register Separator register ;

sel : SEL cond_code (register Separator)? register Separator register ;

sev: SEV cond_code ;

shadd : (SHADD8 | SHADD16 ) cond_code (register Separator)? register Separator register ;

shasx_shsax : (SHASX | SHSAX) cond_code (register Separator)? register Separator register ;

shsub : (SHSUB8 | SHSUB16) cond_code (register Separator)? register Separator register ;

smlas : smla cond_code register Separator register Separator register (Separator register)? ;

smlad : (SMLAD | SMLADX) cond_code register Separator register Separator register Separator register ;

umulls : umull cond_code register Separator register Separator register Separator register ;

smlsds : smlsd cond_code register Separator register Separator register Separator register ;

smmlas : smmla cond_code register Separator register Separator register Separator register ;

smull : (SMULL | SMULLR ) cond_code register Separator register (Separator register)? ;

smulwb : (SMULWB | SMULWT) cond_code (register Separator)? register Separator register ;

smusd : (SMUSD | SMUSDX ) cond_code (register Separator)? register Separator register ;

ssat_usat : ssat cond_code register Separator constant Separator register (Separator (ASR | LSL) constant)? ;

ssat_usat16 : (SSAT16 | USAT16) cond_code register Separator constant Separator register ;

ssub8_16 : (SSUB8 | SSUB16 ) cond_code (register Separator)? register Separator register ;

svc : cond_code constant ;

sxta_uxtas : sxta_uxta cond_code (register Separator)? register Separator register (Separator ROR constant)? ;

sxt_uxts : sxt_uxt cond_code (register Separator)? register (Separator ROR constant)? ;

tbb : TBB '[' register Separator register ']' ;

tbh : TBH '[' register Separator register Separator LSL constant ;

tst_teq : (TST | TEQ ) cond_code register Separator second_operand;

uadd8_16 : (UADD8 | UADD16) cond_code (register Separator)? register Separator register ;

uhasx_uhsax : (UHASX | UHSAX) cond_code (register Separator)? register Separator register ;

uhsub8_16 : (UHSUB16 | UHSUB8) cond_code (register Separator)? register Separator register ;

uqadd_uqsubs : uqadd_uqsub cond_code (register Separator)? register Separator register ;

uqasx_uqsax : (UQASX | UQSAX) cond_code (register Separator)? register Separator register ;

usad8 : USAD8 cond_code (register Separator)? register Separator register ;

usada8 : USADA8 cond_code (register Separator)? register Separator register Separator register ;

uasx_usax : (UASX | USAX ) cond_code (register Separator)? register Separator register ;

usub8_16 : (USUB16 | USUB8) cond_code (register Separator)? register Separator register ;

vabs : VABS cond_code '.F32' s_register Separator s_register ;

vadd : VADD cond_code '.F32' (s_register Separator)? s_register Separator s_register ;

vcmp_vcmpe : (VCMP | VCMPE ) cond_code '.F32' s_register Separator (s_register | '#' FloatingPointLiteral ) ;

vcvt_vcvtr32 : vcvt_vcvtr cond_code ('.S32.F32' | '.U32.F32') s_register Separator s_register ;

vcvt16 : VCVT cond_code ('.S16.F32' | '.S32.F32' | '.U16.F32' | '.U32.F32') s_register Separator s_register Separator
 constant ;

vcvtb_vcvtts : vcvtt cond_code ('.F32.F16' | '.F16.F32') s_register Separator s_register ;

vdiv : VDIV cond_code '.F32' (s_register Separator)? s_register Separator s_register ;

vfma_vfms : (VFMA | VFMS) cond_code '.F32' (s_register Separator)? s_register Separator s_register ;

vfnma_vfnms : (VFNMA | VFNMS ) cond_code '.F32' (s_register Separator)? s_register Separator s_register ;

vldm : VLDM ('IA' | 'DB')? cond_code ('.F32' | '.F64')? register ('!')? '{' (Separator s_register | Separator
s_register '-' s_register ) '}' ;

vldr : VLDR cond_code ('.64' (register Separator offset | register Separator Identifier | register '[' PC Separator constant ']') | '.32'
(s_register Separator offset | s_register Separator Identifier | s_register '[' PC Separator constant ']') ) ;

vlma_vlms : (VLMA | VLMS) cond_code '.F32' s_register Separator s_register Separator s_register ;

vmov_immediate : VMOV cond_code '.F32' s_register Separator constant ;

vmov_register : VMOV cond_code ('.F32' s_register Separator s_register | '.F64' register Separator register) ;

vmov_scalar : VMOV cond_code register Separator s_register'['( '1' | '0' ) ']' ;

vmov_arm_core : VMOV cond_code (s_register Separator register| register Separator s_register) ;

vmov_two_arm : VMOV cond_code (s_register Separator s_register Separator register Separator register | register Separator
register Separator s_register Separator s_register) ;

vmov_arm_scalar : VMOV cond_code ('.32')? s_register '[' ('1'|'0') ']' Separator register ;

vmrs : VMRS cond_code (register Separator FPSCR | APSR_nzcv Separator FPSCR) ; //хз

vmsr : VMSR cond_code FPSCR Separator register ;

vmul : VMUL cond_code '.F32' (s_register Separator)? s_register Separator s_register  ;

vneg : VNEG cond_code '.F32' s_register Separator s_register ;

vnmla_vnmls : (VNMLA | VNMLS) cond_code '.F32' s_register Separator s_register Separator s_register ;



// ДОП ШТУКИ
constant : '#' (Decimalnum | Char | Hexnum);

second_operand : constant | register (Separator optional_shift constant)? | register Separator RRX ;

offset : '[' register (',' constant)? ']' ;

offset_all : '[' register ',' constant ']' ;

lbl : Identifier Colon ;

cond_code : (EQ | NE | CS | HS | CC | L0 | MI | PL | VS | VC | HI | LS | GE | LT | GT | LE | AL)? ;

register
   : R0
   | R1
   | R2
   | R3
   | R4
   | R5
   | R6
   | R7
   | R8
   | R9
   | R10
   | R11
   | R12
   | SP
   | LR
   | PC
   | PSR
   | PRIMASK
   | FAULTMASK
   | BASEPRI
   | CONTROL
   ;

s_register
   : S0
   | S1
   | S2
   | S3
   | S4
   | S5
   | S6
   | S7
   | S8
   | S9
   | S10
   | S11
   | S12
   | S13
   | S14
   | S15
   ;

optional_shift : ASR | LSL | LSR | ROR ;

addsubstract
   : ADC
   | ADCS
   | ADD
   | ADDS
   | SUB
   | SUBS
   | SBC
   | SBCS
   | RSB
   | RSBS
   | ADDW
   | SUBW
   ;

logicaland
    : AND
    | ANDS
    | ORR
    | ORRS
    | EOR
    | EORS
    | BIC
    | BICS
    | ORN
    | ORNS
    ;

arythmetic
   : ASR
   | ASRS
   | LSL
   | LSLS
   | LSR
   | LSRS
   | ROR
   | RORS
   ;

rrx
   : RRX
   | RRXS
   ;

b_instr
   : B
   | BL
   | BLX
   | BX
   ;

cbz_cbnz
   : CBNZ
   | CBZ
;

cmp_cmn
    : CMP
    | CMN
;

cps : CPSID
    | CPSIE ;

ldm_stm
    : LDM
    | LDMDB
    | LDMEA
    | LDMFD
    | LDMIA
    | STM
    | STMDB
    | STMEA
    | STMFD
    | STMIA
    ;

ldr_str
    : LDR
    | LDRB
    | LDRSB
    | LDRH
    | LDRSH
    | STR
    | STRB
    | LDRD
    | STRD
    | STRH
    | LDRBT
    | LDRHT
    | LDRSBT
    | LDRSHT
    | LDRT
    | STRHT
    | STRT
    | STRBT
;

multiply
    : MUL
    | MULS ;

mla
    : MLA
    | MLS ;

mov_mvn
    : MOVS
    | MOV
    | MVN
    | MVNS;

push_pop
    : PUSH
    | POP ;

qadd
    : QADD
    | QADD16
    | QADD8 ;

qasx_qsax
    : QASX
    | QSAX ;

qdadd_qdsub
    : QDADD
    | QDSUB
    | QSUB
    | QSUB16
    | QSUB8;

rev : RBIT
    | REV
    | REV16
    | REVSH ;

sadd
    : SADD16
    | SADD8 ;

smla
    : SMLABB
    | SMLABT
    | SMLATB
    | SMLATT
    | SMLAWB
    | SMLAWT ;

umull
    : UMLAL
    | UMULL
    | SMULL
    | SMLAL
    | SMLALD
    | SMLALDX
    | SMLALBB
    | SMLALBT
    | SMLALTB
    | SMLALTT ;

smlsd
    : SMLSD
    | SMLSLD
    | SMLSDX
    | SMLSLDX ;

smmla
    : SMMLA
    | SMMLS
    | SMMLAR
    | SMMLSR
    | SMMLR ;

ssat
    : SSAT
    | USAT ;

sxta_uxta
    : SXTAB
    | SXTAB16
    | SXTAH
    | UXTAB
    | UXTAB16
    | UXTAH ;

sxt_uxt
    : SXTB16
    | SXTB
    | SXTH
    | UXTB
    | UXTB16
    | UXTH ;

uqadd_uqsub
    : UQADD16
    | UQADD8
    | UQSUB16
    | UQSUB8 ;

vcvt_vcvtr
    : VCVT
    | VCVTR ;

vcvtt
    : VCVTB
    | VCVTT
    | VCVTH
    | VCVTTB
    | VCVTTT ;

directives
   : AREA
   | ENTRY
   | ALIGN
   | DCB
   | DCW
   | DCD
   | SPACE
   | EQU
   | RN
   | EXPORT
   | IMPORT
   | INCLUDE
   | GET
   | PROC
   | ENDP
   | END ;

Identifier : [a-z][a-zA-Z0-9_]* ;

QUESTION : '?' ;

Hexnum : '0x' HexDigit + ;

Decimalnum : Digit + ;

Octalnum : ('0' .. '7') + ('o' | 'O') ;

fragment HexDigit : ('0' .. '9' | 'a' .. 'f' | 'A' .. 'F') ;
//хз, что там внизу, TODO понять
FloatingPointLiteral
   : ('0' .. '9') + '.' ('0' .. '9')* Exponent? | '.' ('0' .. '9') + Exponent? | ('0' .. '9') + Exponent ;

fragment Exponent : ('e' | 'E') ('+' | '-')? ('0' .. '9') + ;

String: '"' (~'"' | '\\"')* '"';

Char : '\'' (~'\'' | '\\\'') '\'' ;

fragment Letter
   : ('a' .. 'z' | 'A' .. 'Z') ;

Digit: [0-9] ;

Colon: ':';

Separator: ',';

WS : (' ' | '\t' | '\n' | '\r') -> skip ;

LINE_COMMENT: ';' ~ ('\n' | '\r')* '\r'? '\n' -> skip ;

//registers
R0 : 'R0';
R1 : 'R1';
R2 : 'R2';
R3 : 'R3';
R4 : 'R4';
R5 : 'R5';
R6 : 'R6';
R7 : 'R7';
R8 : 'R8';
R9 : 'R9';
R10 : 'R10';
R11 : 'R11';
R12 : 'R12';
SP : 'SP';
LR : 'LR';
PC : 'PC';

PSR : 'PSR';
PRIMASK : 'PRIMASK';
FAULTMASK : 'FAULTMASK';
BASEPRI : 'BASEPRI';
CONTROL : 'CONTROL';

//commands
ADC: 'ADC';
ADD: 'ADD';
ADCS : 'ADCS';
ADDS : 'ADDS';
ADDW : 'ADDW';
ADR : 'ADR';
AND : 'AND';
ANDS : 'ANDS';
ASR : 'ASR';
ASRS : 'ASRS';
B : 'B';
BFC : 'BFC';
BFI : 'BFI';
BIC : 'BIC';
BICS : 'BICS';
BKPT : 'BKPT';
BL : 'BL';
BLX : 'BLX';
BX : 'BX';
CBNZ : 'CBNZ';
CBZ : 'CBZ';
CLREX : 'CLREX';
CLZ : 'CLZ';
CMN : 'CMN';
CMP: 'CMP';
CPSID : 'CPSID';
CPSIE : 'CPSIE';
DMB : 'DMB';
DSB : 'DSB';
EOR : 'EOR';
EORS : 'EORS';
ISB : 'ISB';
IT : 'IT';
LDM : 'LDM';
LDMDB : 'LDMDB';
LDMEA : 'LDMEA';
LDMFD : 'LDMFD';
LDMIA : 'LDMIA';
LDR : 'LDR';
LDRB : 'LDRB';
LDRBT : 'LDRBT';
LDRD : 'LDRD';
LDREX : 'LDREX';
LDREXB : 'LDREXB';
LDREXH : 'LDREXH';
LDRH : 'LDRH';
LDRHT : 'LDRHT';
LDRSB : 'LDRSB';
LDRSBT : 'LDRSBT';
LDRSH : 'LDRSH';
LDRSHT : 'LDRSHT';
LDRT : 'LDRT';
LSL : 'LSL';
LSLS : 'LSLS';
LSR : 'LSR';
LSRS : 'LSRS';
MLA : 'MLA';
MLS : 'MLS';
MOV: 'MOV';
MOVS: 'MOVS';
MOVT : 'MOVT';
MOVW : 'MOVW';
MRS : 'MRS';
MSR : 'MSR';
MUL: 'MUL';
MULS : 'MULS';
MVN : 'MVN';
MVNS : 'MVNS';
NOP : 'NOP';
ORN : 'ORN';
ORNS : 'ORNS';
ORR : 'ORR';
ORRS : 'ORRS';
PKHTB : 'PKHTB';
PKHBT : 'PKHBT';
POP: 'POP';
PUSH: 'PUSH';
QADD : 'QADD';
QADD16 : 'QADD16';
QADD8 : 'QADD8';
QASX : 'QASX';
QDADD : 'QDADD';
QDSUB : 'QDSUB';
QSAX : 'QSAX';
QSUB : 'QSUB';
QSUB16 : 'QSUB16';
QSUB8 : 'QSUB8';
RBIT : 'RBIT';
REV : 'REV';
REV16 : 'REV16';
REVSH : 'REVSH';
ROR: 'ROR';
RORS : 'RORS';
RRX : 'RRX';
RRXS : 'RRXS';
RSB : 'RSB';
RSBS : 'RSBS';
SADD16 : 'SADD16';
SADD8 : 'SADD8';
SASX : 'SASX';
SBC : 'SBC';
SBCS : 'SBCS';
SBFX : 'SBFX';
SDIV : 'SDIV';
SEL : 'SEL';
SEV : 'SEV';
SHADD16 : 'SHADD16';
SHADD8 : 'SHADD8';
SHASX : 'SHASX';
SHSAX : 'SHSAX';
SHSUB16 : 'SHSUB16';
SHSUB8 : 'SHSUB8';
SMLABB : 'SMLABB';
SMLABT : 'SMLABT';
SMLATB : 'SMLATB';
SMLATT : 'SMLATT';
SMLAD : 'SMLAD';
SMLADX : 'SMLADX';
SMLAL : 'SMLAL';
SMLALBB : 'SMLALBB';
SMLALBT : 'SMLALBT';
SMLALTB : 'SMLALTB';
SMLALTT : 'SMLALTT';
SMLALD : 'SMLALD';
SMLALDX : 'SMLALDX';
SMLAWB : 'SMLAWB';
SMLAWT : 'SMLAWT';
SMLSD : 'SMLSD';
SMLSLD : 'SMLSLD';
SMMLA : 'SMMLA';
SMMLS : 'SMMLS';
SMMLR : 'SMMLR';
SMMUL : 'SMMUL';
SMMULR : 'SMMULR';
SMUAD : 'SMUAD';
SMULBB : 'SMULBB';
SMULBT : 'SMULBT';
SMULTB : 'SMULTB';
SMULTT : 'SMULTT';
SMULL : 'SMULL';
SMULWB : 'SMULWB';
SMULWT : 'SMULWT';
SMUSD : 'SMUSD';
SMUSDX : 'SMUSDX';
SSAT : 'SSAT';
SSAT16 : 'SSAT16';
SSAX : 'SSAX';
SSUB16 : 'SSUB16';
SSUB8 : 'SSUB8';
STM : 'STM';
STMDB : 'STMDB';
STMEA : 'STMEA';
STMFD : 'STMFD';
STMIA : 'STMIA';
STR : 'STR';
STRB : 'STRB';
STRBT : 'STRBT';
STRD : 'STRD';
STREX : 'STREX';
STREXB : 'STREXB';
STREXH : 'STREXH';
STRH : 'STRH';
STRHT : 'STRHT';
STRT : 'STRT';
SUB: 'SUB';
SUBS : 'SUBS';
SUBW : 'SUBW';
SVC : 'SVC';
SXTAB : 'SXTAB';
SXTAB16 : 'SXTAB16';
SXTAH : 'SXTAH';
SXTB16 : 'SXTB16';
SXTB : 'SXTB';
SXTH : 'SXTH';
TBB : 'TBB';
TBH : 'TBH';
TEQ : 'TEQ';
TST : 'TST';
UADD16 : 'UADD16';
UADD8 : 'UADD8';
USAX : 'USAX';
UHADD16 : 'UHADD16';
UHADD8 : 'UHADD8';
UHASX : 'UHASX';
UHSAX : 'UHSAX';
UHSUB16 : 'UHSUB16';
UHSUB8 : 'UHSUB8';
UBFX : 'UBFX';
UDIV : 'UDIV';
UMAAL : 'UMAAL';
UMLAL : 'UMLAL';
UMULL : 'UMULL';
UQADD16 : 'UQADD16';
UQADD8 : 'UQADD8';
UQASX : 'UQASX';
UQSAX : 'UQSAX';
UQSUB16 : 'UQSUB16';
UQSUB8 : 'UQSUB8';
USAD8 : 'USAD8';
USADA8 : 'USADA8';
USAT : 'USAT';
USAT16 : 'USAT16';
UASX : 'UASX';
USUB16 : 'USUB16';
USUB8 : 'USUB8';
UXTAB : 'UXTAB';
UXTAB16 : 'UXTAB16';
UXTAH : 'UXTAH';
UXTB : 'UXTB';
UXTB16 : 'UXTB16';
UXTH : 'UXTH';
VABS : 'VABS';
VADD : 'VADD';
VCMP : 'VCMP';
VCMPE : 'VCMPE';
VCVT : 'VCVT';
VCVTR : 'VCVTR';
VCVTB : 'VCVTB';
VCVTT : 'VCVTT';
VDIV : 'VDIV';
VFMA : 'VFMA';
VFNMA : 'VFNMA';
VFMS : 'VFMS';
VFNMS : 'VFNMS';
VLDM : 'VLDM';
VLDR : 'VLDR';
VLMA : 'VLMA';
VLMS : 'VLMS';
VMOV : 'VMOV';
VMRS : 'VMRS';
VMSR : 'VMSR';
VMUL : 'VMUL';
VNEG : 'VNEG';
VNMLA : 'VNMLA';
VNMLS : 'VNMLS';
VNMUL : 'VNMUL';
VPOP : 'VPOP';
VPUSH : 'VPUSH';
VSQRTF32 : 'VSQRT.F32';
VSTM : 'VSTM';
VSTRF3264 : 'VSTR.F<32|64>';
VSUBF3264 : 'VSUB.F<32|64>';
WFE : 'WFE';
WFI : 'WFI';
SMLSDX : 'SMLSDX';
SMLSLDX : 'SMLSLDX';
SMMLAR : 'SMMLAR';
SMMLSR : 'SMMLSR';
SMULLR : 'SMULLR';
VCVTH : 'VCVTH';
VCVTTB : 'VCVTTB';
VCVTTT : 'VCVTTT';

//directives
AREA : 'AREA';
ENTRY : 'ENTRY';
ALIGN : '.align';
DCB : '.dcb';
DCW : '.dcw';
DCD : '.dcd';
SPACE : '.space';
EQU : '.equ';
RN : '.rn';
EXPORT : '.export';
IMPORT : '.import';
INCLUDE : '.include';
GET : '.get';
PROC : '.proc';
ENDP : '.endp';
END : '.end';
//флаги
EQ : 'EQ';
NE : 'NE';
CS : 'CS';
CC : 'CC';
L0 : 'L0';
MI : 'MI';
PL : 'PL';
VS : 'VS';
VC : 'VC';
HI : 'HI';
LS : 'LS';
GE : 'GE';
LT : 'LT';
GT : 'GT';
LE : 'LE';
AL : 'AL';
HS : 'HS';

APSR : 'APSR';
IPSR : 'IPSR';
EPSR : 'EPSR';
IEPSR : 'IEPSR';
IAPSR : 'IAPSR';
EAPSR : 'EAPSR';
MSP : 'MSP';
PSP : 'PSP';
BASEPRI_MAX : 'BASEPRI_MAX';
APSRR_nzcvq : 'APSRR_nzcvq';
APSR_g : 'APSR_g';
APSR_nzcvqg : 'APSR_nzcvqg';

//S
S0 : 'S0';
S1 : 'S1';
S2 : 'S2';
S3 : 'S3';
S4 : 'S4';
S5 : 'S5';
S6 : 'S6';
S7 : 'S7';
S8 : 'S8';
S9 : 'S9';
S10 : 'S10';
S11 : 'S11';
S12 : 'S12';
S13 : 'S13';
S14 : 'S14';
S15 : 'S15';

APSR_nzcv : 'APSR_nzcv';
FPSCR : 'FPSCR';