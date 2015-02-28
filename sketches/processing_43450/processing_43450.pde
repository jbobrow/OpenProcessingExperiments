
float r=100;
float x, y;
float angle=0.0;
float easing=0.03;
float ease=0.0;
float theta = 0.0;


void setup() {
  size (600, 600);
  smooth();
}

void draw() {
  translate(width/2, height/2);
  background(10,3,255);
  float fillval = map (mouseX, 0, width, 0, 255); 
 fill(fillval);
 stroke(2);
 ellipse(x, y, 400, 400);



  if (keyPressed) {
    if (key == 'F' || key == 'f') {
      float r = map(mouseX, 0, width, 0, 255);
      float g=map(mouseY, 0, height, 0, 255);
      float b= 100;
      fill(r, g, b);
      ellipse(x, y, 400, 400);
    }
  } 
  else {
    fill(fillval);
    ellipse(x, y, 400, 400);
  }


  /*if (keyPressed) {
   if (key == 'D' || key == 'd') {
   float hues = map(mouseX, 0, width, 0, 100);
   fill(hues);
   ellipse(x, y, 400, 400);
   }
   } 
   else {
   fill(fillval);
   ellipse(x, y, 400, 400);
   }*/

  //float theta = 0.01+ (2.75 * sin(angle));
  ease += (mouseX - ease);
  float yY = map(ease, 0, width, 0, 8);
  float xX = map(ease, 0, width, 3, 0.20);
  middleCirc (xX, yY);
}



void middleCirc (float xX, float yY) {
  angle += xX;
  theta  =  + (yY * sin(angle));

  pushMatrix();
  
  //scale(3.0);
  noStroke();
  fill(144, 0, 111);
  scale(theta);
  ellipse(0, 0, 50, 50);
  popMatrix();
}

