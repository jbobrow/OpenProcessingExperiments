
//By Hanna Oh
//based on code by Jean-no. Thank you! :)
 
void setup(){
  size(400,400); background(50,45,100); frameRate(25); smooth();fill(0,4);
}
 
void draw(){
   noStroke();
   rect(0,0,width,height);
}
 
void branche(float x, float y, float s, float a){
  strokeWeight(s*0.15);
  a+=radians(random(-7,7));
  float newx = x+cos(a)*s;
  float newy = y+sin(a)*s;
  line(x,y,newx,newy);
  
  }
 
void mousePressed(){
   stroke(random(13,170),random(22,125),random(130));
   branche(mouseX, height, height-mouseY, radians(270));
}

                
