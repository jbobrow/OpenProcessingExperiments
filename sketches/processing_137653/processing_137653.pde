
int colorH = 0;

void setup(){
  size(800,800);
  background(255);
  colorMode(HSB, 250);
  smooth();
}

void draw(){
  
  drawBackground();
  
  scale(0.8, 0.8);
  
  int transX=0;
  int transY=0;
  
  for(int i = 0; i<=20; i++){
    pushMatrix();
    for(int j = 0; j<=20; j++){
        figure();
        translate(200, 0);
        transX+=200;
    }
    popMatrix();
    //translate(-transX, 0);
    translate(0, 200);
  }
  
  noLoop();
}

void figure(){
  
  pushMatrix();
  for(int i=1; i<=2; i++){
    pushMatrix();
    for(int j=1; j<=2; j++){
    //getColor();
    strokeWeight(0);
    rotate(PI*(i+j));
    translate((i-1)*200, (j-1)*200);

     arc4();
     rotate(PI/2);
     //getColor();
     arc4();

    }
    popMatrix();
    //translate(100*i, 0);
  }
  popMatrix();
}

void arc4(){
    noStroke();
    fill(colorH, 200, 200);
    arc(0, 0, 200, 200, 0, PI/2); 
    fill(colorH, 200, 150);
    arc(0, 0, 150, 150, 0, PI/2); 
    fill(colorH, 100, 100);
    arc(0, 0, 100, 100, 0, PI/2); 
    fill(colorH, 200, 50);
    arc(0, 0, 50, 50, 0, PI/2); 
    getColor();
}

void drawBackground(){
  noStroke();
colorMode(HSB, width);
for (int i = 0; i < width; i++) {
  for (int j = 0; j < height; j++) {
    stroke(i, j, width);
    point(i, j);
  }
}
colorMode(HSB, 250);
}

int getColor(){
  colorH += 10;
  if(colorH>200)
    colorH=0;
   return colorH;
}
