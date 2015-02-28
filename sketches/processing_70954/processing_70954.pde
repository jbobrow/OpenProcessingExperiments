
//needs opengl for transform
import processing.opengl.*;

//varz
int gridStep;
PImage img;
PImage img2;
PImage img3;
PImage from;
PImage to;
float where = 0;
int flipCount = 0;
float colorStep;
boolean ellipticalPixel = true;


void setup(){
  //change these
  gridStep = 50; //pixel size
  colorStep = .01; //how drastically the color changes each draw, changed live based on mouseX on click
  img = loadImage("lily_iris.jpeg"); //pick your images, they can be any size as long as they match
  img2 = loadImage("lily2.jpeg");
  img3 = loadImage("lily3.jpeg");
  colorMode(HSB); //RGB also works

  //don't change these
  from = img;
  to = img2;
  size(img.width, img.height, OPENGL);
  noStroke();
  frameRate(60);
}

void draw() {
  smooth();
  background(255);
  // loop grid
  for (int gridY=0; gridY<img.height; gridY+=gridStep) {
    for (int gridX=0; gridX<img.width; gridX+=gridStep) {
      //set fill to image color at grid position
      fill(lerpColor(from.get(gridX, gridY), to.get(gridX, gridY), where));
      
      //set diameter based on distance
      float diameter = gridStep * 2;
      
      pushMatrix();
      translate(gridX, gridY, diameter*5);
      if(ellipticalPixel == true){
        ellipse(0, 0, diameter, diameter);
      } else {
        rect(0, 0, diameter, diameter);
      }
      popMatrix(); 
    }
  }
  
  where += colorStep;
  if(abs(float(1)-where) <= colorStep) {
    //delay(1000);
    if(flipCount==0){
      from = img2;
      to = img3;
      where = 0;
      flipCount = 1; 
      println("first flip");
    } else if(flipCount == 1) {
      from = img3;
      to = img;
      flipCount = 2;
      where = 0;
      println("second flip");
    } else if(flipCount == 2) {
      from = img;
      to = img2;
      flipCount = 0;
      where = 0;
      println("back to start");
    }
  }
}



//keyboard
void keyReleased(){
  if (key=='s' || key=='S') saveFrame("out/"+timestamp()+"_##.png");
  if (key==' ') {
    if (ellipticalPixel == false) {
      ellipticalPixel = true;
    } else if (ellipticalPixel == true) ellipticalPixel = false;
  }

    
}

void mousePressed() {
  gridStep = int(float(mouseY)/float(height) * 80 + 10);
  colorStep = float(mouseX) / float(width) * .5;
  println("grid step: " + gridStep);
  println("color step: " + colorStep);
}


// timestamp
String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}




