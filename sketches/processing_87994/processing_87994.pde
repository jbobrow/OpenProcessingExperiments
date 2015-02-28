
//matrix
color[]fJAN={#B3E1FF,#3CC8FF,#39A1D1,#0079BD,#085087};
int d= 50;
void setup(){
size(500,500);
smooth();
background(fJAN[0]);
ellipseMode(CENTER);

}

void draw(){
fill(fJAN[1]);
noStroke();
  ellipse(50,50,d,d);
  
  pushMatrix();
  pushStyle();
  
  translate(300,0);
  scale(2);
  fill(fJAN[2],100);
  ellipse(50,50,d,d);
 
 popMatrix();
 strokeWeight(5);
 stroke(fJAN[4]);
 fill(fJAN[3]);
 ellipse(50,200,d,d);
 
 popStyle();
 fill(fJAN[4]);
 ellipse(450,450,d,d);
 

}
