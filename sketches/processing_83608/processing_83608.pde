
float[] rectX = {
  100, 200, 300, 400, 500
};
float[] rectY = {
  200, 200, 200, 200, 200
};
float[] rectWidth = {
  50, 50, 50, 50, 50
};
float[] rectHeight = {
  200, 200, 200, 200, 200
};
float[] colour = {
  (255), (255), (255), (255), (255) 
};
float[] colourHover = {
  (200), (100), (15), (90), (200) 
};

void setup() {
  size(600, 600);
}


void draw() {
  background(0);

  for (int i=0; i<rectX.length; i++) {

    if ((mouseX > rectX[i]) &&
      (mouseX < rectX[i]+rectWidth[i])&&
      (mouseY > rectY[i]) &&
      (mouseY < rectY[i]+rectHeight[i])) {
      fill(colourHover[i]);
    } 
    else {
      fill(colour[i]);
    } 

    rect(rectX[i], rectY[i], rectWidth[i], rectHeight[i]);
  }
}



