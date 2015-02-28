
PImage w;
float x,y;
float rot;
 int start_time;
 
void setup () {
  size(400,400);
  w = loadImage("w.jpg");
  x = 0.0;
  y = width/2.0;
  rot = 0.0;
}

void keyPressed() {
  start_time = millis();
}

   


void draw (){
  background (255);
  
  translate (x,y);
  rotate (rot);
  image(w,0,0);
  
  x +=1.0;
  rot += 0.03;
  if (x > width) {
    x = 2;
  }
}


