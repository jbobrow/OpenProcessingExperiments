
//Taylor Milner

//import processing.dxf.*;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
boolean record = true;

Minim minim;    
AudioPlayer out; 



int w = 30; // the width of a cell
int h = 30; // the height of a cell

PImage img;

float [] y = new float[110];  //for 10 rows of tiles, you need 11 rows of points

void setup() { 
  size(500, 500, P3D);

  minim = new Minim(this);                      //  load Minum
  out = minim.loadFile("Panorama.mp3");   //  load your sound into Minum
  out.loop();

  smooth();
  //noStroke();
  fill(random(200,255),0,0,60);
  
}


void draw() {
 // if(record == true){
   // beginRaw(DXF, "project2.dxf");
 // }
  lights();
  background(255);
  noStroke();

  translate(width,height);
  camera(-100,-500,300,300,-200,1,0,1,0);

 
   rotateY(PI/4);
   translate(-200,0,-100);

  for (int j = 0; j < height; j+=h) {
    translate(0,0,h);  //when a row is done, move down to the next one in the z-dimension
    pushMatrix();
    for (int i = 0; i < width; i+=w) {
      translate(w,0,0); //move over in the x-dimension
    
    }
    for(int i=0;i<110;i++){
  y[i] = 300 * out.mix.get(i * out.bufferSize()/width); //get the sound
}
    int count = 0;
    for(int z=0;z<200;z+=20){
      rotateY(radians(Z * frameCount * -PI/6 * 0.25));
  beginShape(QUAD_STRIP);
  for(int x=0;x<200;x+=20){
 
    vertex(x* PI,y[count]*2*PI,z/2);
    
    vertex(x,y[count],z+20);
    count++;

  }
  endShape();
  
  //if(record == true){

   // endRaw();
   // record = false;
 // }
  

    }
    popMatrix(); // when the row is done, pop the stack and return to the starting coordinates
  }
}



  void mousePressed(){
  record = true; 
}
  












