
void setup() {
  size (500,450);
  background(1,231,242);
}
 
void draw()
{
  
   
for(int a=0; a<width; a=a+50){
noStroke();
fill(0,255,0,10);
ellipse(0,0,a+80,a+80);
fill(0,255,0,10);
ellipse(800,600,a+80,a+80);
fill(255,0,0,20);
triangle(a,600,0,a,800,0);
fill(0,0,255,10);
triangle(a,0,800,a,0,600);
 
 
 
 
 
}
  
  
 
  
  
  lineasH();
  lineasV();
   
}
     
  void lineasH(){
  for (int x=10; x <=400; x=x+5){
    stroke(x,x,50);
    line (200,200,x,600);
  }
  }
   
   void lineasV(){
  for (int y=10; y<=400; y=y+5){
    
    stroke(y, y, 50);
    line (200,y,600,600);}
    
  
  for( int i=0; i < width; i= i+ 50) {       
 noStroke();
 fill (15,990,222, 20);
 ellipse (width/2, height/2, i, i); 
 }
  
  
pushMatrix ();
translate (400, 400);
 for( int i=0; i < width; i= i+ 50) {       
 noStroke();
 fill (151,90,222, 20);
 ellipse (width/2, height/2, i, i); 
 popMatrix();
 }
   
  for(int i=-80; i<200; i= i+3){
  for(int b=-80; b<200; b= b+3){
  
  
 fill(90,189,100);
  line(i,b,400,400); 
  
   
  //stroke(207,random(255),150);
  strokeWeight(0);
   
  rotate(-45);
  noLoop();
   
  }
}
 
  for(int i=0; i<200; i= i+5){
  for(int b=0; b<200; b= b+10){
  
 
 stroke(0,150,random(255),100);
  strokeWeight(0);
 
  line(i,b,1300,1300); 
   
  rotate(45);
   
 
  //noLoop();
   
}

  fill(0, 30);
  rect(0, 0, width, height);
  fill(255, 150, 0, 3);
  translate(width/2, 0);
  for (int i = 0; i < 640; i+=2) {
    float angle = 20+sin(radians(i+frameCount*2)) * 10;
    float x = sin(radians(i+angle))*(angle*2);
    ellipse(x, i, angle, angle);
    ellipse(-x, i, angle, angle);
    
    
 
  }

  }
}

