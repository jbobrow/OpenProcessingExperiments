
float i;
void setup(){
  size(800,600);
  background(255,255,255);
  i = 1;
    
  }


void draw(){
 translate(width/2,height/2);
 rotate(i);
 i += 1;
 strokeWeight(4);
 point(i,0);   
  
}
