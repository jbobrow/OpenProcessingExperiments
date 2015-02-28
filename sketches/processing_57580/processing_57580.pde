
int petalNum=int(random(8,18));
float deg = 360/petalNum;
color[] colour;
float petalLength;
float petalX, petalY;
float discSize;

void setup(){
  smooth();
  size(860,550);
  //frameRate(1);
  colour = new color[petalNum];
  for(int i = 0; i < petalNum; i++){
    colour[i] = color(random(139,255), random(0,139), random(0,139));
  }
  petalLength=random(40,70);
  discSize=random(30,50);
  petalX=100;
  petalY=100;
  
}

void draw(){
  drawFlower(petalX,petalY);
}

void drawFlower(float _petalX, float _petalY){
  pushMatrix();
  translate(_petalX,_petalY);
  
  stroke(#3FB120);
  strokeWeight(8);
  line(0,0,0,200);
  noFill();
  
  stroke(32,96);
  strokeWeight(4);
  line(0,0,4,200);
  noFill();

  pushMatrix();
  fill (32,96);
  noStroke ();
  translate (discSize/2+1,150);
  ellipse (0,0,40,17);
  popMatrix();
  
  pushMatrix();
  fill (#3FB120);
  noStroke ();
  translate (discSize/2,150);
  ellipse (0,0,37,15);
  popMatrix();
  
  pushMatrix();
  fill (32,96);
  noStroke ();
  translate (-discSize/2+1,150);
  ellipse (0,0,37,16);
  popMatrix();
  
  pushMatrix();
  fill (#3FB120);
  noStroke ();
  translate (-discSize/2,150);
  ellipse (0,0,40,15);
  popMatrix();
  
  fill(255,255,0);
  stroke(0);
  ellipse(0,0,discSize,discSize);

  fill(255);
  strokeWeight(1);
  for (int i=0; i<petalNum; i++){
    pushMatrix();
    float rad = radians(deg*i);
    rotate (rad);
    translate(0,-((discSize+petalLength)/2));
    fill(colour[i]);
    ellipse(0,0,petalLength/2,petalLength);
    popMatrix();
  }
  popMatrix();
}

