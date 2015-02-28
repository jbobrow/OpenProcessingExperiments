
int elements=1000;
float x[]=new float[elements];
float y[]=new float[elements];

int numpoints=0;

void setup(){
  size(500,500);
  frameRate(30);
}

void mouseDragged(){
  x[numpoints]=mouseX;
  y[numpoints]=mouseY;
  
  numpoints +=1;
}

 
float angle=0;
float angle2=0;


void star(){

  noStroke();
  fill(random(0,50),random(130,150),random(245,255),random(255));

  
  beginShape();
  scale(0.2,0.2);
  rotate(angle2);
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  
  pushMatrix();
  rotate(angle);
  scale(0.5,0.5);
  translate(100,0);
  beginShape();
  vertex(0, -50);
  vertex(14, -20);
  vertex(47, -15);
  vertex(23, 7);
  vertex(29, 40);
  vertex(0, 25);
  vertex(-29, 40);
  vertex(-23, 7);
  vertex(-47, -15);
  vertex(-14, -20);
  endShape(CLOSE);
  popMatrix();
  
  angle+=0.1;
  angle2+=0.01;
  
}

int frame=0;

void draw(){
  
  if (mousePressed){
    translate(mouseX,mouseY);
    star();
  }
  
  else if(!mousePressed){
  background(0);
  for (int i=1; i<numpoints; i++){
  
  x[i]+=sin(frame/i);
  y[i]+=cos(frame/i);
  
  pushMatrix();
  translate(x[i],y[i]);
  scale(random(0,2));
  star();
  popMatrix();
  }
  
 frame+=1;
  }

}

void keyPressed(){
  numpoints=0;
}
