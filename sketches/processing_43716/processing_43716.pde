
int ellipseSize=1;
float x=0;
float y=0;
float c=0;
float c2=0;
float c3=0;

void setup() {
  size(500,500);
  smooth();
}

void draw(){
//declaration of the random variable inside draw  
  c=random(200,255);
  c2=random(150,200);
  c3=random(100,150);

//beckground  
  noStroke();
  fill(200,50);
  rect(0,0,width, height);
  
//circle follow mouse and chenge color randomly  
  fill(c,c2,c3);
  ellipse(mouseX,mouseY,20,20);
  
//click generate a growin up ellipse   
  if(mousePressed) {
    ellipseSize = ellipseSize + 1;
    fill(c2,c3,c);
    translate(width/2,height/2);
    rotate(ellipseSize);
    ellipse(5,5,ellipseSize,ellipseSize);}
 
//mouse NO click the size of circle dexrease
  else{
    ellipse(width/2,height/2,ellipseSize,ellipseSize);
    ellipseSize = ellipseSize -1;
  if (ellipseSize <= 1){
     ellipseSize=1;}}
  
}

