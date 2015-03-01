
import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class mundo_gris extends PApplet {

float radius = 50.8f;
int X, Y;
int nX, nY;
int delay = 16;

public void setup(){
  size( 700, 500 );
  strokeWeight( 10 );
  frameRate( 32 );
  X = width / 10;
  Y = height / 10;
  nX = X;
  nY = Y;  
}

public void draw(){
  
  radius = radius + sin( frameCount / 4 );
  
  X+=(nX-X)/delay;
  Y+=(nY-Y)/delay;
  
  background( 83 );
  
  fill( 0, 150, 184 );
  
 stroke(330); 
  
  ellipse( X, Y, radius, radius );                  
}

public void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "mundo_gris" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

