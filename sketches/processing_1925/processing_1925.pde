
import processing.opengl.*;

int numBlobs = 5;

Blob[] blobs;

void setup(){
  size(300, 300, P3D);
  noStroke();
  //  noCursor();
  colorMode(HSB, 360,1,1, 1);
  blobs = new Blob[numBlobs];

  for(int i=0; i<numBlobs; i++) { 
    float m = 40;
    blobs[i] = new Blob(random(width), random(height), m, m/3, 30);
  }

}

void draw(){
  println("Draw");
  background(0);


  for(int i=0; i<numBlobs; i++){
    blobs[i].update(map(mouseX, 0, width, 0, 40));
    if(dist(mouseX, mouseY, blobs[i].xpos, blobs[i].ypos)<10) blobs[i].selected=true;
    else blobs[i].selected=false;
    blobs[i].display();
  }
  
  

}


