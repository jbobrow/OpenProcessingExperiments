
/**
 * Space Junk  
 * By Ira Greenberg 
 * zoom suggestion 
 * By Danny Greenberg
 * 
 * Rotating cubes in space using
 * a custom Cube class. Color controlled 
 * by light sources.
 *
 *
 * modified to test opengl blending
 *
 *
 * animation pause,switch background color, blend mode textual output 
 * added by Claudio Midolo
 */

/*need to import opengl library to use OPENGL 
 rendering mode for hardware acceleration*/
import processing.opengl.*;
import javax.media.opengl.*;
import java.util.*;

//used for oveall rotation
float ang;

//cube count-lower/raise to test P3D/OPENGL performance
int limit = 300;

//array for all cubes
Cube[]cubes = new Cube[limit];
PGraphicsOpenGL pgl;
GL gl;

nvArray GLblendL = new nvArray();
nvArray GLblendR = new nvArray();
boolean blnDisableZTest = true;

boolean blackBackground,pause,help;

PFont font;

void setup(){
  //try substituting P3D for OPENGL 
  //argument to test performance
  size(512, 512, OPENGL);
  //hint(ENABLE_OPENGL_4X_SMOOTH) ;
  background(0); 
  frameRate(40);
  noStroke();
  //instantiate cubes, passing in random vals for size and postion
  
  color _col=color(90);
  
  
  for (int i = 0; i< cubes.length; i++){
    
    int rndmColIndex= int(random(0,3));
  
  if(rndmColIndex==0){
    
    _col=color(255,255,0);
  
  }else if(rndmColIndex==1){
    
    _col=color(255,0,255);
  
  }else if(rndmColIndex==2){
    
    _col=color(0,255,255);
  
  }
    
    
    cubes[i] = new Cube(int(random(-10, 10)), int(random(-10, 10)), 
    int(random(-10, 10)), int(random(-140, 140)), int(random(-140, 140)), 
    int(random(-140, 140)),
    _col
    );
  }

  /* setup the openGL blend enum into a name-value pair array 
   ** so that we can keep track of what we are doing         */
  GLblendL.add("GL_ZERO",GL.GL_ZERO); 	
  GLblendL.add("GL_ONE",GL.GL_ONE); 	
  GLblendL.add("GL_SRC_COLOR",GL.GL_SRC_COLOR	); 
  GLblendL.add("GL_ONE_MINUS_SRC_COLOR",GL.GL_ONE_MINUS_SRC_COLOR); 
  GLblendL.add("GL_DST_COLOR",GL.GL_DST_COLOR	); 
  GLblendL.add("GL_ONE_MINUS_DST_COLOR",GL.GL_ONE_MINUS_DST_COLOR); 	
  GLblendL.add("GL_SRC_ALPHA",GL.GL_SRC_ALPHA	); 
  GLblendL.add("GL_ONE_MINUS_SRC_ALPHA",GL.GL_ONE_MINUS_SRC_ALPHA); 	
  GLblendL.add("GL_DST_ALPHA",GL.GL_DST_ALPHA	); 
  GLblendL.add("GL_ONE_MINUS_DST_ALPHA",GL.GL_ONE_MINUS_DST_ALPHA); 	
  GLblendL.add("GL_SRC_ALPHA_SATURATE",GL.GL_SRC_ALPHA_SATURATE);  //invalid enum... wtf?	
  GLblendL.add("GL_CONSTANT_COLOR",GL.GL_CONSTANT_COLOR	); 
  GLblendL.add("GL_ONE_MINUS_CONSTANT_COLOR",GL.GL_ONE_MINUS_CONSTANT_COLOR ); 
  GLblendL.add("GL_CONSTANT_ALPHA",GL.GL_CONSTANT_ALPHA ); 
  GLblendL.add("GL_ONE_MINUS_CONSTANT_ALPHA",GL.GL_ONE_MINUS_CONSTANT_ALPHA );
  GLblendR.add("GL_ZERO",GL.GL_ZERO); 	
  GLblendR.add("GL_ONE",GL.GL_ONE); 	
  GLblendR.add("GL_SRC_COLOR",GL.GL_SRC_COLOR	); 
  GLblendR.add("GL_ONE_MINUS_SRC_COLOR",GL.GL_ONE_MINUS_SRC_COLOR); 
  GLblendR.add("GL_DST_COLOR",GL.GL_DST_COLOR	); 
  GLblendR.add("GL_ONE_MINUS_DST_COLOR",GL.GL_ONE_MINUS_DST_COLOR); 	
  GLblendR.add("GL_SRC_ALPHA",GL.GL_SRC_ALPHA	); 
  GLblendR.add("GL_ONE_MINUS_SRC_ALPHA",GL.GL_ONE_MINUS_SRC_ALPHA); 	
  GLblendR.add("GL_DST_ALPHA",GL.GL_DST_ALPHA	); 
  GLblendR.add("GL_ONE_MINUS_DST_ALPHA",GL.GL_ONE_MINUS_DST_ALPHA);
  GLblendR.add("GL_CONSTANT_COLOR",GL.GL_CONSTANT_COLOR	); 
  GLblendR.add("GL_ONE_MINUS_CONSTANT_COLOR",GL.GL_ONE_MINUS_CONSTANT_COLOR ); 
  GLblendR.add("GL_CONSTANT_ALPHA",GL.GL_CONSTANT_ALPHA ); 
  GLblendR.add("GL_ONE_MINUS_CONSTANT_ALPHA",GL.GL_ONE_MINUS_CONSTANT_ALPHA );
  println( "Blend mode : glBlendFunc( "+GLblendL.getCurrentName() +" , "+ GLblendR.getCurrentName() + " )");
  
  //Blend mode : glBlendFunc( GL_ZERO , GL_SRC_COLOR ) is multiply
  //Blend mode : glBlendFunc( GL_DST_COLOR , GL_ZERO ) is multiply check 
  //https://developer.playfirst.com/node/300
  
  //set to multiply
  GLblendL.pos=0;
  GLblendR.pos=2;
  
  //

  blackBackground=false;
  pause=false;
  help=true;
  
  font=loadFont("f.vlw");
  textFont(font,10);

}

void draw(){
  // *** blending setup *** //
  pgl = (PGraphicsOpenGL) g;
  gl = pgl.beginGL();
  if( blnDisableZTest )
    gl.glDisable(GL.GL_DEPTH_TEST);
  gl.glEnable(GL.GL_BLEND);
  gl.glBlendFunc( GLblendL.getCurrent(), GLblendR.getCurrent() );
  pgl.endGL(); 
  // ***  end blending setup *** //

  if(blackBackground){
    background(0);
  }
  else{
    background(255);
  }

  //fill(200);
  //set up some different colored lights
  pointLight(255, 255, 255, 65, 60, 100); 
  pointLight(255, 255, 255, -65, -60, -150);

  //raise overall light in scene 
  ambientLight(255, 255, 255);
  
  pushMatrix();

  /*center geometry in display windwow.
   you can change 3rd argument ('0')
   to move block group closer(+)/further(-)*/
  translate(width/2, height/2, -200+mouseX);

  //rotate around y and x axes
  rotateY(radians(ang));
  rotateX(radians(ang));

  //draw cubes
  for (int i = 0; i< cubes.length; i++){
    cubes[i].drawCube();
  }
  
  popMatrix();
  
  if(!pause){
    //used in rotate function calls above
    ang++;
  }
  
  if(blackBackground){
    fill(255);
    gl.glBlendFunc(GLblendL.getByIndex(6), GLblendL.getByIndex(0) );
  }else{
    fill(0);
    gl.glBlendFunc(GLblendL.getByIndex(10), GLblendL.getByIndex(7) );
  }
  
  
  text("Blend mode : glBlendFunc( "+GLblendL.getCurrentName() +" , "+ GLblendR.getCurrentName() + " )",10,10);
  if(help){
    text("e,d to cycle sfactor \nr,f for dfactor\nb to toggle background color\nz toggles Depth testing "+!blnDisableZTest+"\nspace toggles animation\nh toggle this help",10,height-70);
  }
  
}

void keyPressed(){
  switch( key ){
  case 'e': 
    GLblendL.next(); 
    println( "Blend mode : glBlendFunc( "+GLblendL.getCurrentName() +" , "+ GLblendR.getCurrentName() + " )");
    break;
  case 'd': 
    GLblendL.prev(); 
    println( "Blend mode : glBlendFunc( "+GLblendL.getCurrentName() +" , "+ GLblendR.getCurrentName() + " )");
    break;
  case 'r': 
    GLblendR.next(); 
    println( "Blend mode : glBlendFunc( "+GLblendL.getCurrentName() +" , "+ GLblendR.getCurrentName() + " )");
    break;
  case 'f': 
    GLblendR.prev(); 
    println( "Blend mode : glBlendFunc( "+GLblendL.getCurrentName() +" , "+ GLblendR.getCurrentName() + " )");
    break;
  case 'z': 
    blnDisableZTest =!blnDisableZTest; 
    if(blnDisableZTest)
      println( "Depth Testing Disable");
    else
      println( "Depth Testing Enabled");
    break;  
  case 'b':
    blackBackground=!blackBackground;
    break;
   case ' ':
    pause=!pause;
    break;
   case 'h':
    help=!help;
   break;
  } 

}


//simple Cube class, based on Quads
class Cube {

  //properties
  int w, h, d;
  int shiftX, shiftY, shiftZ;
  
  color col;

  //constructor
  Cube(int w, int h, int d, int shiftX, int shiftY, int shiftZ, color _col){
    this.w = w;
    this.h = h;
    this.d = d;
    this.shiftX = shiftX;
    this.shiftY = shiftY;
    this.shiftZ = shiftZ;
    
    col=_col;
  }

  /*main cube drawing method, which looks 
   more confusing than it really is. It's 
   just a bunch of rectangles drawn for 
   each cube face*/
  void drawCube(){
    
    fill(col);
    
    beginShape(QUADS);
    //front face
    vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 

    //back face
    vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, h + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, d + shiftZ);

    //left face
    vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 

    //right face
    vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, h + shiftY, d + shiftZ); 
    vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 

    //top face
    vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 

    //bottom face
    vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 
    vertex(w + shiftX, h + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, d + shiftZ); 

    endShape(); 

    //add some rotation to each box for pizazz.
    rotateY(radians(1));
    rotateX(radians(1));
    rotateZ(radians(1));
  }
}

//this is just an int name-value pair array I wrote a while back..
//i've gutted it down to the few functions i am using in this sketch
//for the sake of minimal code. however the full version is awesome.
class nvArray {
  ArrayList name = new ArrayList();
  ArrayList val = new ArrayList();
  int length;
  int pos;

  nvArray(){
    length = 0;
    pos = 0;
  }

  void add(String l_name, int l_val){
    length++;
    name.add( l_name );
    val.add( new Integer(l_val) ); 
  }

  void next(){
    pos = (pos+1 == length)? 0 : pos+1;
  }

  void prev(){
    pos = (pos-1 <0)? length-1 : pos-1;
  }

  int getCurrent(){
    return ( (Integer)val.get( pos ) ).intValue();
  }
  
  int getByIndex(int _index){
    return ( (Integer)val.get( _index ) ).intValue();
  }

  String getCurrentName(){
    return( (String)name.get( pos ) );
  }
}









