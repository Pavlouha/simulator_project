grammar arm;

//некоторые штуки могут быть не рабочими
compilationUnit : params (section )* END ;

params : (syntax | thumb | cpu)* ;

syntax: SYNTAX Identifier;

thumb : THUMB ;

cpu : CPU Identifier ;

section
   : Section (TEXT) (Separator section_flags)? (section_params| statement | function | id)* ;

section_params : stack | reset_command ;

reset_command: WORD Identifier ('+'| '-') '1';

stack: WORD Hexnum;

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

vstr : VSTR cond_code (('.F32')? s_register offset | ('.F64')? s_register Separator offset ); //каво

vsub : VSUB cond_code '.F32' (s_register Separator)? s_register Separator s_register ;

wfe : WFE cond_code ;

wfi : WFI cond_code ;

// ДОП ШТУКИ
constant : '#' (Decimalnum | Char | Hexnum);

second_operand : constant | register (Separator optional_shift constant)? | register Separator RRX ;

offset : '[' register (Separator constant)? ']' ;

offset_all : '[' register Separator constant ']' ;

id : Identifier Colon statement;

section_flags : '"a"' | '"e"' | WRITABLE | EXECUTABLE | '"M"' | '"S"' | '"G"' | '"T"' | '"?"'  ;

sectype: SECTYPE Decimalnum;

secflags: SECFLAGS Decimalnum;

merge: MERGE Decimalnum;

linkorder: LINKORDER Identifier;

group: GROUP Identifier;

comgroup: COMGROUP Identifier;

assoc: ASSOC Identifier;

align: BALIGN Decimalnum;

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
   : Bi
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
   : BALIGN
   | GLOBAL
   | INCLUDE
   | TEXT
   | SYNTAX
   | WORD;


Identifier : [a-z][a-zA-Z0-9_-]* ;

Hexnum : '0x' HexDigit + ;

Decimalnum : Digit (Digit)* ;

fragment HexDigit : ('0' .. '9' | 'A' .. 'F') ;

FloatingPointLiteral
   : ('0' .. '9') + '.' ('0' .. '9')* Exponent? | '.' ('0' .. '9') + Exponent? | ('0' .. '9') + Exponent ;

fragment Exponent : ('e' | 'E') ('+' | '-')? ('0' .. '9') + ;

String: '"' (~'"' | '\\"')* '"';

Char : '\'' (~'\'' | '\\\'') '\'' ;

fragment Digit :'0'..'9' ;

Colon: ':';

Separator: ',';

WS : [\t\r\n\f ]+ -> skip ;

LINE_COMMENT :   ( '@' ~[\r\n]* '\r'? '\n'	| '/*' .*? '*/'	) -> skip ;

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
PC : '.';

PSR : 'PSR';
PRIMASK : 'PRIMASK';
FAULTMASK : 'FAULTMASK';
BASEPRI : 'BASEPRI';
CONTROL : 'CONTROL';

//commands
ADC	:	A	D	C					;
ADD	:	A	D	D					;
ADCS 	:	A	D	C	S	 			;
ADDS 	:	A	D	D	S	 			;
ADDW 	:	A	D	D	W	 			;
ADR 	:	A	D	R	 				;
AND 	:	A	N	D	 				;
ANDS 	:	A	N	D	S	 			;
ASR 	:	A	S	R	 				;
ASRS 	:	A	S	R	S	 			;
Bi 	:	B	 						;
BFC 	:	B	F	C	 				;
BFI 	:	B	F	I	 				;
BIC 	:	B	I	C	 				;
BICS 	:	B	I	C	S	 			;
BKPT 	:	B	K	P	T	 			;
BL 	:	B	L	 					;
BLX 	:	B	L	X	 				;
BX 	:	B	X	 					;
CBNZ 	:	C	B	N	Z	 			;
CBZ 	:	C	B	Z	 				;
CLREX 	:	C	L	R	E	X	 		;
CLZ 	:	C	L	Z	 				;
CMN 	:	C	M	N	 				;
CMP	:	C	M	P					;
CPSID 	:	C	P	S	I	D	 		;
CPSIE 	:	C	P	S	I	E	 		;
DMB 	:	D	M	B	 				;
DSB 	:	D	S	B	 				;
EOR 	:	E	O	R	 				;
EORS 	:	E	O	R	S	 			;
ISB 	:	I	S	B	 				;
IT 	:	I	T	 					;
LDM 	:	L	D	M	 				;
LDMDB 	:	L	D	M	D	B	 		;
LDMEA 	:	L	D	M	E	A	 		;
LDMFD 	:	L	D	M	F	D	 		;
LDMIA 	:	L	D	M	I	A	 		;
LDR 	:	L	D	R	 				;
LDRB 	:	L	D	R	B	 			;
LDRBT 	:	L	D	R	B	T	 		;
LDRD 	:	L	D	R	D	 			;
LDREX 	:	L	D	R	E	X	 		;
LDREXB 	:	L	D	R	E	X	B	 	;
LDREXH 	:	L	D	R	E	X	H	 	;
LDRH 	:	L	D	R	H	 			;
LDRHT 	:	L	D	R	H	T	 		;
LDRSB 	:	L	D	R	S	B	 		;
LDRSBT 	:	L	D	R	S	B	T	 	;
LDRSH 	:	L	D	R	S	H	 		;
LDRSHT 	:	L	D	R	S	H	T	 	;
LDRT 	:	L	D	R	T	 			;
LSL 	:	L	S	L	 				;
LSLS 	:	L	S	L	S	 			;
LSR 	:	L	S	R	 				;
LSRS 	:	L	S	R	S	 			;
MLA 	:	M	L	A	 				;
MLS 	:	M	L	S	 				;
MOV	:	M	O	V					;
MOVS	:	M	O	V	S				;
MOVT 	:	M	O	V	T	 			;
MOVW 	:	M	O	V	W	 			;
MRS 	:	M	R	S	 				;
MSR 	:	M	S	R	 				;
MUL	:	M	U	L					;
MULS 	:	M	U	L	S	 			;
MVN 	:	M	V	N	 				;
MVNS 	:	M	V	N	S	 			;
NOP 	:	N	O	P	 				;
ORN 	:	O	R	N	 				;
ORNS 	:	O	R	N	S	 			;
ORR 	:	O	R	R	 				;
ORRS 	:	O	R	R	S	 			;
PKHTB 	:	P	K	H	T	B	 		;
PKHBT 	:	P	K	H	B	T	 		;
POP	:	P	O	P					;
PUSH	:	P	U	S	H				;
QADD 	:	Q	A	D	D	 			;
QADD16 	:	Q	A	D	D	'16'	 	;
QADD8 	:	Q	A	D	D	'8'	 		;
QASX 	:	Q	A	S	X	 			;
QDADD 	:	Q	D	A	D	D	 		;
QDSUB 	:	Q	D	S	U	B	 		;
QSAX 	:	Q	S	A	X	 			;
QSUB 	:	Q	S	U	B	 			;
QSUB16 	:	Q	S	U	B	'16'	 	;
QSUB8 	:	Q	S	U	B	'8'	 		;
RBIT 	:	R	B	I	T	 			;
REV 	:	R	E	V	 				;
REV16 	:	R	E	V	'16'	 		;
REVSH 	:	R	E	V	S	H	 		;
ROR	:	R	O	R					;
RORS 	:	R	O	R	S	 			;
RRX 	:	R	R	X	 				;
RRXS 	:	R	R	X	S	 			;
RSB 	:	R	S	B	 				;
RSBS 	:	R	S	B	S	 			;
SADD16 	:	S	A	D	D	'16'	 	;
SADD8 	:	S	A	D	D	'8'	 		;
SASX 	:	S	A	S	X	 			;
SBC 	:	S	B	C	 				;
SBCS 	:	S	B	C	S	 			;
SBFX 	:	S	B	F	X	 			;
SDIV 	:	S	D	I	V	 			;
SEL 	:	S	E	L	 				;
SEV 	:	S	E	V	 				;
SHADD16 	:	S	H	A	D	D	'16'	;
SHADD8 	:	S	H	A	D	D	'8'	 	;
SHASX 	:	S	H	A	S	X	 		;
SHSAX 	:	S	H	S	A	X	 		;
SHSUB16 	:	S	H	S	U	B	'16'	;
SHSUB8 	:	S	H	S	U	B	'8'	 	;
SMLABB 	:	S	M	L	A	B	B	 	;
SMLABT 	:	S	M	L	A	B	T	 	;
SMLATB 	:	S	M	L	A	T	B	 	;
SMLATT 	:	S	M	L	A	T	T	 	;
SMLAD 	:	S	M	L	A	D	 		;
SMLADX 	:	S	M	L	A	D	X	 	;
SMLAL 	:	S	M	L	A	L	 		;
SMLALBB 	:	S	M	L	A	L	B	B	;
SMLALBT 	:	S	M	L	A	L	B	T	;
SMLALTB 	:	S	M	L	A	L	T	B	;
SMLALTT 	:	S	M	L	A	L	T	T	;
SMLALD 	:	S	M	L	A	L	D	 	;
SMLALDX 	:	S	M	L	A	L	D	X	;
SMLAWB 	:	S	M	L	A	W	B	 	;
SMLAWT 	:	S	M	L	A	W	T	 	;
SMLSD 	:	S	M	L	S	D	 		;
SMLSLD 	:	S	M	L	S	L	D	 	;
SMMLA 	:	S	M	M	L	A	 		;
SMMLS 	:	S	M	M	L	S	 		;
SMMLR 	:	S	M	M	L	R	 		;
SMMUL 	:	S	M	M	U	L	 		;
SMMULR 	:	S	M	M	U	L	R	 	;
SMUAD 	:	S	M	U	A	D	 		;
SMULBB 	:	S	M	U	L	B	B	 	;
SMULBT 	:	S	M	U	L	B	T	 	;
SMULTB 	:	S	M	U	L	T	B	 	;
SMULTT 	:	S	M	U	L	T	T	 	;
SMULL 	:	S	M	U	L	L	 		;
SMULWB 	:	S	M	U	L	W	B	 	;
SMULWT 	:	S	M	U	L	W	T	 	;
SMUSD 	:	S	M	U	S	D	 		;
SMUSDX 	:	S	M	U	S	D	X	 	;
SSAT 	:	S	S	A	T	 			;
SSAT16 	:	S	S	A	T	'16'	 	;
SSAX 	:	S	S	A	X	 			;
SSUB16 	:	S	S	U	B	'16'	 	;
SSUB8 	:	S	S	U	B	'8'	 		;
STM 	:	S	T	M	 				;
STMDB 	:	S	T	M	D	B	 		;
STMEA 	:	S	T	M	E	A	 		;
STMFD 	:	S	T	M	F	D	 		;
STMIA 	:	S	T	M	I	A	 		;
STR 	:	S	T	R	 				;
STRB 	:	S	T	R	B	 			;
STRBT 	:	S	T	R	B	T	 		;
STRD 	:	S	T	R	D	 			;
STREX 	:	S	T	R	E	X	 		;
STREXB 	:	S	T	R	E	X	B	 	;
STREXH 	:	S	T	R	E	X	H	 	;
STRH 	:	S	T	R	H	 			;
STRHT 	:	S	T	R	H	T	 		;
STRT 	:	S	T	R	T	 			;
SUB	:	S	U	B					;
SUBS 	:	S	U	B	S	 			;
SUBW 	:	S	U	B	W	 			;
SVC 	:	S	V	C	 				;
SXTAB 	:	S	X	T	A	B	 		;
SXTAB16 	:	S	X	T	A	B	'16'	;
SXTAH 	:	S	X	T	A	H	 		;
SXTB16 	:	S	X	T	B	'16'	 	;
SXTB 	:	S	X	T	B	 			;
SXTH 	:	S	X	T	H	 			;
TBB 	:	T	B	B	 				;
TBH 	:	T	B	H	 				;
TEQ 	:	T	E	Q	 				;
TST 	:	T	S	T	 				;
UADD16 	:	U	A	D	D	'16'	 	;
UADD8 	:	U	A	D	D	'8'	 		;
USAX 	:	U	S	A	X	 			;
UHADD16 	:	U	H	A	D	D	'16'	;
UHADD8 	:	U	H	A	D	D	'8'	 	;
UHASX 	:	U	H	A	S	X	 		;
UHSAX 	:	U	H	S	A	X	 		;
UHSUB16 	:	U	H	S	U	B	'16'	;
UHSUB8 	:	U	H	S	U	B	'8'	 	;
UBFX 	:	U	B	F	X	 			;
UDIV 	:	U	D	I	V	 			;
UMAAL 	:	U	M	A	A	L	 		;
UMLAL 	:	U	M	L	A	L	 		;
UMULL 	:	U	M	U	L	L	 		;
UQADD16 	:	U	Q	A	D	D	'16'	;
UQADD8 	:	U	Q	A	D	D	'8'	 	;
UQASX 	:	U	Q	A	S	X	 		;
UQSAX 	:	U	Q	S	A	X	 		;
UQSUB16 	:	U	Q	S	U	B	'16'	;
UQSUB8 	:	U	Q	S	U	B	'8'	 	;
USAD8 	:	U	S	A	D	'8'	 		;
USADA8 	:	U	S	A	D	A	'8'	 	;
USAT 	:	U	S	A	T	 			;
USAT16 	:	U	S	A	T	'16'	 	;
UASX 	:	U	A	S	X	 			;
USUB16 	:	U	S	U	B	'16'	 	;
USUB8 	:	U	S	U	B	'8'	 		;
UXTAB 	:	U	X	T	A	B	 		;
UXTAB16 	:	U	X	T	A	B	'16'	;
UXTAH 	:	U	X	T	A	H	 		;
UXTB 	:	U	X	T	B	 			;
UXTB16 	:	U	X	T	B	'16'	 	;
UXTH 	:	U	X	T	H	 			;
VABS 	:	V	A	B	S	 			;
VADD 	:	V	A	D	D	 			;
VCMP 	:	V	C	M	P	 			;
VCMPE 	:	V	C	M	P	E	 		;
VCVT 	:	V	C	V	T	 			;
VCVTR 	:	V	C	V	T	R	 		;
VCVTB 	:	V	C	V	T	B	 		;
VCVTT 	:	V	C	V	T	T	 		;
VDIV 	:	V	D	I	V	 			;
VFMA 	:	V	F	M	A	 			;
VFNMA 	:	V	F	N	M	A	 		;
VFMS 	:	V	F	M	S	 			;
VFNMS 	:	V	F	N	M	S	 		;
VLDM 	:	V	L	D	M	 			;
VLDR 	:	V	L	D	R	 			;
VLMA 	:	V	L	M	A	 			;
VLMS 	:	V	L	M	S	 			;
VMOV 	:	V	M	O	V	 			;
VMRS 	:	V	M	R	S	 			;
VMSR 	:	V	M	S	R	 			;
VMUL 	:	V	M	U	L	 			;
VNEG 	:	V	N	E	G	 			;
VNMLA 	:	V	N	M	L	A	 		;
VNMLS 	:	V	N	M	L	S	 		;
VNMUL 	:	V	N	M	U	L	 		;
VPOP 	:	V	P	O	P	 			;
VPUSH 	:	V	P	U	S	H	 		;
VSQRT 	:	V	S	Q	R	T	 		;
VSTM 	:	V	S	T	M	 			;
VSTR	:	V	S	T	R				;
VSUB 	:	V	S	U	B	 			;
WFE 	:	W	F	E	 				;
WFI 	:	W	F	I	 				;
SMLSDX 	:	S	M	L	S	D	X	 	;
SMLSLDX 	:	S	M	L	S	L	D	X	;
SMMLAR 	:	S	M	M	L	A	R	 	;
SMMLSR 	:	S	M	M	L	S	R	 	;
SMULLR 	:	S	M	U	L	L	R	 	;
VCVTH 	:	V	C	V	T	H	 		;
VCVTTB 	:	V	C	V	T	T	B	 	;
VCVTTT 	:	V	C	V	T	T	T	 	;





//directives
Section : '.section';
BALIGN : '.balign';
THUMB : '.thumb';
ARM : '.arm';
CODE32 : '.code32' ;
CODE16 : '.code16' ;
INCLUDE : '.include';
TYPE : '.type';
GLOBAL : '.global';
EQU : '.equ';
INCBIN : '.incbin' ;
PRINT : '.print';


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
TEXT : '.text';
//operators
OR : '|';
AND_logical : 'AND';
NOT : '~' ;
SHL : '<<' ;
SHR : '>>';
//conditional directives
cond_directives : IF | IFDEF | IFNOTDEF | ELSE | ELSEIF | ENDIF ;
IF : '.if';
IFDEF : '.ifdef';
IFNOTDEF: '.ifnotdef';
ELSE : '.else';
ELSEIF : '.elseif' ;
ENDIF : '.endif';
END : '.end';
// data directives
BYTE : '.byte';
HALFWORD : '.hword';
WORD : '.word';
QUAD : '.quad';
SPACE : '.space';
//symbol definition
SET : '.set';
FOO : 'foo';
SYNTAX : '.syntax';

// буквовки
fragment A:('a'|'A');
fragment B:('b'|'B');
fragment C:('c'|'C');
fragment D:('d'|'D');
fragment E:('e'|'E');
fragment F:('f'|'F');
fragment G:('g'|'G');
fragment H:('h'|'H');
fragment I:('i'|'I');
fragment J:('j'|'J');
fragment K:('k'|'K');
fragment L:('l'|'L');
fragment M:('m'|'M');
fragment N:('n'|'N');
fragment O:('o'|'O');
fragment P:('p'|'P');
fragment Q:('q'|'Q');
fragment R:('r'|'R');
fragment S:('s'|'S');
fragment T:('t'|'T');
fragment U:('u'|'U');
fragment V:('v'|'V');
fragment W:('w'|'W');
fragment X:('x'|'X');
fragment Y:('y'|'Y');
fragment Z:('z'|'Z');
CPU : '.cpu';