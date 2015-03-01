
void setup(){
  size (400,400);
  background(0,0,0);
  noStroke();
  frameRate(30);
  smooth();
  rectMode(CENTER);
  
}


void draw(){
  noStroke();
    for(int c=0;c<400;c=c+20){
  floaters(87,87); }
  fill(255);
ellipse(0,0,200,200);
}



//No longer called for design purposes, I'm just leaving this code here for later reference
void flash(){
  for(int x=0; x<=600;x+=30) {
    for(int y=0;y<200; y=y+30){
      
      float a=random(255);
      float b=random(50);
      float c=random(45);
      float d=random(255);
      
      fill(a,b,c,d);
      ellipse(150,150,width,y);
    }}}

    
   int z=0;
   int speed=2;
  
 


void floaters(int a, int b){ 


float z=random(255);
float y=random(255);
float x=random(255);
fill(z/y,x,200,200);
rotate(radians(second()*a));
curve(a,0,2*a,4*b,3*a,b,width,height); 
curve(b,b,b,a,4*a,2*b,200,200); 

}
