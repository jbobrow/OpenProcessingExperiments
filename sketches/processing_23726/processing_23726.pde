
PImage a;  

void setup() {
  size(567, 500);
   stroke(0);
  smooth();
  a = loadImage("piglet.jpg"); 
  image(a, 0, 0); 
}

void draw(){
  
  fill(0);
   if(mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  delay(20);

  
if(key=='1')
stroke(0,0,0);
 line(mouseX, mouseY, pmouseX, pmouseY);
 
 if(key=='2')
 stroke(255,255,255);
  line(mouseX, mouseY, pmouseX, pmouseY);
  
  if(key=='3')
  stroke(202,112,131);
   line(mouseX, mouseY, pmouseX, pmouseY); 
 
}
if(key=='c'){
   a = loadImage("piglet.jpg"); 
  image(a, 0, 0); 
} 
}
 void keyReleased(){
  if (key == 's') {
    saveFrame(timestamp()+"_##.png");

  }
}


String timestamp() {
  Calendar now = Calendar.getInstance();
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", now);
}


