
//Sophie Klafter
//February 20, 2012
//sk2948@bard.edu
//Self portrait 
//Project Description: Click on the impage and see what happens!
 

int x=0;
PImage b;
PImage c;

void setup()
{
  size(500, 500);
    /* @pjs preload="/static/uploaded_resources/p.3287/Smokecrop.jpg";
    preload="/static/uploaded_resources/p.3287/resizealpha.jpg"; */
  b = loadImage("/static/uploaded_resources/p.3287/Smokecrop.jpg");
  background(b);
  smooth();

  //head outline
  //noStroke();
  //fill (180);
  //ellipse(255, 255, 295, 350);
  
  //chin
  //noStroke();
  //fill(180);
  //ellipse(255, 411, 70, 60);
  
  //mask
    
  c = loadImage("/static/uploaded_resources/p.3287/resizealpha.jpg");
  tint(225, 210);
  image(c, 123, 100);
  
  //triangle
  stroke(10);
  noFill();
  line(255, 140, 210, 200);
  line(210, 200, 300, 200);
  line(300, 200, 255, 140);
}

void draw(){
  //bulls eye
  if (mouseButton == LEFT) {
    frameRate (2);
    stroke(15);
    fill (5);
    ellipse(256, 178, x, x);
    x= x + 10;
    }
    if (x> 40) {
      fill(180);
      ellipse(256, 178, (x-5), (x-5));
      //eyes
      noStroke ();
      fill(255);
      ellipse(212, 235, 32, 32);
      noStroke ();
      fill(255);
      ellipse(302, 235, 32, 32);
      //reset bulls eye
      x= 0;
    }
  }   
  
                
