
float i;
float angle;
float zoom;
void setup(){
  size(800,600);
  background(255,255,255);
 
  i = 5;
  angle = 0;
 
  }
 
 
void draw(){
 translate(width/2,height/2);
 rotate(angle);
 i += 1;
 angle += PI/48;
   strokeWeight(4);

 point(i,0);
 ellipse(0,0,i,0);
   
}


