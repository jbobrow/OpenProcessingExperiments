
import ddf.minim.*;

float rotA= 45;



Minim minim;
AudioInput in;

int numFrames = 32;
int currentFrame = 0;



void setup() {
  size(1000, 1000, P3D);
   background(255);
  frameRate(30);

  minim = new Minim(this);
  in = minim.getLineIn();


  smooth(8);
}
void draw() {
  fill(255 , 10);
  rect(0, 0 , width, height);
  noFill();
 
  currentFrame = (currentFrame+1) % numFrames;
  int offset = 0;
  //WAVEFORM
  //pushMatrix();
  //line( 250, 250 + in.left.get(10)*20, 750, 250 + in.left.get(10)*20 );
  //line( 250, 750 + in.right.get(10)*20, 750, 750 + in.right.get(10)*20);
  //line( 250 + in.left.get(10)*20, 250, 250 + in.left.get(10)*20, 750);
  //line(750 + in.right.get(10)*20, 250, 750 + in.right.get(10)*20, 750);
  //popMatrix();
  //MANDALA 1
  //circle 1
  pushMatrix();
  if (currentFrame >0 ) {
    fill(0, 100, 30);
  }
  if (currentFrame >7) {
    fill(30, 0, 100);
  }
  if (currentFrame >15 ) {
    fill(170, 0, 30);
  }
  if (currentFrame >24) {
    fill(210, 200, 50);
  }
  translate(500, 500);
  rotate(radians(rotA));

  for ( int i =0; i<250; i ++) {
    rotate(radians(30));
    triangle(0, -225 + in.left.get(200)*300, -50, -175, 50, -175);
    
  }
  popMatrix();
  //circle 2
  pushMatrix();
  translate(500, 500);

  rotate(radians(-rotA));
  ellipse(0, 0, 350, 350);
  fill(170, 16);
  for (int i =0; i<250; i ++) {
    rotate(radians(15));
    triangle(0, -175 - in.right.get(10)*300, -30, -125, 30, -125);
  }

  popMatrix();


  //circle3
  pushMatrix();
  translate(500, 500);
  rotate(radians(rotA));
  ellipse(0, 0, 250, 250);



  fill(255, 8);


  for (int i = 0; i <250; i ++) {
    rotate(radians(9));
    ellipse(0, 0, 25, 250);
  }
  popMatrix();
  rotA+=1.5;
  //1
  pushMatrix();
  translate(500, 480);
  fill(0, 100, 30);
  ellipse(0, - 245, 25, 25);
  fill(255, 200);
  ellipse(0 + in.right.get(10)*100, -255, 50, 50);
  popMatrix();
  //2
  pushMatrix();
  translate(500, 480);
  fill(30, 0, 100);
  triangle(0, -323, 10, -290, -10, -290);
  fill(255, 200);
  ellipse(0 + in.left.get(10)*100, -305, 43, 43);
  popMatrix();
  //3
  pushMatrix();
  translate(500, 480);
  fill(170, 0, 30);
  ellipse(8, -348, 20, 20);
  fill(255, 200);
  ellipse(0 + in.right.get(10)*100, - 348, 36, 36);
  popMatrix();
  //4
  pushMatrix();
  translate(500, 480);
  fill(210, 200, 50);
  ellipse(0, -383, 10, 10);
  fill(255, 200);
  ellipse(0 + in.left.get(10)*100, - 383, 27, 27);
  popMatrix();
  //5
  pushMatrix();
  translate(500, 520);
  ellipse(0 + in.right.get(10)*100, 255, 43,43);
  popMatrix();
  //6
  pushMatrix();
  translate(500,520);
  ellipse(0 +in.left.get(10)*100, 305, 27, 27);
  popMatrix();
  
 
  
}

