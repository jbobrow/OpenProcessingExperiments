
int c;
float a = random(20);
void setup() {
  size(800, 800);
  background(0);
  smooth();
}

void draw() {
  
  if( mousePressed && mouseButton == LEFT){
  noStroke();
  c = c + 2;
  if(c >= 0 && c < 100){ 
  fill (200, 0, 0, int(a));
  ellipse(mouseX, mouseY, c, c);
}
  else{
    if(c >= 101 && c < 200){
    fill (255, 255, 0, int(a));
    ellipse(mouseX, mouseY, c, c);
  
}
    else{
    if(c >= 200 && c < 300){
    fill (150, 0, 150, int(a));
    ellipse(mouseX, mouseY, c, c);
    }
    else{
      if (c >= 300){
      c = 0;
      };
    }
  }}}
}
  
void mouseMoved(){
  fill (0, 0, 255, 10);
  noStroke();
  triangle(width/3, height/3, pmouseX, pmouseY, mouseX-30, mouseY-30);
  }
  
  




