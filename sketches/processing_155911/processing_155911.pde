
float colorSquare;
float lineWidth;
float rectX=30;


void setup() {
  size(390, 460);
  background(255,255,255);
  float lineWidth=2;
}
void mouseOver() {
  
}
  
   
void draw() {
 // background(255,255,255);
  colorSquare=map(mouseX,0,width,0,255);
line (65,80,115,150);
line (115,80,115,200);
line (116,81,116,200);
line (155,60,115,180);
line (0,200,lineWidth,200);
fill(0);

// IF NOT WORKING!!!!!!!!!

if (lineWidth<width) {
lineWidth++;
}

//first tree
  fill(13,21,colorSquare);
if (mousePressed) {
    fill (225,54,37);
  }
rect (50,50,30,30);


fill(colorSquare,54,37);
if (mousePressed) {
    fill (247,210,104);
  }
rect (100,70,30,30);

fill(colorSquare,210,104);
if (mousePressed) {
    fill (13,21,154);
  }
rect (140,30,30,30);

//river
  fill(13,21,colorSquare);

rect (rectX,200,30,30);

  fill(13,21,colorSquare);

rect (rectX*3,200,30,30);

  fill(13,21,colorSquare);

rect (rectX*5,200,30,30);
  fill(13,21,colorSquare);

rect (rectX*7,200,30,30);

  fill(13,21,colorSquare);
rect (rectX*9,200,30,30);

  fill(13,21,colorSquare);
rect (rectX*11,200,30,30);
println(lineWidth);

}



void keyPressed(){
if ((keyPressed)&&(key=='s')){
saveFrame();
}
if ((keyPressed)&&(key=='S')){
saveFrame();
}

}
