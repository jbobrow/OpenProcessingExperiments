
boolean isPixelBlack = true;

void setup() {
size(500,500);
//background(0);
}

void draw() {
if(isPixelBlack) {
  background(0);
//fill(0);
//rect(0,0,width, height);
} else {
  background(255);
//fill(255);
//rect(0,0,width, height);}
}
}

void mouseClicked() {
if(isPixelBlack){
isPixelBlack=false;
} else {
isPixelBlack=true;
}
}

//void draw() {
//if(mousePressed==true){
//fill(0);
//ellipse(mouseX, mouseY, 10, 10);
//}  else {
//fill(250);
//rect(mouseX, mouseY, 10, 10);
//}
//
//}



