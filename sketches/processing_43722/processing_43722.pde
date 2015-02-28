
int f=0;

void setup(){
  size(500,500);
  smooth();
  noCursor();
  frameRate(10);
}

void draw(){
  background(164,231,255,20);
  
//random variable, change continuously the value  
  float x = random(40,70);
  float y = random(40,70);
  float c = random(25);
  fill(f+c,100);
  noStroke();
  
//ellipse on the corner, variation of dimensions  
  ellipse(0,0,100+x*2,100+y*2);
  ellipse(0,height,100+x*2,100+y*2);  
  ellipse(width, 0,100+x*2,100+y*2);
  ellipse(width,height,100+x*2,100+y*2);
  ellipse(mouseX,mouseY,x,y);

//ellupse for the mouse   
  stroke(c+f,200);
  strokeWeight(4);
  noFill();
  ellipse(mouseX,mouseY,y*2,x*2);
  
//change color of the composition when the mouse is pressed  
  if(mousePressed){
    f=f+20;    
    if(f>=230){
      f=0;}}
  }

