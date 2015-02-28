
int x;
int y;
 
void setup(){
 size(500,400);
 noStroke();
 noFill();
 smooth();
 background(255);
 frameRate(10);
 x=50;
 y=100;
 
}
 
void draw(){
  background(255);
   
 fill(39,9,9);
  x=x+1;
  y=y+1;
 rect(x,y,100,50);
  

 fill(0);
 x=x+1;
 y=y+1;
 ellipse(x+20,y+50,30,30);
 
 fill(0);
 x=x+1;
 y=y+1;
 ellipse(x+50,y+50,30,30);
  
 fill(0);
 x=x+1;
 y=y+1;
 ellipse(x+80,y+50,30,30);
  

}
