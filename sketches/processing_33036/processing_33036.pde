
int mx = 100;
int my = 10;
int cx = 20;
int cy = 10;
int speedc = 10;
int speedm = 10;
float angle = PI/8;


void setup() {
  size ( 600, 600);
}

void draw() {
  
  PImage b;
  b = loadImage ("back.jpg");
  background (b);
  PImage m;
  m = loadImage ("monster.png");
  PImage mi;
  mi = loadImage ("monsteri.png");
  PImage c;
  c = loadImage ("cola.png");
  PImage ci;
  ci = loadImage ("colai.png");
  PImage wtfl;
  wtfl = loadImage ("TheFL.jpg");
  PImage wtfr;
  wtfr = loadImage ("TheFR.jpg");
  PImage c2;
  c2 = loadImage ("cola.png");
  PImage m2;
  m2 = loadImage ("monster.png");
  PImage mi2;
  mi2 = loadImage ("monsteri.png");
  PImage ci2;
  ci2 = loadImage ("colai.png");
  
   if ((mouseX < 45) && (mouseY < 45)) {
   image(wtfl, 0, 0);
}
 if ((mouseX > width - 45) && (mouseY < 45)) {
   image(wtfr, 300, 0);
 }
  
    if ((mouseX > 435) && (mouseY > 465)) {
   c = m2;
   m = c2;
   mi = ci2;
   ci = mi2;
    }
    
      if (speedm < 0){
    m = mi;
  }
  if (speedc < 0){
    c = ci;
  }
    
  image(c, cx, cy);
  image(m, mx, my);
  
  cx = cx + speedc;
  mx = mx + speedm;
  
  if ((cx < -50) || (cx > 600)){
    speedc = speedc * -1;
    cy = cy + 75;
  }
  if ((mx < -50) || (mx > 600)){
    speedm = speedm * -1;
    my = my + 75;
  }
  if (my > 600){
    my = 10;  
  }
  if (cy > 600){
    cy = 10;  
  }
    
    
  if (cy < -50){
    cy = 90;
  }
  if (my < -50) {
    my = 75;
  }

// if (cx % 2 == 0){
//   rotate (angle);
//   image (c, cx, cy);
// } else{
//   rotate (angle * -1);
//} 
}

