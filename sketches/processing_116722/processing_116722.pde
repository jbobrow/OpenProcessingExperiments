
int x,y,w,h;

void setup (){
size (displayWidth,displayHeight);
noStroke ();
frameRate (50);
}

void draw () {
background (255);
fill (random (255), random (255), random (255));
rect (x,y,w,h);
y = 0;
w = width/3;
h = height;

if (mouseX < width/3){
x = 0;
} else if (mouseX < width/3 * 2) {
  x = width/3;
}else{
  x = width/3 *2;
  
}
if(mousePressed == true) {
    ellipse(mouseX, mouseY, 800, 26780);
  }
  else {
    ellipse (width/2, height/2, 480, 480);
  }
}
