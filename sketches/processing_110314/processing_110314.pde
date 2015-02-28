
int lar = 100;
int alt = 100;
int px = 0;
int py = 0;
int dist = 1;
color cor = color(random(255),255,random(255));
int corv = 1000;

String inst = "use your mouse arrows ← → ↑ ↓, try to hide the ball, click to change ball color";

void setup(){
  size(700,500);
  background(px,255,py);
  loop();
  px = width/2;
  py = height/2;
  colorMode(RGB,width,1000,height);
  rectMode(CENTER);
  fill(0);
  text(inst, 120, 60, 200, 100);
}

void mouseClicked(){
  cor = color(random(width),corv,random(height));
}

void draw(){
   
  if (keyPressed && key == CODED){
    background(px,corv,py);
    if (keyCode == RIGHT){
      px += dist;
    }
    else if (keyCode == LEFT){
      px -= dist;
    }
    else if (keyCode == UP){
      py -= dist;
    }
    else if (keyCode == DOWN){
      py += dist;
    }
  }
  
  if (px-(lar/2) <= 0){ 
    px = lar/2;
  }
  if (px+(lar/2) >= width) {
    px = width-(lar/2);    
  }
  if (py-(alt/2) <= 0) {
    py = alt/2;
  }
  if (py+(alt/2) >= height) {
    py = height-(alt/2);
  }

  noStroke();
  fill(cor);
  ellipse(px,py,lar,alt);
}
