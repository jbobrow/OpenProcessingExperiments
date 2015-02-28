
float xpos = 0.0;

PImage img;

boolean doTint;

void setup() {
  size(1000, 450);
   background(random(0, 150));

  img=loadImage("bone1.png");
  smooth();

  
  tint(255, 100);
  image(img, 675, -30, 570, 500);
  
}

void draw() 
{ 
  
 
  
  doTint = (mousePressed); 
   println(doTint);
   
  frameRate(8);

  for ( int i=0; i<width; i++)
  {
    // float n=random(0.2)*50;
    pushMatrix();
    translate(0, 0);
    fill(random(0, 20), random(10, 25), random(25, 20), random(100));
    noStroke();
    xpos=xpos+0.003;
    float m=noise(xpos)*width+100;

    rect(i, m, 10, 3);
    popMatrix();

    //x++;
    //y++;
  }

  //float n=random(0.2)*80;

  for ( int i=0; i<width; i++)
  {
    pushMatrix();
    translate(width, height/2);
    rotate(PI);
    fill(random(150, 255), random(20, 50), random(25, 100), random(80));
    noStroke();
    xpos=xpos+0.01;
    float m=noise(xpos)*width-250;
    rect(i, m, 6, 5);
    popMatrix();
  }
  
  if (doTint == true)
    tint(240, 50, 50);
    //background(random(0, 150));
  else
  tint(255, 10);
  image(img, 675, -30, 570, 500);
}



