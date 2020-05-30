grammar arm;
//TODO сделать парсинг
compilationUnit
   : (segments )* END Identifier
   ;

segments
   : Identifier 'segments' 'para' 'public' (statement | proc)* Identifier 'ends'
   ;

proc
   : Identifier PROC (statement)* 'ret' Identifier ENDP
   ;

   //TODO список команд

statement
   : addsubstracts | logicalands | b_instr_label | b_instr_rm | adrs | arythmetics | rrxs | bfc | bfi | bkpt | cbz_cbnzs
   | clz | clrex | cmp_cmn | cmp_cmns | cpss | dmb | dsb | isb | it | ldm_stms | ldrs | ldrex | strex | ldrexb | strexb
   | ldrexh | strexh | mul | mla_mls | movs_mvn | movt
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

isb : ISB ;

it : IT ('E' | 'T' | 'EE' | 'ET' | 'TT' | 'TE' | 'EEE' | 'EET' | 'ETT' | 'TTT' | 'TTE' | 'TEE' | 'ETE' | 'TET')? ;

ldm_stms : ldm_stm cond_code register ('!')? Separator '{' register (Separator register)? '}' ;

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

msr : MSR cond_code (APSRR_nzcvq | APSR_g | APSR_nzcvqg | MSP | PSP | PRIMASK | BASEPRI| BASEPRI_MAX| FAULTMASK
| CONTROL) Separator register ;

pkhbt : PKHBT cond_code (register Separator)? register Separator register (Separator LSL constant)? ;

pkhtb : PKHTB cond_code (register Separator)? register Separator register (Separator ASR constant)? ;

push_pops : push_pop cond_code '{' register (Separator register '-' register)? (Separator register)? '}' ;

qadd_qsubs : qadd_qsub cond_code (register Separator)? register Separator register ;

// ДОП ШТУКИ
constant : '#' (Digit | Char | Hexnum);

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

   non_grouped
   : BFC
   | BFI
   | BKPT
   | CLREX
   | CLZ
   | DMB
   | DSB
   | ISB
   | MOVT
   | MOVW
   | MRS
   | MSR
   | NOP
   | QASX
   | QDADD
   | QDSUB
   | QSAX
   | RBIT
   | REV
   | REV16
   | REVSH
   | SADD16
   | SADD8
   | SASX
   | SBFX
   | SDIV
   | SEL
   | SEV
   | SHADD16
   | SHADD8
   | SHASX
   | SHSAX
   | SHSUB16
   | SHSUB8
   | SMLABB
   | SMLABT
   | SMLATB
   | SMLATT
   | SMLAD
   | SMLADX
   | SMLAL
   | SMLALBB
   | SMLALBT
   | SMLALTB
   | SMLALTT
   | SMLALD
   | SMLALDX
   | SMLAWB
   | SMLAWT
   | SMLSD
   | SMLSLD
   | SMMLA
   | SMMLS
   | SMMLR
   | SMMUL
   | SMMULR
   | SMUAD
   | SMULBB
   | SMULBT
   | SMULTB
   | SMULTT
   | SMULL
   | SMULWB
   | SMULWT
   | SMUSD
   | SMUSDX
   | SSAT
   | SSAT16
   | SSAX
   | SSUB16
   | SSUB8
   | STM
   | STMDB
   | STMEA
   | STMFD
   | STMIA
   | STRBT
   | STREX
   | STREXB
   | STREXH
   | STRHT
   | STRT
   | SVC
   | SXTAB
   | SXTAB16
   | SXTAH
   | SXTB16
   | SXTB
   | SXTH
   | TBB
   | TBH
   | TEQ
   | TST
   | UADD16
   | UADD8
   | USAX
   | UHADD16
   | UHADD8
   | UHASX
   | UHSAX
   | UHSUB16
   | UHSUB8
   | UBFX
   | UDIV
   | UMAAL
   | UMLAL
   | UMULL
   | UQADD16
   | UQADD8
   | UQASX
   | UQSAX
   | UQSUB16
   | UQSUB8
   | USAD8
   | USADA8
   | USAT
   | USAT16
   | UASX
   | USUB16
   | USUB8
   | UXTAB
   | UXTAB16
   | UXTAH
   | UXTB
   | UXTB16
   | UXTH
   | VABSF32
   | VADDF32
   | VCMPF32
   | VCMPEF32
   | VCVTS32F32
   | VCVTS16F32
   | VCVTRS32F32
   | VCVTBHF32F16
   | VCVTTBTF32F16
   | VDIVF32
   | VFMAF32
   | VFNMAF32
   | VFMSF32
   | VFNMSF32
   | VLDMF3264
   | VLDRF3264
   | VLMAF32
   | VLMSF32
   | VMOVF32
   | VMOV
   | VMRS
   | VMSR
   | VMULF32
   | VNEGF32
   | VNMLAF32
   | VNMLSF32
   | VNMUL
   | VPOP
   | VPUSH
   | VSQRTF32
   | VSTM
   | VSTRF3264
   | VSUBF3264
   | WFE
   | WFI
   | IT
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

qadd_qsub
    : QADD
    | QADD16
    | QADD8
    | QSUB
    | QSUB16
    | QSUB8 ;

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
   | END
;

ty
   : BYTE
   | SBYTE
   | DB
   | WORD
   | SWORD
   | DW
   | DWORD
   | SDWORD
   | DD
   | FWORD
   | DF
   | QWORD
   | DQ
   | TBYTE
   | DT
   | REAL4
   | REAL8
   | REAL
   ;

question: QUESTION;

Identifier : [a-z][a-zA-Z0-9_]* ;

BYTE
   : 'byte'
   ;


SBYTE
   : 'sbyte'
   ;


DB
   : 'db'
   ;


WORD
   : 'word'
   ;


SWORD
   : 'sword'
   ;


DW
   : 'dw'
   ;


DWORD
   : 'dword'
   ;


SDWORD
   : 'sdword'
   ;


DD
   : 'dd'
   ;


FWORD
   : 'fword'
   ;


DF
   : 'df'
   ;


QWORD
   : 'qword'
   ;


DQ
   : 'dq'
   ;


TBYTE
   : 'tbyte'
   ;


DT
   : 'dt'
   ;


REAL4
   : 'real4'
   ;


REAL8
   : 'real8'
   ;


REAL
   : 'real'
   ;

QUESTION
   : '?'
   ;

Hexnum
   : HexDigit + ('h' | 'H')
   ;


Octalnum
   : ('0' .. '7') + ('o' | 'O')
   ;


fragment HexDigit
   : ('0' .. '9' | 'a' .. 'f' | 'A' .. 'F')
   ;


FloatingPointLiteral
   : ('0' .. '9') + '.' ('0' .. '9')* Exponent? | '.' ('0' .. '9') + Exponent? | ('0' .. '9') + Exponent
   ;


fragment Exponent
   : ('e' | 'E') ('+' | '-')? ('0' .. '9') +
   ;


String: '"' (~'"' | '\\"')* '"';

Char : '\'' (~'\'' | '\\\'') '\'' ;

fragment Letter
   : ('a' .. 'z' | 'A' .. 'Z') ;

Digit: [0-9]+ ;

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
VABSF32 : 'VABS.F32';
VADDF32 : 'VADD.F32';
VCMPF32 : 'VCMP.F32';
VCMPEF32 : 'VCMPE.F32';
VCVTS32F32 : 'VCVT.S32.F32';
VCVTS16F32 : 'VCVT.S16.F32';
VCVTRS32F32 : 'VCVTR.S32.F32';
VCVTBHF32F16 : 'VCVT<B|H>.F32.F16';
VCVTTBTF32F16 : 'VCVTT<B|T>.F32.F16';
VDIVF32 : 'VDIV.F32';
VFMAF32 : 'VFMA.F32';
VFNMAF32 : 'VFNMA.F32';
VFMSF32 : 'VFMS.F32';
VFNMSF32 : 'VFNMS.F32';
VLDMF3264 : 'VLDM.F<32|64>';
VLDRF3264 : 'VLDR.F<32|64>';
VLMAF32 : 'VLMA.F32';
VLMSF32 : 'VLMS.F32';
VMOVF32 : 'VMOV.F32';
VMOV : 'VMOV';
VMRS : 'VMRS';
VMSR : 'VMSR';
VMULF32 : 'VMUL.F32';
VNEGF32 : 'VNEG.F32';
VNMLAF32 : 'VNMLA.F32';
VNMLSF32 : 'VNMLS.F32';
VNMUL : 'VNMUL';
VPOP : 'VPOP';
VPUSH : 'VPUSH';
VSQRTF32 : 'VSQRT.F32';
VSTM : 'VSTM';
VSTRF3264 : 'VSTR.F<32|64>';
VSUBF3264 : 'VSUB.F<32|64>';
WFE : 'WFE';
WFI : 'WFI';

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