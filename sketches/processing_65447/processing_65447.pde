
//A random growing stain. By Erik Zwaag.
//The most rare occasions happen at the outer border of the stain.
//It keeps evolving until the random dries out. (I think) :-)
//Press any key for a new stain. 

int x1;
int y1;
int x2;
int y2;
color c1;
color c2;

void setup() {
  size(400, 400,P2D);
  //colorMode(HSB);
  c1 = color(int(random(255)),int(random(255)),int(random(255)));
  c2 = color(int(random(255)),int(random(255)),int(random(255)));
  frameRate(60);
  background(0);
 x1 = width/2;
 y1 = height/2;
 x2 = width/2;
 y2 = height/2;
}

void draw() {
  
  for(int sp = 0; sp < 8000;sp++){ // A trick to speed up te process.
  
 x1=x1+int(random(-2.5,2.5));
 x1 = constrain(x1,0,width);
 y1=y1+int(random(-2.5,2.5));
 y1 = constrain(y1,0,height);
 
 x2=x2+int(random(-3.0,3.0));
 x2 = constrain(x2,0,width);
 y2=y2+int(random(-3.0,3.0));
 y2 = constrain(y2,0,height);
 
if(dist(x1,y1,x2,y2)>50){
  if(get(x1,y1) == color(0)){
  stroke(c1);
  point(x1,y1);
  }
  if(get(x2,y2) == color(0)){
  stroke(c2);
  point(x2,y2);
  }
}
int a = int(random(60));
if(a==1){
 x1 = width/2;
 y1 = height/2;
}
if(a==2){
  x2 = width/2;
  y2 = height/2;
}
  }
 } 
void keyPressed(){
  setup();
}
  




