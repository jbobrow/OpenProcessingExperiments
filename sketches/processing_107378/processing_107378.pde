
PImage peach;

void setup() {
  size(387, 382); 
  peach = loadImage("peach.jpg");
  noStroke();
  background(255);
}

void draw() {
  float r = random(10,50);
  if (mousePressed){
  color c = peach.get(mouseX, mouseY);
  fill(c, 102);
  ellipse(mouseX, mouseY, r, r);}
   saveFrame("images/export-"+"-#####.jpeg");
if ( frameCount >= 6000 ) {
       exit();
   } 
}

void keyPressed(){
    if (key == 'n'){
    background(peach);}
    if (key == 'b'){
      filter(BLUR);
}
if( key =='w'){
  background(255);
}
if( key =='d'){
  background(0);
}
}


