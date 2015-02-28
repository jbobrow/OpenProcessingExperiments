
float angle =0.0;


void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  translate(width/2, height/2);
  background(25);
  fill(255, 0, 0);
  int mode = 1;

  if (mode ==1) {


    if (mousePressed) {
      mode=2;
    }
  }
  if (mode==2) {



    angle +=0.08;
    float sinVal = sin(angle)*90;
    rect (0, sinVal, 30, 30);

    float cosVal = cos(angle)*90;
    rect(cosVal, 0, 30, 30);

    rect(10, 0, cosVal, 30);
    rect(cosVal, sinVal, 30, 30);

    rect(10, sinVal, 30, cosVal);
    rect(sinVal, 80, 30, 30);
    rect(-120, 30, 30, sinVal);
    rect(-220, 80, 30, sinVal);
    rect(-220, -80, sinVal,30);
    rect(220, -100, sinVal,30);

    rect(220, -100, sinVal,30);

    rect(-sinVal, -80, 30, 30);

    fill(125);

    rect(-240, cosVal, 30, sinVal);
    rect(-100, cosVal-60, sinVal, 30);
    rect(-160, cosVal+60, sinVal, 30);

    rect(140, cosVal, 30, cosVal);

    rect(240, cosVal, 30, 30);
    rect(-240, cosVal, sinVal, 30);
    rect(-140, sinVal, 30, 20);
    rect(sinVal, 40, 30, 30);
    rect(sinVal, 60, 30, cosVal);
    rect(140, cosVal, sinVal, 30);

    fill(255);

    rect(-150, 0, 30, sinVal);

    rect(-50, 20, 30, sinVal);
    rect(50, 50, 30, cosVal);
    rect(150, 100, 30, sinVal);

    rect(150, -90, 30, cosVal);
    rect(0, 40, 30, cosVal-3);
    rect(-90, 50, 30, cosVal);
    rect(0, 40, sinVal, 30);
    rect(100, 140, sinVal, 30);

    rect(-100, 140, cosVal, 30);
    rect(100, -180, cosVal, 30);

    fill(95);
    rect(200, 140, 30, sinVal);
    rect(250, cosVal, 30, sinVal);
    rect(75, cosVal, 30, sinVal);
    rect(-175, -120, 30, sinVal);

    fill(255, 0, 0);
  }
}
                    
