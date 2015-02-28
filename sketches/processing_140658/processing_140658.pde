
PImage img, img1, img2, img3;
int i = 0;
long lastTime = 0;
boolean a,b,c,d=false;
void setup() {
    img=loadImage("d.jpg");
  img1=loadImage("a1.jpg");
  img2=loadImage("b.jpg");
  img3=loadImage("c.jpg");
size(600,600);
lastTime = millis();
}
void draw() {
if (mouseY > 400) {
    cursor(HAND);
  } else {
    cursor(ARROW);
  }
  if(i==3){
      if ( millis() - lastTime > 2500 ) {
    background(255);
    text("GAME OVER",300,300);
      if ( millis() - lastTime > 3500 ) i = 0;
  }
  }
  else{
     background(255);
  if ( millis() - lastTime > 1400 ) {

  img=loadImage("d.jpg");
a=true;
b=true;
c=true;
textSize(12);
  textAlign(CENTER);
  fill(0);
  }
    if ( millis() - lastTime > 400 ) {
   image(img,200,100);
     if(d) i++; d= false;
    }
      text("score : 0 - "+i,300,20);
   if (c) image(img1,0,400);
   if(b) image(img2,200,400);
   if (a) image(img3,400,400);
   
  }
 }
void mousePressed() {
if (mouseY > 400){
  d = true;
lastTime = millis();
     if (mouseX>400){

img = img1;
a = true;
b =false;
c=false;
  }
  if (mouseX > 200){
   if (mouseX<400){

img = img3;
b = true;
a=false;
c=false;
  }
  }
    if (mouseX < 200){

img = img2;
c= true;
a=false;
b=false;
  }
}
}

