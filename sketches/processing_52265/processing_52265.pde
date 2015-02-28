
int i = 40;
float y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y11, y12, y13, y14, y15;
float x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15;
float widthCirc, heightCirc;

void setup() {
  size(300, 300);
  background(255,0,0);
  
  widthCirc = 30;
  heightCirc = 60;
}

void draw() {

  noStroke();

//  constrain(mouseY, 0, height);
//  float mousePos = map(mouseY, 0, height, 10, 80);
//  println(mousePos);
//  widthCirc = mousePos;
//  heightCirc = mousePos;


  for (float angle = 0; angle < TWO_PI; angle += PI/24.0) {
    fill(255,0,0);
    ellipse(x1, (cos(angle) * 10.0) + i*1 + y1, widthCirc, heightCirc);
    x1++;
    y1--;

    fill(0,0,255);
    ellipse(x2, (cos(angle) * 10.0) + i*2 + y2, widthCirc, heightCirc);
    x2++;
    y2--;
    
    fill(255,0,0);
    ellipse(x3, (cos(angle) * 10.0) + i*3 + y3, widthCirc, heightCirc);
    x3++;
    y3--;

    fill(0,0,255);
    ellipse(x4, (cos(angle) * 10.0) + i*4 + y4, widthCirc, heightCirc);
    x4++;
    y4--;

    fill(255,0,0);
    ellipse(x5, (cos(angle) * 10.0) + i*5 + y5, widthCirc, heightCirc);
    x5++;
    y5--;

    fill(0,0,255);
    ellipse(x6, (cos(angle) * 10.0) + i*6 + y6, widthCirc, heightCirc);
    x6++;
    y6--;

    fill(255,0,0);
    ellipse(x7, (cos(angle) * 10.0) + i*7 + y7, widthCirc, heightCirc);
    x7++;
    y7--;
    
    fill(0,0,255);
    ellipse(x8, (cos(angle) * 10.0) + i*8 + y8, widthCirc, heightCirc);
    x8++;
    y8--;

    fill(255,0,0);
    ellipse(x9, (cos(angle) * 10.0) + i*9 + y9, widthCirc, heightCirc);
    x9++;
    y9--;

    fill(0,0,255);
    ellipse(x10, (cos(angle) * 10.0) + i*10 + y10, widthCirc, heightCirc);
    x10++;
    y10--;

    fill(255,0,0);
    ellipse(x11, (cos(angle) * 10.0) + i*11 + y11, widthCirc, heightCirc);
    x11++;
    y11--;

    fill(0,0,255);
    ellipse(x12, (cos(angle) * 10.0) + i*12 + y12, widthCirc, heightCirc);
    x12++;
    y12--;
    
    fill(255,0,0);
    ellipse(x13, (cos(angle) * 10.0) + i*13 + y13, widthCirc, heightCirc);
    x13++;
    y13--;

    fill(0,0,255);
    ellipse(x14, (cos(angle) * 10.0) + i*14 + y14, widthCirc, heightCirc);
    x14++;
    y14--;
    
    fill(255,0,0);
    ellipse(x15, (cos(angle) * 10.0) + i*15 + y15, widthCirc, heightCirc);
    x15++;
    y15--;

  }
}


