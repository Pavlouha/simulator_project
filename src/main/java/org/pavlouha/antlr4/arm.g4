grammar arm;
//TODO сделать парсинг
// TODO некоторые штуки могут быть не рабочими
compilationUnit : (section )* '.end' ;

section
   : Section Identifier Separator (section_flags)? (statement | function)* ;

function
   : TYPE Identifier id (statement)* ;

statement
   : addsubstracts | logicalands | b_instr_label | b_instr_rm | adrs | arythmetics | rrxs | bfc | bfi | bkpt | cbz_cbnzs
   | clz | clrex | cmp_cmn | cmp_cmns | cpss | dmb | dsb | isb | it | ldm_stms | ldrs | ldrex | strex | ldrexb | strexb
   | ldrexh | strexh | mul | mla_mls | movs_mvn | movt | mrs | msr | pkhbt | pkhtb | push_pops | qadd_qsubs | qasx_qsaxs
   | qdadd_qdsubs | revs | sadds | sasx_ssax | sbfx_ubfx | sdiv_udiv | sel | sev | shadd | shasx_shsax | shsub | smlas
   | smlad | umulls | smlsds | smmlas | smull | smulwb | smusd | ssat_usat | ssat_usat16 | ssub8_16 | svc | sxta_uxtas
   | sxt_uxts | tbb | tbh | tst_teq | uadd8_16 | uhasx_uhsax | uhsub8_16 | uqadd_uqsubs | uqasx_uqsax | usad8 | usada8
   | uasx_usax | usub8_16 | vabs | vadd | vcmp_vcmpe | vcvt_vcvtr32 | vcvt16 | vcvtb_vcvtts | vdiv | vfma_vfms | vfnma_vfnms
   | vldm | vldr | vlma_vlms | vmov_immediate | vmov_register | vmov_scalar | vmov_arm_core | vmov_two_arm | vmov_arm_scalar
   | vmrs | vmsr | vmul | vneg | vnmla_vnmls | vnmul | vpop | vpush | vsqrt | vstm | vstr | vsub | wfe | wfi
   ;

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
s_register '-' s_register )* '}' ;

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

vnmul : VNMUL cond_code '.F32' (s_register Separator)? s_register Separator s_register ;

vpop : VPOP cond_code ('.F32'|'.F64') '{' ((Separator)? s_register | (Separator)? s_register '-' s_register )* '}' ;

vpush : VPUSH cond_code ('.F32'|'.F64') '{' ((Separator)? s_register | (Separator)? s_register '-' s_register )* '}' ;

vsqrt : VSQRT cond_code '.F32' s_register Separator s_register ;

vstm : VSTM ('IA' | 'DB') cond_code ('.F32'|'.F64') register ('!')? Separator '{' ((Separator)? s_register | (Separator)? s_register '-' s_register )* '}' ;

vstr : VSTR cond_code (('.F32')? s_register offset | ('.F64')? Letter Letter Separator offset ); //каво

vsub : VSUB cond_code '.F32' (s_register Separator)? s_register Separator s_register ;

wfe : WFE cond_code ;

wfi : WFI cond_code ;

// ДОП ШТУКИ
constant : '#' (Decimalnum | Char | Hexnum);

second_operand : constant | register (Separator optional_shift constant)? | register Separator RRX ;

offset : '[' register (Separator constant)? ']' ;

offset_all : '[' register Separator constant ']' ;

id : Identifier Colon ;

section_flags : '"a"' | '"e"' | WRITABLE | EXECUTABLE | '"M"' | '"S"' | '"G"' | '"T"' | '"?"'  ;


sectype: SECTYPE Decimalnum;

secflags: SECFLAGS Decimalnum;

merge: MERGE Decimalnum;

linkorder: LINKORDER Identifier;

group: GROUP Identifier;

comgroup: COMGROUP Identifier;

assoc: ASSOC Identifier;

align: ALIGN Decimalnum;

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
   : ENTRY
   | ALIGN
   | GLOBAL
   | preserve
   | EXPORT
   | IMPORT
   | INCLUDE
   | TEXT
   | GET
   | WORD
   | PROC;

preserve: PRESERVE;

Identifier : [a-zA-Z][a-zA-Z0-9_]* ;

Hexnum : '0x' HexDigit + ;

Decimalnum : Digit (Digit)* ;

fragment HexDigit : ('0' .. '9' | 'A' .. 'F') ;

FloatingPointLiteral
   : ('0' .. '9') + '.' ('0' .. '9')* Exponent? | '.' ('0' .. '9') + Exponent? | ('0' .. '9') + Exponent ;

fragment Exponent : ('e' | 'E') ('+' | '-')? ('0' .. '9') + ;

String: '"' (~'"' | '\\"')* '"';

Char : '\'' (~'\'' | '\\\'') '\'' ;

Letter
   : ('a' .. 'z' | 'A' .. 'Z') ;

fragment Digit :'0'..'9' ;

Colon: ':';

Separator: ',';

WS : [\t\r\n\f ]+ -> skip ;

LINE_COMMENT :   ( '//' ~[\r\n]* '\r'? '\n'	| '/*' .*? '*/'	) -> skip ;

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
ADC	:	(	'adc'	|	'ADC'	)	;
ADD	:	(	 'add'	|	 'ADD'	)	;
ADCS 	:	(	 'adcs'	|	 'ADCS'	)	;
ADDS 	:	(	 'adds'	|	 'ADDS'	)	;
ADDW 	:	(	 'addw'	|	 'ADDW'	)	;
ADR 	:	(	 'adr'	|	 'ADR'	)	;
AND 	:	(	 'and'	|	 'AND'	)	;
ANDS 	:	(	 'ands'	|	 'ANDS'	)	;
ASR 	:	(	 'asr'	|	 'ASR'	)	;
ASRS 	:	(	 'asrs'	|	 'ASRS'	)	;
B 	:	(	 'b'	|	 'B'	)	;
BFC 	:	(	 'bfc'	|	 'BFC'	)	;
BFI 	:	(	 'bfi'	|	 'BFI'	)	;
BIC 	:	(	 'bic'	|	 'BIC'	)	;
BICS 	:	(	 'bics'	|	 'BICS'	)	;
BKPT 	:	(	 'bkpt'	|	 'BKPT'	)	;
BL 	:	(	 'bl'	|	 'BL'	)	;
BLX 	:	(	 'blx'	|	 'BLX'	)	;
BX 	:	(	 'bx'	|	 'BX'	)	;
CBNZ 	:	(	 'cbnz'	|	 'CBNZ'	)	;
CBZ 	:	(	 'cbz'	|	 'CBZ'	)	;
CLREX 	:	(	 'clrex'	|	 'CLREX'	)	;
CLZ 	:	(	 'clz'	|	 'CLZ'	)	;
CMN 	:	(	 'cmn'	|	 'CMN'	)	;
CMP	:	(	 'cmp'	|	 'CMP'	)	;
CPSID 	:	(	 'cpsid'	|	 'CPSID'	)	;
CPSIE 	:	(	 'cpsie'	|	 'CPSIE'	)	;
DMB 	:	(	 'dmb'	|	 'DMB'	)	;
DSB 	:	(	 'dsb'	|	 'DSB'	)	;
EOR 	:	(	 'eor'	|	 'EOR'	)	;
EORS 	:	(	 'eors'	|	 'EORS'	)	;
ISB 	:	(	 'isb'	|	 'ISB'	)	;
IT 	:	(	 'it'	|	 'IT'	)	;
LDM 	:	(	 'ldm'	|	 'LDM'	)	;
LDMDB 	:	(	 'ldmdb'	|	 'LDMDB'	)	;
LDMEA 	:	(	 'ldmea'	|	 'LDMEA'	)	;
LDMFD 	:	(	 'ldmfd'	|	 'LDMFD'	)	;
LDMIA 	:	(	 'ldmia'	|	 'LDMIA'	)	;
LDR 	:	(	 'ldr'	|	 'LDR'	)	;
LDRB 	:	(	 'ldrb'	|	 'LDRB'	)	;
LDRBT 	:	(	 'ldrbt'	|	 'LDRBT'	)	;
LDRD 	:	(	 'ldrd'	|	 'LDRD'	)	;
LDREX 	:	(	 'ldrex'	|	 'LDREX'	)	;
LDREXB 	:	(	 'ldrexb'	|	 'LDREXB'	)	;
LDREXH 	:	(	 'ldrexh'	|	 'LDREXH'	)	;
LDRH 	:	(	 'ldrh'	|	 'LDRH'	)	;
LDRHT 	:	(	 'ldrht'	|	 'LDRHT'	)	;
LDRSB 	:	(	 'ldrsb'	|	 'LDRSB'	)	;
LDRSBT 	:	(	 'ldrsbt'	|	 'LDRSBT'	)	;
LDRSH 	:	(	 'ldrsh'	|	 'LDRSH'	)	;
LDRSHT 	:	(	 'ldrsht'	|	 'LDRSHT'	)	;
LDRT 	:	(	 'ldrt'	|	 'LDRT'	)	;
LSL 	:	(	 'lsl'	|	 'LSL'	)	;
LSLS 	:	(	 'lsls'	|	 'LSLS'	)	;
LSR 	:	(	 'lsr'	|	 'LSR'	)	;
LSRS 	:	(	 'lsrs'	|	 'LSRS'	)	;
MLA 	:	(	 'mla'	|	 'MLA'	)	;
MLS 	:	(	 'mls'	|	 'MLS'	)	;
MOV	:	(	 'mov'	|	 'MOV'	)	;
MOVS	:	(	 'movs'	|	 'MOVS'	)	;
MOVT 	:	(	 'movt'	|	 'MOVT'	)	;
MOVW 	:	(	 'movw'	|	 'MOVW'	)	;
MRS 	:	(	 'mrs'	|	 'MRS'	)	;
MSR 	:	(	 'msr'	|	 'MSR'	)	;
MUL	:	(	 'mul'	|	 'MUL'	)	;
MULS 	:	(	 'muls'	|	 'MULS'	)	;
MVN 	:	(	 'mvn'	|	 'MVN'	)	;
MVNS 	:	(	 'mvns'	|	 'MVNS'	)	;
NOP 	:	(	 'nop'	|	 'NOP'	)	;
ORN 	:	(	 'orn'	|	 'ORN'	)	;
ORNS 	:	(	 'orns'	|	 'ORNS'	)	;
ORR 	:	(	 'orr'	|	 'ORR'	)	;
ORRS 	:	(	 'orrs'	|	 'ORRS'	)	;
PKHTB 	:	(	 'pkhtb'	|	 'PKHTB'	)	;
PKHBT 	:	(	 'pkhbt'	|	 'PKHBT'	)	;
POP	:	(	 'pop'	|	 'POP'	)	;
PUSH	:	(	 'push'	|	 'PUSH'	)	;
QADD 	:	(	 'qadd'	|	 'QADD'	)	;
QADD16 	:	(	 'qadd16'	|	 'QADD16'	)	;
QADD8 	:	(	 'qadd8'	|	 'QADD8'	)	;
QASX 	:	(	 'qasx'	|	 'QASX'	)	;
QDADD 	:	(	 'qdadd'	|	 'QDADD'	)	;
QDSUB 	:	(	 'qdsub'	|	 'QDSUB'	)	;
QSAX 	:	(	 'qsax'	|	 'QSAX'	)	;
QSUB 	:	(	 'qsub'	|	 'QSUB'	)	;
QSUB16 	:	(	 'qsub16'	|	 'QSUB16'	)	;
QSUB8 	:	(	 'qsub8'	|	 'QSUB8'	)	;
RBIT 	:	(	 'rbit'	|	 'RBIT'	)	;
REV 	:	(	 'rev'	|	 'REV'	)	;
REV16 	:	(	 'rev16'	|	 'REV16'	)	;
REVSH 	:	(	 'revsh'	|	 'REVSH'	)	;
ROR	:	(	 'ror'	|	 'ROR'	)	;
RORS 	:	(	 'rors'	|	 'RORS'	)	;
RRX 	:	(	 'rrx'	|	 'RRX'	)	;
RRXS 	:	(	 'rrxs'	|	 'RRXS'	)	;
RSB 	:	(	 'rsb'	|	 'RSB'	)	;
RSBS 	:	(	 'rsbs'	|	 'RSBS'	)	;
SADD16 	:	(	 'sadd16'	|	 'SADD16'	)	;
SADD8 	:	(	 'sadd8'	|	 'SADD8'	)	;
SASX 	:	(	 'sasx'	|	 'SASX'	)	;
SBC 	:	(	 'sbc'	|	 'SBC'	)	;
SBCS 	:	(	 'sbcs'	|	 'SBCS'	)	;
SBFX 	:	(	 'sbfx'	|	 'SBFX'	)	;
SDIV 	:	(	 'sdiv'	|	 'SDIV'	)	;
SEL 	:	(	 'sel'	|	 'SEL'	)	;
SEV 	:	(	 'sev'	|	 'SEV'	)	;
SHADD16 	:	(	 'shadd16'	|	 'SHADD16'	)	;
SHADD8 	:	(	 'shadd8'	|	 'SHADD8'	)	;
SHASX 	:	(	 'shasx'	|	 'SHASX'	)	;
SHSAX 	:	(	 'shsax'	|	 'SHSAX'	)	;
SHSUB16 	:	(	 'shsub16'	|	 'SHSUB16'	)	;
SHSUB8 	:	(	 'shsub8'	|	 'SHSUB8'	)	;
SMLABB 	:	(	 'smlabb'	|	 'SMLABB'	)	;
SMLABT 	:	(	 'smlabt'	|	 'SMLABT'	)	;
SMLATB 	:	(	 'smlatb'	|	 'SMLATB'	)	;
SMLATT 	:	(	 'smlatt'	|	 'SMLATT'	)	;
SMLAD 	:	(	 'smlad'	|	 'SMLAD'	)	;
SMLADX 	:	(	 'smladx'	|	 'SMLADX'	)	;
SMLAL 	:	(	 'smlal'	|	 'SMLAL'	)	;
SMLALBB 	:	(	 'smlalbb'	|	 'SMLALBB'	)	;
SMLALBT 	:	(	 'smlalbt'	|	 'SMLALBT'	)	;
SMLALTB 	:	(	 'smlaltb'	|	 'SMLALTB'	)	;
SMLALTT 	:	(	 'smlaltt'	|	 'SMLALTT'	)	;
SMLALD 	:	(	 'smlald'	|	 'SMLALD'	)	;
SMLALDX 	:	(	 'smlaldx'	|	 'SMLALDX'	)	;
SMLAWB 	:	(	 'smlawb'	|	 'SMLAWB'	)	;
SMLAWT 	:	(	 'smlawt'	|	 'SMLAWT'	)	;
SMLSD 	:	(	 'smlsd'	|	 'SMLSD'	)	;
SMLSLD 	:	(	 'smlsld'	|	 'SMLSLD'	)	;
SMMLA 	:	(	 'smmla'	|	 'SMMLA'	)	;
SMMLS 	:	(	 'smmls'	|	 'SMMLS'	)	;
SMMLR 	:	(	 'smmlr'	|	 'SMMLR'	)	;
SMMUL 	:	(	 'smmul'	|	 'SMMUL'	)	;
SMMULR 	:	(	 'smmulr'	|	 'SMMULR'	)	;
SMUAD 	:	(	 'smuad'	|	 'SMUAD'	)	;
SMULBB 	:	(	 'smulbb'	|	 'SMULBB'	)	;
SMULBT 	:	(	 'smulbt'	|	 'SMULBT'	)	;
SMULTB 	:	(	 'smultb'	|	 'SMULTB'	)	;
SMULTT 	:	(	 'smultt'	|	 'SMULTT'	)	;
SMULL 	:	(	 'smull'	|	 'SMULL'	)	;
SMULWB 	:	(	 'smulwb'	|	 'SMULWB'	)	;
SMULWT 	:	(	 'smulwt'	|	 'SMULWT'	)	;
SMUSD 	:	(	 'smusd'	|	 'SMUSD'	)	;
SMUSDX 	:	(	 'smusdx'	|	 'SMUSDX'	)	;
SSAT 	:	(	 'ssat'	|	 'SSAT'	)	;
SSAT16 	:	(	 'ssat16'	|	 'SSAT16'	)	;
SSAX 	:	(	 'ssax'	|	 'SSAX'	)	;
SSUB16 	:	(	 'ssub16'	|	 'SSUB16'	)	;
SSUB8 	:	(	 'ssub8'	|	 'SSUB8'	)	;
STM 	:	(	 'stm'	|	 'STM'	)	;
STMDB 	:	(	 'stmdb'	|	 'STMDB'	)	;
STMEA 	:	(	 'stmea'	|	 'STMEA'	)	;
STMFD 	:	(	 'stmfd'	|	 'STMFD'	)	;
STMIA 	:	(	 'stmia'	|	 'STMIA'	)	;
STR 	:	(	 'str'	|	 'STR'	)	;
STRB 	:	(	 'strb'	|	 'STRB'	)	;
STRBT 	:	(	 'strbt'	|	 'STRBT'	)	;
STRD 	:	(	 'strd'	|	 'STRD'	)	;
STREX 	:	(	 'strex'	|	 'STREX'	)	;
STREXB 	:	(	 'strexb'	|	 'STREXB'	)	;
STREXH 	:	(	 'strexh'	|	 'STREXH'	)	;
STRH 	:	(	 'strh'	|	 'STRH'	)	;
STRHT 	:	(	 'strht'	|	 'STRHT'	)	;
STRT 	:	(	 'strt'	|	 'STRT'	)	;
SUB	:	(	 'sub'	|	 'SUB'	)	;
SUBS 	:	(	 'subs'	|	 'SUBS'	)	;
SUBW 	:	(	 'subw'	|	 'SUBW'	)	;
SVC 	:	(	 'svc'	|	 'SVC'	)	;
SXTAB 	:	(	 'sxtab'	|	 'SXTAB'	)	;
SXTAB16 	:	(	 'sxtab16'	|	 'SXTAB16'	)	;
SXTAH 	:	(	 'sxtah'	|	 'SXTAH'	)	;
SXTB16 	:	(	 'sxtb16'	|	 'SXTB16'	)	;
SXTB 	:	(	 'sxtb'	|	 'SXTB'	)	;
SXTH 	:	(	 'sxth'	|	 'SXTH'	)	;
TBB 	:	(	 'tbb'	|	 'TBB'	)	;
TBH 	:	(	 'tbh'	|	 'TBH'	)	;
TEQ 	:	(	 'teq'	|	 'TEQ'	)	;
TST 	:	(	 'tst'	|	 'TST'	)	;
UADD16 	:	(	 'uadd16'	|	 'UADD16'	)	;
UADD8 	:	(	 'uadd8'	|	 'UADD8'	)	;
USAX 	:	(	 'usax'	|	 'USAX'	)	;
UHADD16 	:	(	 'uhadd16'	|	 'UHADD16'	)	;
UHADD8 	:	(	 'uhadd8'	|	 'UHADD8'	)	;
UHASX 	:	(	 'uhasx'	|	 'UHASX'	)	;
UHSAX 	:	(	 'uhsax'	|	 'UHSAX'	)	;
UHSUB16 	:	(	 'uhsub16'	|	 'UHSUB16'	)	;
UHSUB8 	:	(	 'uhsub8'	|	 'UHSUB8'	)	;
UBFX 	:	(	 'ubfx'	|	 'UBFX'	)	;
UDIV 	:	(	 'udiv'	|	 'UDIV'	)	;
UMAAL 	:	(	 'umaal'	|	 'UMAAL'	)	;
UMLAL 	:	(	 'umlal'	|	 'UMLAL'	)	;
UMULL 	:	(	 'umull'	|	 'UMULL'	)	;
UQADD16 	:	(	 'uqadd16'	|	 'UQADD16'	)	;
UQADD8 	:	(	 'uqadd8'	|	 'UQADD8'	)	;
UQASX 	:	(	 'uqasx'	|	 'UQASX'	)	;
UQSAX 	:	(	 'uqsax'	|	 'UQSAX'	)	;
UQSUB16 	:	(	 'uqsub16'	|	 'UQSUB16'	)	;
UQSUB8 	:	(	 'uqsub8'	|	 'UQSUB8'	)	;
USAD8 	:	(	 'usad8'	|	 'USAD8'	)	;
USADA8 	:	(	 'usada8'	|	 'USADA8'	)	;
USAT 	:	(	 'usat'	|	 'USAT'	)	;
USAT16 	:	(	 'usat16'	|	 'USAT16'	)	;
UASX 	:	(	 'uasx'	|	 'UASX'	)	;
USUB16 	:	(	 'usub16'	|	 'USUB16'	)	;
USUB8 	:	(	 'usub8'	|	 'USUB8'	)	;
UXTAB 	:	(	 'uxtab'	|	 'UXTAB'	)	;
UXTAB16 	:	(	 'uxtab16'	|	 'UXTAB16'	)	;
UXTAH 	:	(	 'uxtah'	|	 'UXTAH'	)	;
UXTB 	:	(	 'uxtb'	|	 'UXTB'	)	;
UXTB16 	:	(	 'uxtb16'	|	 'UXTB16'	)	;
UXTH 	:	(	 'uxth'	|	 'UXTH'	)	;
VABS 	:	(	 'vabs'	|	 'VABS'	)	;
VADD 	:	(	 'vadd'	|	 'VADD'	)	;
VCMP 	:	(	 'vcmp'	|	 'VCMP'	)	;
VCMPE 	:	(	 'vcmpe'	|	 'VCMPE'	)	;
VCVT 	:	(	 'vcvt'	|	 'VCVT'	)	;
VCVTR 	:	(	 'vcvtr'	|	 'VCVTR'	)	;
VCVTB 	:	(	 'vcvtb'	|	 'VCVTB'	)	;
VCVTT 	:	(	 'vcvtt'	|	 'VCVTT'	)	;
VDIV 	:	(	 'vdiv'	|	 'VDIV'	)	;
VFMA 	:	(	 'vfma'	|	 'VFMA'	)	;
VFNMA 	:	(	 'vfnma'	|	 'VFNMA'	)	;
VFMS 	:	(	 'vfms'	|	 'VFMS'	)	;
VFNMS 	:	(	 'vfnms'	|	 'VFNMS'	)	;
VLDM 	:	(	 'vldm'	|	 'VLDM'	)	;
VLDR 	:	(	 'vldr'	|	 'VLDR'	)	;
VLMA 	:	(	 'vlma'	|	 'VLMA'	)	;
VLMS 	:	(	 'vlms'	|	 'VLMS'	)	;
VMOV 	:	(	 'vmov'	|	 'VMOV'	)	;
VMRS 	:	(	 'vmrs'	|	 'VMRS'	)	;
VMSR 	:	(	 'vmsr'	|	 'VMSR'	)	;
VMUL 	:	(	 'vmul'	|	 'VMUL'	)	;
VNEG 	:	(	 'vneg'	|	 'VNEG'	)	;
VNMLA 	:	(	 'vnmla'	|	 'VNMLA'	)	;
VNMLS 	:	(	 'vnmls'	|	 'VNMLS'	)	;
VNMUL 	:	(	 'vnmul'	|	 'VNMUL'	)	;
VPOP 	:	(	 'vpop'	|	 'VPOP'	)	;
VPUSH 	:	(	 'vpush'	|	 'VPUSH'	)	;
VSQRT 	:	(	 'vsqrt'	|	 'VSQRT'	)	;
VSTM 	:	(	 'vstm'	|	 'VSTM'	)	;
VSTR	:	(	 'vstr'	|	 'VSTR'	)	;
VSUB 	:	(	 'vsub'	|	 'VSUB'	)	;
WFE 	:	(	 'wfe'	|	 'WFE'	)	;
WFI 	:	(	 'wfi'	|	 'WFI'	)	;
SMLSDX 	:	(	 'smlsdx'	|	 'SMLSDX'	)	;
SMLSLDX 	:	(	 'smlsldx'	|	 'SMLSLDX'	)	;
SMMLAR 	:	(	 'smmlar'	|	 'SMMLAR'	)	;
SMMLSR 	:	(	 'smmlsr'	|	 'SMMLSR'	)	;
SMULLR 	:	(	 'smullr'	|	 'SMULLR'	)	;
VCVTH 	:	(	 'vcvth'	|	 'VCVTH'	)	;
VCVTTB 	:	(	 'vcvttb'	|	 'VCVTTB'	)	;
VCVTTT 	:	(	 'vcvttt'	|	 'VCVTTT'	)	;



//directives
Section : '.section';
ENTRY : 'ENTRY';
ALIGN : '.align';
THUMB : '.thumb';
PRESERVE : 'PRESERVE';
EXPORT : 'EXPORT';
IMPORT : 'IMPORT';
INCLUDE : '.include';
PROC : 'PROC';
TYPE : '.type';
GET : 'GET';

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
CODE : 'CODE';
CODEALIGN : 'CODEALIGN';
COMDEF : 'COMDEF';
COMMON : 'COMMON';
DATA : 'DATA';
FINI_ARRAY : 'FINI_ARRAY';
INIT_ARRAY : 'INIT_ARRAY';
NOALLOC : 'NOALLOC';
NOINIT : 'NOINIT';
PREINIT_ARRAY : 'PREINIT_ARRAY';
EXECUTABLE : '"x"';
WRITABLE : '"w"';
STRINGS : 'STRINGS';
SECTYPE : 'SECTYPE';
SECFLAGS : 'SECFLAGS';
MERGE : 'MERGE';
LINKORDER : 'LINKORDER';
GROUP : 'GROUP';
COMGROUP : 'COMGROUP';
ASSOC : 'ASSOC';
GLOBAL : '.global';
WORD : '.word';
TEXT : '.text';