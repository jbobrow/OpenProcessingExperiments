
int xPlads;
void setup(){
  size(500, 500);
  background(153, 201, 94);
  xPlads = CENTER;  
}

void draw(){
  background(153, 201, 94);
  tegnEllipserOgRect();
  tegnEllipse(20);
}


void tegnEllipse(){
  fill(255);
  ellipse(40, 200, 40, 40);
  fill(0);
  ellipse(60, 400, 20, 20);
}

void tegnEllipse(int x){
  fill(255);
  ellipse(xPlads, 200, 40, 40);
  fill(0);
  ellipse(xPlads, 400, 20, 20);
  
  xPlads = xPlads + (int)random(x);

  tjekX();
}

void tjekX(){
  if(xPlads > width){
    xPlads = 0;
  } else if(xPlads < 0){
    xPlads = width;
  }
}

void tegnEllipserOgRect(){
  fill(255);
  ellipse(40, 200, 40, 40);
  fill(0);
  ellipse(60, 400, 20, 20);
  fill(125);
  rect(200,200,50,50);
}



