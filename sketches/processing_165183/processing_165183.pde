
//thanks to Alex for help
PImage Smash;
PImage Shot;
int ran = 0;
int rand = 0;
void setup(){
  size(1000,1000);
  Smash=loadImage("smash.png");
  Shot=loadImage("bullet.png");
  fill(255,255,255);
  rect(0,0,1000,1000);
  println("Press C for standard brush");
  println("Press V for Smash Ball");
  println("Press B for bullet holes");
  println("Double click after switching brushes");
}

void draw(){
  int ym = mouseY - 20;
  int xm = mouseX - 20;
  ran = random(1000);
  rand = random(1000);
  if(key=='c')
  if(mousePressed){
    stroke(20,2,2);
    strokeWeight(15);
    line(mouseX, mouseY, pmouseX, pmouseY);
 }
 if(key=='v')
 if(mousePressed){
    image(Smash,mouseX-50,mouseY-50);
 }
 if(key=='b')
 if(mousePressed)
 {
   image(Shot,ran,rand);
 }
}


