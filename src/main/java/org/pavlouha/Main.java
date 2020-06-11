package org.pavlouha;

import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.tree.ParseTree;
import org.antlr.v4.runtime.tree.ParseTreeWalker;

import org.pavlouha.antlr4.armListener;
import org.pavlouha.antlr4.armParser;
import org.pavlouha.antlr4.armLexer;
import org.pavlouha.antlr4.armWalker;

public class Main {
    public static void main( String[] args) throws Exception
    {
    armLexer lexer = new armLexer(CharStreams.fromFileName("main.asm"));
    try {
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        armParser parser = new armParser(tokens);
        ParseTree tree = parser.compilationUnit();
        ParseTreeWalker walker = new ParseTreeWalker();
        walker.walk(new armWalker(), tree);
    } catch (Exception e) {
        e.printStackTrace();
    }
    }
}