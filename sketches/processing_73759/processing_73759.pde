
void setup() {
  size(600, 600);
}

void draw() {
  int t = millis(); 
  background (0);
  //println(t);
  if (t >=0) {               //stage 1
    noStroke();
    fill(30);
    ellipse(300, 300, 400, 400);
    fill(50);
    ellipse(300, 300, 330, 330);
    fill(80);
    ellipse(300, 300, 300, 300);
    fill(130);
    ellipse(300, 300, 280, 280);
    fill(180);
    ellipse(300, 300, 265, 265);
    fill(230);
    ellipse(300, 300, 240, 240);
    fill(255, 255, 191);
    ellipse(300, 300, 200, 200);
    fill(255, 255, 140);
    ellipse(300, 300, 160, 160);
    fill(252, 255, 106);
    ellipse(300, 300, 130, 130);
    fill(251, 255, 64);
    ellipse(300, 300, 100, 100);
    fill(250, 255, 13);
    ellipse(300, 300, 50, 50);
  }
  if  (t>=1000) {             //stage 2
    background (0);
    fill(255, 166, 0);
    int y = 300;
    int x = 300;
    beginShape();
    vertex(x-15, y+45);
    vertex(x, y+75);
    vertex(x+15, y+48);

    vertex(x+32, y+68);
    vertex(x+36, y+37);

    vertex(x+63, y+40);

    vertex(x+48, y+15);
    vertex(x+75, y);
    vertex(x+45, y-15);

    vertex(x+63, y-40);
    vertex(x+36, y-37);
    vertex(x+32, y-68);

    vertex(x+15, y-48);
    vertex(x, y-75);
    vertex(x-15, y-48);

    vertex(x-32, y-68);
    vertex(x-36, y-37);
    vertex(x-63, y-40);

    vertex(x-48, y-15);
    vertex(x-75, y);
    vertex(x-48, y+15);

    vertex(x-63, y+40);
    vertex(x-36, y+37);
    vertex(x-32, y+68);

    endShape();
    fill(250, 255, 13);
    ellipse(300, 300, 100, 100);
  }

  if (t>=2000) {            //stage 3
    background (0);
    int x=300;
    int y=300;
    fill(255, 100, 0);
    beginShape();
    vertex(x-15, y+45);
    vertex(x, y+75);
    vertex(x+15, y+48);

    vertex(x+32, y+68);
    vertex(x+36, y+37);

    vertex(x+63, y+40);

    vertex(x+48, y+15);
    vertex(x+75, y);
    vertex(x+45, y-15);

    vertex(x+63, y-40);
    vertex(x+36, y-37);
    vertex(x+32, y-68);

    vertex(x+15, y-48);
    vertex(x, y-75);
    vertex(x-15, y-48);

    vertex(x-32, y-68);
    vertex(x-36, y-37);
    vertex(x-63, y-40);

    vertex(x-48, y-15);
    vertex(x-75, y);
    vertex(x-48, y+15);

    vertex(x-63, y+40);
    vertex(x-36, y+37);
    vertex(x-32, y+68);

    endShape();
    fill(255, 141, 0);
    ellipse(300, 300, 100, 100);
  }

  if (t>=3000) {           //stage 4
    background(0);
    int x=300;
    int y=300;
    pushMatrix();
    scale(3.0);
    translate(-200, -200);
    fill(255, 75, 0);
    beginShape();
    vertex(x-15, y+45);
    vertex(x, y+75);
    vertex(x+15, y+48);

    vertex(x+32, y+68);
    vertex(x+36, y+37);

    vertex(x+63, y+40);

    vertex(x+48, y+15);
    vertex(x+75, y);
    vertex(x+45, y-15);

    vertex(x+63, y-40);
    vertex(x+36, y-37);
    vertex(x+32, y-68);

    vertex(x+15, y-48);
    vertex(x, y-75);
    vertex(x-15, y-48);

    vertex(x-32, y-68);
    vertex(x-36, y-37);
    vertex(x-63, y-40);

    vertex(x-48, y-15);
    vertex(x-75, y);
    vertex(x-48, y+15);

    vertex(x-63, y+40);
    vertex(x-36, y+37);
    vertex(x-32, y+68);

    endShape();
    fill(255, 0, 0);
    ellipse(300, 300, 100, 100);
    popMatrix();
  }

  if (t>=4000) {               //stage 5
    background(0);
    fill(124);
    ellipse(300, 300, 200, 200);
    fill(150);
    ellipse(300, 300, 170, 170);
    fill(180);
    ellipse(300, 300, 100, 100);
    fill(255);
    ellipse(300, 300, 50, 50);
    fill(255, 246, 149);
    ellipse(300, 300, 35, 35);
    fill(255, 241, 80);
    ellipse(300, 300, 20, 20);
    fill(255, 234, 0);
    ellipse(300, 300, 10, 10);
  }

  if (t>=5000) {           //stage 6
  background(150);
    drawSupernova(300,300);
  
  }
}

void drawSupernova(float g, float f){
  
  ellipseMode(RADIUS);
  int radius = 500;
  for (int r = radius; r>0; r=r-10){
  float h = random(0,360);
  fill(250,250,h);
  ellipse(g,f, r,r);
  h=(h+1) % 360;
  }
}
