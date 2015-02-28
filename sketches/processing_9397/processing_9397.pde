
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
import saito.objloader.*;

import processing.opengl.*;

 
import processing.video.*;
public int pn=0;
 
public String savename ="k-obj_body-";
MovieMaker mm; 
public boolean firstpass = true;
 public int frate = 15;
public boolean inc = true;
public boolean addmovframe = true;
public boolean dovid =true;
public boolean looponce = false;
public boolean snap = true;
 
void saveget(){
  setupvid();
  if (dovid){
    if (inc){
 pn++;
    }
     
   
save("pics/"+savename+str(pn)+".png");
  }
   
   if (addmovframe){
    mm.addFrame();
   } 
   
  if (looponce){
   noLoop();
  exit(); 
  }
   
  if (keyPressed ==true && ( key=='`' || key =='~' || key == ESC)){
   mm.finish();
  exit(); 
  }
  
}
 
void setupvid(){
 if (firstpass)
 {mm = new MovieMaker(this, width, height, savename+".mov", frate, 
                     MovieMaker.ANIMATION, MovieMaker.LOSSLESS);
                      
                     if (snap){
                       save("snap"+savename+str(pn)+".png");
                     }
                     firstpass = false;
                      
                      
}
}
   
   
 void loop(){
  
       saveget();  //uncomment to save video
 
  }
  
// .OBJ Loader
// by SAITO <http://users.design.ucla.edu/~tatsuyas>
// and polymonkey <http://www.polymonkey.com>
// Placing a virtual structure represented as mathematically
// three-dimensional object.
// Model.load() reads structure data of the object stored
// as numerical data.
// Model.draw() gives a visual form to the structure data.
// processing standard drawing functions can be used to manipulate
// the visual form to create deep visual experiences.
// see void keyPressed for interaction options
// Created 20 April 2005
// Updated 22 July 2007

// declare that we need a OBJModel and we'll be calling it "model"
OBJModel model;
float rotX;
float rotY;
public boolean docellshade = true;
// these booleans will be used to turn on and off bits of the OBJModel
boolean bTexture = true;
boolean bStroke = true;
boolean bMaterial = true;

// and this is the PImage that we'll put on the model later
PImage swapToMe;
public int cnt = 0;
public float roxxy;

void setup()
{
  size(800, 600, P3D);
  cam = new PeasyCam (this,width);
  frameRate(frate);
  noStroke();

  // we'll be using this later to swap the texture on the model
  swapToMe = loadImage("UVSwap.jpg");

  // making an object called "model" that is a new instance of OBJModel
  model = new OBJModel(this);

  // turning on the debug output (it's all the stuff that spews out in the black box down the bottom)
  model.debugMode();

  // enableLocalTexture is usefull if you're modeling package uses absolute paths when pointing to the diffuse testure (like XSI)
  // see mtl file in data folder for example
  model.enableLocalTexture();

  //setting the draw mode
//  model.drawMode(TRIANGLES);
 model.drawMode(POLYGON);
  //and loading the model
 // model.load("cube_sphere_test.obj");
  model.load("body.obj");
  key='m';
  keyPressed();
//  key='9';
//   keyPressed(); 
}

void draw()
{
  background(255);
  lights();

  //this will do nothing until the model material is turned off
//fill(255,0,255);
fill(233,23,23,255);
  pushMatrix();
  translate(width/4-150, height/2+150, 0);
  rotateX(rotY);
  rotateY(rotX);
  rotateY(radians(roxxy));
  scale(2);

  // draw the pretty model
  model.draw();
  if (docellshade){
  translate(0,0,1);
  fill(1,111);
   model.draw();
  translate(0,0,-1);
  
  translate(0,0,-2);
  fill(1,111);
   model.draw();
  translate(0,0,2);
  }

  popMatrix();
 // loop(); //uncomment to save
 roxxy+=1;
}

void keyPressed(){
  // turns on and off the texture listed in .mtl file
  if(key == 't'){
    if(!bTexture){
      model.enableTexture();
      bTexture = true;
    } 
    else {
      model.disableTexture();
      bTexture = false;
    }
  }

  else if(key == 'm'){
    // turns on and off the material listed in .mtl file
    if(!bMaterial){
      model.enableMaterial();
      bMaterial = true;
    } 
    else {
      model.disableMaterial();
      bMaterial = false;
    }
  }

  else if(key == 's'){
    if(!bStroke){
      stroke(10, 10, 10);
      bStroke = true;
    } 
    else{
      noStroke();
      bStroke = false;
    }
  }

  else if(key == 'c'){
    //clears loaded model
    model.clear();
    model.showModelInfo();
  }

  else if(key == 'r'){
    // will reload the model
    // without clearing the model first the data is added to the end of the last load
    // this is going to look bad (unless you're into glitch art)
    // so before load, clear the model
  //  model.load("cube_sphere_test.obj");
    model.load("body.obj");
    model.showModelInfo();
  }

  else if(key == 'p'){
    // swaps the texture that was loaded from the mtl file to a PImage
    model.setTexture(swapToMe);
  }

  else if(key == 'o'){
    // sets the texture back to the original image
    model.originalTexture();
  }

  // the follwing changes the render modes
  // POINTS mode is a little flakey in OPENGL (known processing bug)
  // the best one to use is the one you exported the obj as
  // when in doubt try TRIANGLES or POLYGON
  else if(key=='1'){
    stroke(10, 10, 10);
    bStroke = true;
    model.drawMode(POINTS);
  }

  else if(key=='2'){
    stroke(10, 10, 10);
    bStroke = true;
    model.drawMode(LINES);
  }

  else if(key=='3'){
    model.drawMode(TRIANGLES);
  }

  else if(key=='4'){
    model.drawMode(POLYGON);
  }

  else if(key=='5'){
    model.drawMode(TRIANGLE_STRIP);
  }

  else if(key=='6'){
    model.drawMode(QUADS);
  }

  else if(key=='7'){
    model.drawMode(QUAD_STRIP);
  }
   else if(key=='8'){
     noStroke();
  //  model.drawMode(QUAD_STRIP);
  }
  else if(key=='9'){
    stroke(1);
  //  model.drawMode(QUAD_STRIP);
  }
  
  if (key=='d')docellshade = !docellshade ;
  if (key =='s'){
    smooth();
  }
  
  if (key =='S'){
    noSmooth();
  } 
   if (!online && key=='V')save(str(cnt)+".png"); 
  cnt++;
}

//void mouseDragged()
//{
//  rotX += (mouseX - pmouseX) * 0.01;
//  rotY -= (mouseY - pmouseY) * 0.01;
//}

