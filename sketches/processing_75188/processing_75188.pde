
import processing.core.*; 
import processing.data.*; 
import processing.opengl.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class E12 extends PApplet {

PFont font;

float x;
float y;


String txt = "Wo Fuchs und Apfel sich in den Schwanz bei\u00dfen?";

public void setup(){
  frameRate(200);
  size(1000,100);
  font= loadFont("AGaramondPro-Regular-50.vlw");
  textFont(font);
  
}


public void draw (){
  background(255);
  fill(0);
 
  

  if (x > width){
    x=-500;
  }
else{
    
  textSize(50);
  
    x=x+1;
 

  textLeading(50);
  text(txt, x, y+3, 500,300);
  
  
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "E12" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
