
void setup(){
size(640, 480);
background(120);
}
// colori 
void draw() {
  if (mousePressed) {
    fill(0, 0, 20);
  } else {
fill(255,255,255);
  
}
//linee
line(0,240,640,240);
line(320,0,320,480);
//rettangolo
rectMode(CENTER);
rect(320, 240, mouseX, mouseY);
stroke(0);
}



