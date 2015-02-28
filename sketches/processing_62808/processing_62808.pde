
import processing.video.*;

Capture video;
//Capture videoB;
color trackColor;


void setup()
{
  rectMode(CENTER);
  size(400, 400, P3D);
  frameRate(30);
  colorMode(HSB, 255, 255, 255, 100);

  video = new Capture(this, 320, 240);
  //videoB = new Capture(this, 320, 240);
  //video.start();  

  trackColor = color(255, 0, 0); // Start off tracking for white
  noFill();
  smooth();
  strokeWeight(4.0);
  stroke(0);
}



void captureEvent(Capture camera)
{
  video.read();
  //videoB.read();
}
void draw()
{
  background(255);
  int angle=10;
  int po=5;
  background(360);
  translate(200, 200);




  for (int i=0; i<36; i++) { 
    noStroke();
    fill(i*10, 360, 360);







    rect(0, 0, 50, 50);

    rotateX(radians(mouseX));
    pushMatrix();

    rotate(radians(i*angle));
    translate(180, 0);
 image(video, 0, -300);

    rect(0, 0, 10, 10);

    popMatrix();
    frameRate(40);
    rotateY(radians(mouseY));
    pushMatrix();
    rotateX(random(0, 200));
    rotate(radians(i*angle));
    translate(90, 0);
    rect(0, 0, 10, 10);
    translate(10, 0);
    rect(0, 0, 10, 10);
    translate(20, 0);
    rect(0, 0, 10, 10);
    translate(5, 0);
    rect(0, 0, 10, 10);
    //image(video, 0, -300);
    popMatrix();
  }






  loadPixels();
  for (int i=0; i<36; i++)
    rotate(radians(i*angle));
  translate(50, 0);   
 

  //image(video, 0, 0);


  //image(video, -420, 0);



 



  //image(video, -420, -300); 

}

void mousePressed() {
  int loc = mouseX + mouseY*video.width;
  trackColor = video.pixels[loc];
}


