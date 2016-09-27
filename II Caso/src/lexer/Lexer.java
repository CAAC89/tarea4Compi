package lexer;
import java.util.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*; 
import java.awt.*; 
import java.awt.event.*; 
import java.io.*; 
import java_cup.runtime.*;
import java.lang.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import java_cup.*;

public class Lexer {

    public static void main(String[] args) 
    {
        String _path = "/home/luis/NetBeansProjects/Lexer/src/lexer/Lexer.flex";
        String _pathtwo = "/home/luis/NetBeansProjects/Lexer/src/lexer/Parser.cup";
        Lexereador(_path,_pathtwo);
        String dirName = null;
    }
    
    public static void Lexereador(String path, String pathtwo)
    {
        try
        {
            File _file = new File(path);
            jflex.Main.generate(_file);
            /*File _filetwo = new File(pathtwo);
            String[] _filetoo = new String[] {pathtwo};
            java_cup.Main.main(_filetoo);*/
            
        }
        catch(Exception e1)
        {
            System.out.println(e1);
        }
    }
    
}
