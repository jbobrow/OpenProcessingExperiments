
/*
Happy Face
 adalau85@gmail.com
 October 5, 2009 
 */
float r=255;
float g=255;
float b=0;

void setup() {
  size(500,500);
  background(255);
  smooth();
};

void draw () {  
  background(255);
  fill(r,g,b);
  translate(width/2,height/2);
  ellipse(0,0, 400,400);
  fill(0,0,0);
  ellipse(-80,-60,40,50);
  ellipse(80,-60,40,50);
  fill(0,0,0,80);
  strokeWeight(3);
  stroke(0,0,0);
  rect(-130,-110,100,100);
  rect(30,-110,100,100);
  noFill();
  bezier(-135,50,-80,120,80,120,138,50);

  for(int i=0; i<100; i++) {
    if(mousePressed == true) {
      r=random(255);
      g=random(255);
      b=random(255);
    }
  };
};





