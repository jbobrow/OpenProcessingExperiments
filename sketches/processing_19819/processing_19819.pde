
PFont font;
int x = 0;
float angle = 0.0;
float x1 = 10.0;
float y = 0.0;
float y1 = 10.0;

void setup(){
  size(250,250);
  background(255);
  smooth();
  font=loadFont("BodoniMTCondensed-Bold-45.vlw");
  textFont(font);
}

void draw(){
  //red background
  fill(0,150);
 
  rect(0,0,width,height);
  noFill();

  //Clock's circle and time marks
  ellipse(125,125,245,245);
  ellipse(20,125,10,10);
  ellipse(230,125,10,10);
  ellipse(125,20,10,10);
  ellipse(125,230,10,10);
  fill(232,42,135,120);
  
  //pink text middle
  textSize(100);
  text("L6C2G2",10,150);
 
  x+=1.0;
  angle = angle + 0.3;
  frameRate(5.0);
  translate(125,125);
  rotate(angle);
  fill(255,180);


 //text rotating clockwise at top
  textSize(40);
  text("L6C2G2",20,10);
   rotate(angle+1.0);
  text("L6C2G2",20,10);

  stroke(0,120);
    strokeWeight(3);
    ellipse(x1,y,y1,y1);
}
void mouseMoved(){
  stroke(232,42,135);
fill(0,100);
}


