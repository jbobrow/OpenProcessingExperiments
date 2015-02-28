
Star star;
Table starData;



void setup(){
//  size(1280,699, P3D); // 699 so that I can screencapture including the chrome at the top and still get a 720P file
  size(256,256, P3D); // 699 so that I can screencapture including the chrome at the top and still get a 720P file
  lights();
  
  colorMode(HSB,1,1,1,1);
  
  star = new Star();
   
  
  }




void draw(){

  background(0);
  star.display();

}

void mouseDragged(){
  star.drag = true; 
  star.stroke3d();
}

void mouseReleased(){
  star.drag = false;
  }


/*
Things used

StarData: 
https://github.com/astronexus/HYG-Database
SIMBAD Star Database - http://simbad.u-strasbg.fr/simbad/sim-fsam
ESA HIPPARCOS Catalogue - http://www.rssd.esa.int/index.php?project=HIPPARCOS&page=table_exmp

Reference: http://processing.org/reference

On Github: https://github.com/chrleon/galacticRadio

*/
import ddf.minim.*;
AudioPlayer[] radio;
AudioPlayer ambient;


class Star {
  color c;
  float xpos;
  float ypos;
  float zpos;
  float size;
  float mouseZ;
  
  boolean drag = false;

  Star() { // constructor
    c = color(1);
    xpos = width/2;
    ypos = height/2;
    zpos = mouseZ;
    size = 40;
    noStroke();
}
  
  void display() { // drawmethod
  mouseZ = map(mouseX, 100, width, -500, 530);   
  translate(xpos, ypos, 0);
  rotateY(radians(mouseX));
  noFill();
  stroke(1);
  box(45);
  noStroke();
  
  pushMatrix();  
  //rotateX(radians(mouseX*-1));
  rotateY(radians(mouseX));
  fill(0,0,100,.2);
  ellipse(0, 0, 25, 25);
  fill(0,0,100);
  ellipse(0, 0, 15, 15);
  
  ellipse(50, 50, 17, 17);
  popMatrix();

  
    
}
  
  void rotate(){
    
  }
  
void stroke3d() { // Draw strokes in 3D - not working yet
    stroke(53,98,95);
    line(pmouseX,pmouseY,mouseZ, mouseX, mouseY, mouseZ);
    if (!drag) {
      noStroke();
      println("gameover");  
      return;
    }  
}
  
  
}




