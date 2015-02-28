
void setup(){
  size(500,500);  
  noStroke();
  colorMode(HSB);
  smooth();
}

int x1 = 25;
int y1 = 25;
int col = 0;
int trans = 100;

void draw(){
  
background(255);
col = (col+1) % 256;

  if(mousePressed == true){
    background(col, 255, 255);
    trans--;
    for (int i = 25; i < 500; i = i+50) {
  fill(0, 100);
  ellipse(i, 25, 50, 50);
  ellipse(i, 75, 50, 50);
  ellipse(i, 125, 50, 50);
  ellipse(i, 175, 50, 50);
  ellipse(i, 225, 50, 50);
  ellipse(i, 275, 50, 50);
  ellipse(i, 325, 50, 50);
  ellipse(i, 375, 50, 50);
  ellipse(i, 425, 50, 50);
  ellipse(i, 475, 50, 50);
}
  }else {background(255);
         trans = 100;
         };
      
//de afuera hacia adentro
//marco 1
for (int x1 = 25; x1 < 500; x1 = x1+50) {
  fill(col, 255, 255, trans);
  ellipse(x1, y1, 50,50);
  ellipse(x1, height-y1, 50,50);
};
for (int y1 = 25; y1 < 500; y1 = y1+50) {
  ellipse(x1, y1, 50,50);
  ellipse(width-x1, y1, 50,50);
};
//marco 2
for (int x1 = 50; x1 < 475; x1 = x1+50) {
  fill(100, 255, col, trans);
  ellipse(x1, y1*2, 50,50);
  ellipse(x1, height-y1*2, 50,50);
};
for (int y1 = 50; y1 < 475; y1 = y1+50) {
  ellipse(x1*2, y1, 50,50);
  ellipse(width-x1*2, y1, 50,50);
};
//marco 3
for (int x1 = 75; x1 < 450; x1 = x1+50) {
  fill(col, 255, 255, trans);
  ellipse(x1, y1*3, 50,50);
  ellipse(x1, height-y1*3, 50,50);
};
for (int y1 = 75; y1 < 450; y1 = y1+50) {
  ellipse(x1*3, y1, 50,50);
  ellipse(width-x1*3, y1, 50,50);
};
//marco 4
for (int x1 = 100; x1 < 425; x1 = x1+50) {
  fill(100, 255, col, trans);
  ellipse(x1, y1*4, 50,50);
  ellipse(x1, height-y1*4, 50,50);
};
for (int y1 = 100; y1 < 425; y1 = y1+50) {
  ellipse(x1*4, y1, 50,50);
  ellipse(width-x1*4, y1, 50,50);
};
//marco 5
for (int x1 = 125; x1 < 400; x1 = x1+50) {
  fill(col, 255, 255, trans);
  ellipse(x1, y1*5, 50,50);
  ellipse(x1, height-y1*5, 50,50);
};
for (int y1 = 125; y1 < 400; y1 = y1+50) {
  ellipse(x1*5, y1, 50,50);
  ellipse(width-x1*5, y1, 50,50);
}; 
//marco 6
for (int x1 = 150; x1 < 375; x1 = x1+50) {
  fill(100, 255, col, trans);
  ellipse(x1, y1*6, 50,50);
  ellipse(x1, height-y1*6, 50,50);
};
for (int y1 = 150; y1 < 375; y1 = y1+50) {
  ellipse(x1*6, y1, 50,50);
  ellipse(width-x1*6, y1, 50,50);
}; 
//marco 7
for (int x1 = 175; x1 < 350; x1 = x1+50) {
  fill(col, 255, 255, trans);
  ellipse(x1, y1*7, 50,50);
  ellipse(x1, height-y1*7, 50,50);
};
for (int y1 = 175; y1 < 350; y1 = y1+50) {
  ellipse(x1*7, y1, 50,50);
  ellipse(width-x1*7, y1, 50,50);
}; 
//marco 8
for (int x1 = 200; x1 < 325; x1 = x1+50) {
  fill(100, 255, col, trans);
  ellipse(x1, y1*8, 50,50);
  ellipse(x1, height-y1*8, 50,50);
};
for (int y1 = 200; y1 < 325; y1 = y1+50) {
  ellipse(x1*8, y1, 50,50);
  ellipse(width-x1*8, y1, 50,50);
}; 
//marco 9
for (int x1 = 225; x1 < 300; x1 = x1+50) {
  fill(col, 255, 255, trans);
  ellipse(x1, y1*9, 50,50);
  ellipse(x1, height-y1*9, 50,50);
};
//circulo central
  fill(100, 255, col, trans);
  ellipse(width/2, height/2, 50,50);
}



