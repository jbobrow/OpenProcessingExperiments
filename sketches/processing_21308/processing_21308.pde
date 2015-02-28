
//hw week 4
//Gaelan Baird
PImage img;

int dragX, dragY;
void setup(){
  smooth();
size(500, 500);
frameRate(14);
background(255);
tint(255);
img = loadImage("paint_brush.png");
  }
  
void draw() {
  image(img, dragX, dragY);
}

void mouseDragged(){
  
  dragX=mouseX;
  dragY=mouseY;
if(dragX>dragY){
textSize(1+random(62));
fill(random(1,300), random(70), random(155), random(50, 100));
text("JOHN CAGE", mouseX+20, mouseY+20);}else{
  for(int i = 0; i < 360; i++){
    translate(width/4, height/4);
    rotate(radians(166));  
noFill();
stroke(330, random(230), random(200), random(50,100));
strokeWeight(2);
triangle(mouseX+random(10), mouseY+42, 100, 10+mouseY, mouseX-2, random(8,50));
  }
}
if(dragY>dragX){
  textSize(1+random(90));
  fill(12,random(300),random(400,500),100);
  text("NOTHINGNESS", mouseX-20, mouseY);
}
}

