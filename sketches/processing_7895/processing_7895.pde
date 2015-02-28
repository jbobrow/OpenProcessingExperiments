
import peasy.org.apache.commons.math.*;
import peasy.*;
import peasy.org.apache.commons.math.geometry.*;
PeasyCam cam;
/**
 * Zoom. 
 * 
 * Move the cursor over the image to alter its position. Click and press
 * the mouse to zoom and set the density of the matrix by typing numbers 1-5.
 * This program displays a series of lines with their heights corresponding to 
 * a color value read from an image. 
 */
 import processing.opengl.*;
import codeanticode.glgraphics.*;
PImage img,img2;
//boolean onetime = true;
int[][] imgPixels;
float sval = 1.0;
float nmx, nmy;
int res = 5;
//public String file = "window.jpg";
//public String file = "2z.png";
//public String file = "6stressfree.png";
public String file = "snap2.png";

//public String file = "flyingfish1.png";
void setup() 
{
 size(640, 360, P3D);
 loadPixels();
//  size(640,360,OPENGL);
 // smooth();
  
  frameRate(3000);
  cam = new PeasyCam (this,width);
  noFill();
  lights();
  stroke(255);
 // img = loadImage("processingmoney.png");
 img = loadImage(file);
  img.filter(GRAY);
  img2 = loadImage(file);
// size(img.height,img.width,P3D); 
  imgPixels = new int[img.width][img.height];
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      imgPixels[j][i] = img.get(j, i);
    }
  }
}

public int snapcount =99;
void refresh(){
  file="snap-"+str(snapcount)+".png";
  img = loadImage(file);
  img.filter(GRAY);
  img2 = loadImage(file);
  
// size(img.height,img.width,P3D); 
  imgPixels = new int[img.width][img.height];
  for (int i = 0; i < img.height; i++) {
    for (int j = 0; j < img.width; j++) {
      color t = img2.get(j, i);
      imgPixels[j][i] = t;
      float rr = red(t);
      float gg = green(t);
      float bb = blue(t);
      
    //  set(j,i,color(rr,gg,bb,15));
    //if(i
    pixels[j+width*i]=color(rr,gg,bb,15);
      
    }
  }
  snapcount--;
  if (snapcount<2){
   snapcount=99; 
  }
  
}
void draw() 
{
//    file="c:\\homebase\\sss\\pop.png";
//    if (img!=null){
//  img = loadImage(file);
//  img.filter(GRAY);
//  img2 = loadImage(file);
//    }
// if (img==null){
//   file = "snap2.png";
//  img = loadImage(file);
//  img.filter(GRAY);
//  img2 = loadImage(file);
//    }   
    
 if (!online) this.frame.setTitle("Framerate : "+str(frameRate));
  background(75);

  nmx = nmx + (mouseX-nmx)/20; 
  nmy += (mouseY-nmy)/20; 

  if(mousePressed) { 
    sval += 0.005; 
  } 
  else {
    sval -= 0.01; 
  }

  sval = constrain(sval, 1.0, 2.5);

//  translate(width/2 + nmx * sval-100, height/2 + nmy*sval - 200, -50);
//  scale(sval);
 // rotateZ(PI/9 - sval + 1.0);
//  rotateX(PI/sval/8 - 0.125);
 // rotateY(sval/16 - 0.125); //8

  translate(-width/2, -height/2, 0);
  
if (mouseY> height/2) refresh();
  
  
  for (int i = 0; i < img.height; i += res) {
    
      beginShape(TRIANGLE_STRIP);  
    for (int j = 0; j < img.width; j += res) {
      float rr = red(imgPixels[j][i]); 
      float gg = green(imgPixels[j][i]);
      float bb = blue(imgPixels[j][i]);
      float tt = rr+gg+bb;
      //stroke(rr, gg, gg);
      //line(i, j, tt/10-20, i, j, tt/10 );
      fill(color(img2.get(i,j)));
      int _x = i;
      int _y = j;
      noStroke();
     //  beginShape(QUADS);  
        vertex(_x, _y, (255- brightness (img.get  ( _x,_y  ) )  ) / 2); 
    vertex(_x - res, _y, (255- brightness ( img.get  ( _x-res,_y  ) )  ) / 2); 
   // vertex(_x - res, _y - res, (255 - brightness ( img.get  ( _x-res,_y-res  ) ) ) / 2); 
  //  vertex(_x, _y - res, (255 - brightness ( img.get  ( _x,_y -res ) ) ) / 2);      
 
   // endShape(); 
      
      
      
    }
     endShape(); 
  }
if (mouseY<= height/2) refresh();
}

void keyPressed() {
  if(key == '1') {
    res = 1;
  } 
  else if (key == '2') {
    res = 2; 
  } 
  else if (key == '3') {
    res = 3;
  } 
  else if (key == '4') {
    res = 4;
  } 
  else if (key == '5') {
    res = 5;
  }
  
  if (key=='6')res=20;
  if (key=='0')res=6;
  if (key=='7')res=7;
  if (key=='8')res=8;
  if (key=='9')res=9;
}







