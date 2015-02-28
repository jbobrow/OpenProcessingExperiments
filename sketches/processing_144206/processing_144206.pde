
color [] colores= {
  #A8E0FF, #99E0E8, #B5FFF2, #99E8C3, #A8FFBE
};
color [] colores2= {
  #FFCD09, #FFED54
};

int  z = width / 2;
int w = height / 2;
int incremento = 5;
float a = 100;
float b = 100;
float aspeed = 20;
float bspeed = 20;


void setup() {
  size(1000, 700);
  noStroke();
  background(#ffffff);
  smooth();
}

void draw() {
  for (int x=0; x<= width; x +=40) {
    for (int y=0; y<=height; y +=40) {
      frameRate(10);

      fill(colores[int(random(5))]);
      ellipse(x, y, 80, 80);
    }
  }

  fill(colores2[int(random(2))]);
  ellipse(z, w, 60, 60);
  if (keyPressed && key == CODED) {   
    if (keyCode == RIGHT) {   
      z+=incremento;
      frameRate(100);
    }
    else if (keyCode == LEFT) {
      z-=incremento;
      frameRate(100);
    }
    else if (keyCode == UP) {
      w-=incremento;
      frameRate(100);
    }
    else if (keyCode == DOWN) {
      w+=incremento;
      frameRate(100);
    }
  }

  noStroke();
  fill(255, 10);
  rect(0, 0, width, height);
  a = a + aspeed;
  b = b + bspeed;


  if ((a > width) || (a < 0)) {
    aspeed = aspeed * -1;
  }
  if ((b > height) || (b < 0)) {
    bspeed = bspeed * -1;
  }

  noStroke();
  fill(#ffffff);
  ellipse(a, b, 30, 30);
}

