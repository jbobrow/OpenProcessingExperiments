
 import java.util.Calendar;

float i = 0;
void setup() {
  background(255, 230, 203);
  rectMode(CENTER);
  size(442, 443);
  
  
}
 
void draw() {}
 
void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  
  i += e;
  
  int x= mouseX;
  int y= mouseY;
  
  stroke (250, random(50, 250), random(70, 250));
  ellipse( x, y, i*47, i*10);
}

 void keyReleased() {
  if (keyCode == CONTROL) saveFrame(timeStamp()+"_##.png");
  
   //if (keyCode == ' ') background(255, 230, 203));

   }

String timeStamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


