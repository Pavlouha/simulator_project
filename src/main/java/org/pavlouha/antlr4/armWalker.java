package org.pavlouha.antlr4;
//TODO поработать с выводом
public class armWalker extends  armBaseListener {
    public void enter(armParser.CompilationUnitContext ctx ) {
        System.out.println( "Вводим: " + ctx.getText() );
    }

    public void exit(armParser.CompilationUnitContext ctx ) {
        System.out.println( "Конец файла" );
    }
}
