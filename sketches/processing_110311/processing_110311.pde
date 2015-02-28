
int lar = 100;
int alt = 100;
int px = 0;
int py = 0;
int dist = 10;
float xobst = 0;
float yobst = 0;
int larobst = 100;
int altobst = 100;
String inst = "use your mouse arrows ← → ↑ ↓, avoid the square and the boundaries, click to change square position";

void setup(){
  size(700,500);
  background(200,150,200);
  loop();
  px = width/2;
  py = height/2;
  xobst = random(larobst, width-larobst);
  yobst = random(altobst, height-altobst);
  colorMode(RGB,width,height,255);
  rectMode(CENTER);
}

void mouseClicked(){      
      xobst = random(larobst, width-larobst);
      yobst = random(altobst, height-altobst);
   }

void draw(){
   
  if (keyPressed && key == CODED){
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

  
  if (px + (lar/2) >= xobst-(larobst/2) 
    && px - (lar/2) <= xobst+(larobst/2)
    && py + (alt/2) >= yobst-(altobst/2)
    && py - (alt/2) <= yobst+(altobst/2)){
    background(random(255));
  }
  
  else if (px-(lar/2) <= 0){ 
    px = lar/2;
    background(random(255));
  }
  else if (px+(lar/2) >= width) {
    px = width-(lar/2);    
    background(random(255));
  }
  else if (py-(alt/2) <= 0) {
    py = alt/2;
    background(random(255));
  }
  else if (py+(alt/2) >= height) {
    py = height-(alt/2);
    background(random(255));
  }
    
  else
  {
  background(px,py,200);
  }
  fill(0);
  ellipse(px,py,lar,alt); 
  rect(xobst, yobst,larobst,altobst);
  text(inst, 120, 60, 220, 100);
}
