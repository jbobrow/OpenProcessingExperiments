
/* Simple tree */

void setup(){
  size(400,400); background(0); frameRate(25); smooth();fill(0,4); 
}

void draw(){
   noStroke();
   rect(0,0,width,height);
}

void branche(float x, float y, float s, float a){
  strokeWeight(s*0.04);
  a+=radians(random(-7,7));
  float newx = x+cos(a)*s;
  float newy = y+sin(a)*s;
  line(x,y,newx,newy);
  if(s>3){
   branche(newx, newy, s*(random(0.55,0.70)), a-radians(random(17,12)));
   branche(newx, newy, s*(random(0.55,0.70)), a+radians(random(17,12)));
  }
}

void mousePressed(){
   stroke(random(130,170),random(220,255),random(130));
   branche(mouseX, height, height-mouseY, radians(270));
}

