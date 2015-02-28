
int px;
int py;
int mouseDownX=-1;
int mouseDownY=-1;
color col=color(255);
void setup() {
size(500,500);
colorMode(RGB);
background(128,128,128);
fill(236,233,216);
stroke(172,168,153);
rect(0,0,55,499);
rect(0,445,499,54);
fill(255);
rect(60,5,350,350);
stroke(172,168,153);
color[] colors = { color(255,0,0), color(0,255,0), color(0,0,255), color(255,0,255), color(255,255,0), color(0,255,255) };
float squarx;
float squary;
int r;
int c;
for (r=1; r<3; r++) { 
  squary=r*20+435;
  for (c=1; c<4; c++){
    squarx=c*20+50;
    fill(colors[r*3-4+c]);
    rect(squarx,squary,15,15);
  }
}
col=colors[0];
}

int Round(int number, int rounder){
  print(int(number/rounder)*rounder);
  return int(number/rounder)*rounder;
}

void draw(){
  fill(col);
  stroke(172,168,153);
  strokeWeight(1);
  rect(15,455,35,35);
  strokeWeight(4);
  stroke(col);
  println("  "+mouseDownX+"  ");
}
void mousePressed(){
  if ((70<mouseX)&&(mouseX<125)&&(455<mouseY)&&(mouseY<490)){
      //print(" ("+mouseX+", "+mouseY+") ..");
    loadPixels();
    col=pixels[mouseY*width+mouseX];
    updatePixels();
    
    }
 }


void mouseDragged(){
  if ((60<mouseX)&&(mouseX<410)&&(5<mouseY)&&(mouseY<355)){
    if (mouseDownX>=0){
    line(px,py,mouseX,mouseY);
    } else {
    mouseDownX=mouseX;
    mouseDownY=mouseY;
  }
      px=mouseX;
      py=mouseY;
  }
}
void mouseReleased(){
  mouseDownX=-1;
  mouseDownY=-1;
  }

void keyPressed(){
  noStroke();
  fill(255);
  rect(60,5,350,350);
}





