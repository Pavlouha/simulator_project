package org.pavlouha;

import org.pavlouha.antlr4.armBaseListener;
import org.pavlouha.antlr4.armParser;

public class HelloWalker extends armBaseListener {
    public void enterR(armParser ctx ) {
        System.out.println( "Entering R : " + ctx.ID().getText() );
    }

    public void exitR(armParser.RContext ctx ) {
        System.out.println( "Exiting R" );
    }
}
