// Generated from C:/Users/pav5a/Desktop/simulator_project/src/main/java/org/pavlouha/antlr4\arm.g4 by ANTLR 4.8
package org.pavlouha.antlr4;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link armParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface armVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link armParser#compilationUnit}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCompilationUnit(armParser.CompilationUnitContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#params}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitParams(armParser.ParamsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#syntax}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSyntax(armParser.SyntaxContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#thumb}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitThumb(armParser.ThumbContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#cpu}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCpu(armParser.CpuContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#section}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSection(armParser.SectionContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#section_params}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSection_params(armParser.Section_paramsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#reset_command}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitReset_command(armParser.Reset_commandContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#stack}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStack(armParser.StackContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#function}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFunction(armParser.FunctionContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#statement}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStatement(armParser.StatementContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#addsubstracts}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAddsubstracts(armParser.AddsubstractsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#logicalands}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogicalands(armParser.LogicalandsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#adrs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAdrs(armParser.AdrsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#arythmetics}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArythmetics(armParser.ArythmeticsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#rrxs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRrxs(armParser.RrxsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#b_instr_label}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitB_instr_label(armParser.B_instr_labelContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#b_instr_rm}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitB_instr_rm(armParser.B_instr_rmContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#bfc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBfc(armParser.BfcContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#bfi}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBfi(armParser.BfiContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#bkpt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitBkpt(armParser.BkptContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#cbz_cbnzs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCbz_cbnzs(armParser.Cbz_cbnzsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#clrex}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClrex(armParser.ClrexContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#clz}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitClz(armParser.ClzContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#cmp_cmns}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCmp_cmns(armParser.Cmp_cmnsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#cpss}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCpss(armParser.CpssContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#dmb}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDmb(armParser.DmbContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#dsb}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDsb(armParser.DsbContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#isb}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIsb(armParser.IsbContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#it}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitIt(armParser.ItContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ldm_stms}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLdm_stms(armParser.Ldm_stmsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ldrs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLdrs(armParser.LdrsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ldrex}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLdrex(armParser.LdrexContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#strex}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStrex(armParser.StrexContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ldrexb}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLdrexb(armParser.LdrexbContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#strexb}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStrexb(armParser.StrexbContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ldrexh}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLdrexh(armParser.LdrexhContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#strexh}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitStrexh(armParser.StrexhContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#mul}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMul(armParser.MulContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#mla_mls}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMla_mls(armParser.Mla_mlsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#movs_mvn}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMovs_mvn(armParser.Movs_mvnContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#movt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMovt(armParser.MovtContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#mrs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMrs(armParser.MrsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#msr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMsr(armParser.MsrContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#pkhbt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPkhbt(armParser.PkhbtContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#pkhtb}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPkhtb(armParser.PkhtbContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#push_pops}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPush_pops(armParser.Push_popsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#qadd_qsubs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQadd_qsubs(armParser.Qadd_qsubsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#qasx_qsaxs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQasx_qsaxs(armParser.Qasx_qsaxsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#qdadd_qdsubs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQdadd_qdsubs(armParser.Qdadd_qdsubsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#revs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRevs(armParser.RevsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sadds}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSadds(armParser.SaddsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sasx_ssax}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSasx_ssax(armParser.Sasx_ssaxContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sbfx_ubfx}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSbfx_ubfx(armParser.Sbfx_ubfxContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sdiv_udiv}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSdiv_udiv(armParser.Sdiv_udivContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sel}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSel(armParser.SelContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sev}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSev(armParser.SevContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#shadd}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitShadd(armParser.ShaddContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#shasx_shsax}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitShasx_shsax(armParser.Shasx_shsaxContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#shsub}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitShsub(armParser.ShsubContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#smlas}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSmlas(armParser.SmlasContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#smlad}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSmlad(armParser.SmladContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#umulls}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUmulls(armParser.UmullsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#smlsds}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSmlsds(armParser.SmlsdsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#smmlas}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSmmlas(armParser.SmmlasContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#smull}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSmull(armParser.SmullContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#smulwb}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSmulwb(armParser.SmulwbContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#smusd}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSmusd(armParser.SmusdContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ssat_usat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSsat_usat(armParser.Ssat_usatContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ssat_usat16}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSsat_usat16(armParser.Ssat_usat16Context ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ssub8_16}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSsub8_16(armParser.Ssub8_16Context ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#svc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSvc(armParser.SvcContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sxta_uxtas}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSxta_uxtas(armParser.Sxta_uxtasContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sxt_uxts}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSxt_uxts(armParser.Sxt_uxtsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#tbb}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTbb(armParser.TbbContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#tbh}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTbh(armParser.TbhContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#tst_teq}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTst_teq(armParser.Tst_teqContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#uadd8_16}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUadd8_16(armParser.Uadd8_16Context ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#uhasx_uhsax}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUhasx_uhsax(armParser.Uhasx_uhsaxContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#uhsub8_16}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUhsub8_16(armParser.Uhsub8_16Context ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#uqadd_uqsubs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUqadd_uqsubs(armParser.Uqadd_uqsubsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#uqasx_uqsax}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUqasx_uqsax(armParser.Uqasx_uqsaxContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#usad8}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUsad8(armParser.Usad8Context ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#usada8}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUsada8(armParser.Usada8Context ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#uasx_usax}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUasx_usax(armParser.Uasx_usaxContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#usub8_16}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUsub8_16(armParser.Usub8_16Context ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vabs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVabs(armParser.VabsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vadd}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVadd(armParser.VaddContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vcmp_vcmpe}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVcmp_vcmpe(armParser.Vcmp_vcmpeContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vcvt_vcvtr32}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVcvt_vcvtr32(armParser.Vcvt_vcvtr32Context ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vcvt16}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVcvt16(armParser.Vcvt16Context ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vcvtb_vcvtts}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVcvtb_vcvtts(armParser.Vcvtb_vcvttsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vdiv}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVdiv(armParser.VdivContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vfma_vfms}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVfma_vfms(armParser.Vfma_vfmsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vfnma_vfnms}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVfnma_vfnms(armParser.Vfnma_vfnmsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vldm}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVldm(armParser.VldmContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vldr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVldr(armParser.VldrContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vlma_vlms}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVlma_vlms(armParser.Vlma_vlmsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vmov_immediate}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVmov_immediate(armParser.Vmov_immediateContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vmov_register}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVmov_register(armParser.Vmov_registerContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vmov_scalar}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVmov_scalar(armParser.Vmov_scalarContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vmov_arm_core}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVmov_arm_core(armParser.Vmov_arm_coreContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vmov_two_arm}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVmov_two_arm(armParser.Vmov_two_armContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vmov_arm_scalar}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVmov_arm_scalar(armParser.Vmov_arm_scalarContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vmrs}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVmrs(armParser.VmrsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vmsr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVmsr(armParser.VmsrContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vmul}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVmul(armParser.VmulContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vneg}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVneg(armParser.VnegContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vnmla_vnmls}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVnmla_vnmls(armParser.Vnmla_vnmlsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vnmul}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVnmul(armParser.VnmulContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vpop}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVpop(armParser.VpopContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vpush}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVpush(armParser.VpushContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vsqrt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVsqrt(armParser.VsqrtContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vstm}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVstm(armParser.VstmContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vstr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVstr(armParser.VstrContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vsub}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVsub(armParser.VsubContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#wfe}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWfe(armParser.WfeContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#wfi}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitWfi(armParser.WfiContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#constant}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitConstant(armParser.ConstantContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#second_operand}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSecond_operand(armParser.Second_operandContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#offset}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOffset(armParser.OffsetContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#offset_all}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOffset_all(armParser.Offset_allContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#id}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitId(armParser.IdContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#section_flags}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSection_flags(armParser.Section_flagsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sectype}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSectype(armParser.SectypeContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#secflags}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSecflags(armParser.SecflagsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#merge}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMerge(armParser.MergeContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#linkorder}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLinkorder(armParser.LinkorderContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#group}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitGroup(armParser.GroupContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#comgroup}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitComgroup(armParser.ComgroupContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#assoc}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAssoc(armParser.AssocContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#align}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAlign(armParser.AlignContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#cond_code}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCond_code(armParser.Cond_codeContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#register}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRegister(armParser.RegisterContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#s_register}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitS_register(armParser.S_registerContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#optional_shift}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitOptional_shift(armParser.Optional_shiftContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#addsubstract}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitAddsubstract(armParser.AddsubstractContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#logicaland}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLogicaland(armParser.LogicalandContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#arythmetic}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitArythmetic(armParser.ArythmeticContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#rrx}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRrx(armParser.RrxContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#b_instr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitB_instr(armParser.B_instrContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#cbz_cbnz}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCbz_cbnz(armParser.Cbz_cbnzContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#cmp_cmn}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCmp_cmn(armParser.Cmp_cmnContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#cps}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCps(armParser.CpsContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ldm_stm}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLdm_stm(armParser.Ldm_stmContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ldr_str}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitLdr_str(armParser.Ldr_strContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#multiply}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMultiply(armParser.MultiplyContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#mla}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMla(armParser.MlaContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#mov_mvn}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitMov_mvn(armParser.Mov_mvnContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#push_pop}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitPush_pop(armParser.Push_popContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#qadd}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQadd(armParser.QaddContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#qasx_qsax}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQasx_qsax(armParser.Qasx_qsaxContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#qdadd_qdsub}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitQdadd_qdsub(armParser.Qdadd_qdsubContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#rev}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitRev(armParser.RevContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sadd}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSadd(armParser.SaddContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#smla}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSmla(armParser.SmlaContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#umull}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUmull(armParser.UmullContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#smlsd}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSmlsd(armParser.SmlsdContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#smmla}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSmmla(armParser.SmmlaContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#ssat}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSsat(armParser.SsatContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sxta_uxta}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSxta_uxta(armParser.Sxta_uxtaContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#sxt_uxt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitSxt_uxt(armParser.Sxt_uxtContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#uqadd_uqsub}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitUqadd_uqsub(armParser.Uqadd_uqsubContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vcvt_vcvtr}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVcvt_vcvtr(armParser.Vcvt_vcvtrContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#vcvtt}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitVcvtt(armParser.VcvttContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#directives}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitDirectives(armParser.DirectivesContext ctx);
	/**
	 * Visit a parse tree produced by {@link armParser#cond_directives}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCond_directives(armParser.Cond_directivesContext ctx);
}