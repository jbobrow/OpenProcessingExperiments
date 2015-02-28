
int R = 0;
int G = 0;
int B = 0;
int S = 20;
int T = 255;
int W = 0;
float Rot = 0;

int mode = 1;

float timer = 0;
float xOne;
float yOne;
float xTwo;
float yTwo;

void setup(){
  size (700,500);
  background(255);
  frameRate(60);
}

void draw() {
  smooth();
  if (mousePressed == true){
    if (mouseButton == LEFT) {
      if (mouseX > 200) {
        if (mode == 1) {
            pushMatrix();
            noStroke();
            fill(R,G,B,T);
            translate(mouseX,mouseY);
            rotate(Rot);
            ellipse(0,0,S + W,S);
            popMatrix();
        }
        if (mode == 2) {
          pushMatrix();
          translate(mouseX,mouseY);
          rotate(Rot);
          float xOne = 0;
          float yOne = 0;
          float xTwo = xOne + sin(timer)*S/1.1;
          float yTwo = yOne + cos(timer)*S/1.1;
          fill(R + random(30)-random(30),G + random(30)-random(30),B + random(30)-random(30),T);
          triangle(xOne,yOne,xTwo,yTwo,xTwo + 10,yTwo + 10);
          popMatrix();
        }
        if (mode == 3){
          for(int i = 0; i < 200; i++) {
            fill(R+random(100)-random(100),G+random(100)-random(100),B+random(100)-random(100),T+random(100)-random(100));
            float xOne = mouseX + random(400) - random(400);
            float yOne = mouseY + random(400) - random(400);
            float xTwo = xOne + sin(i)*50 + random(50) - random(50);
            float yTwo = yOne + cos(i)*50 + random(50) - random(50);
            bezier(xOne,yOne,xOne + 100,yOne + 100,xTwo,yTwo,xTwo + 100,yTwo + 100);
          }
        }
      }
      if (mouseX >= 20 && mouseX <= 35) {
        if (mouseY >= 27 && mouseY <= 42) {
          R -= 1;
        }
        if (mouseY >= 67 && mouseY <= 82) {
          G -= 1;
        }
        if (mouseY >= 107 && mouseY <= 122) {
          B -= 1;
        }
        if (mouseY >= 147 && mouseY <= 162) {
          S -= 1;
        }
        if (mouseY >= 187 && mouseY <= 202) {
          T -= 1;
        }
        if (mouseY >= 227 && mouseY <= 242) {
          W -= 1;
        }
        if (mouseY >= 267 && mouseY <= 282) {
          Rot -= .1;
        }
      }
      if (mouseX >= 60 && mouseX <= 75) {
        if (mouseY >= 27 && mouseY <= 42) {
          R += 1;
        }
        if (mouseY >= 67 && mouseY <= 82) {
          G += 1;
        }
        if (mouseY >= 107 && mouseY <= 122) {
          B += 1;
        }
        if (mouseY >= 147 && mouseY <= 162) {
          S += 1;
        }
        if (mouseY >= 187 && mouseY <= 202) {
          T += 1;
        }
        if (mouseY >= 227 && mouseY <= 242) {
          W += 1;
        }
        if (mouseY >= 267 && mouseY <= 282) {
          Rot += .1;
        }
      }
      if (mouseX >= 130 && mouseX <= 170) {
        if (mouseY >= 20 && mouseY < 60) {
          mode = 1;
        }
        if (mouseY >= 60 && mouseY < 100) {
          mode = 2;
        }
        if (mouseY >= 100 && mouseY < 140) {
          mode = 3;
        }
      }
    }
    if (mouseButton == RIGHT) {
      if (mouseX > 100) {
        noStroke();
        fill(255);
        ellipse (mouseX,mouseY,S,S);
      }
    }
  }
  fill(255);
  stroke(0);
  rect(0,0,200,height);
  noStroke();
  
  textSize(20);
  fill(0);
  text("Brush",20,20);
  text("Type",120,20);
  
  fill(200,0,0);
  text("R",40,40);
  fill(0,200,0);
  text("G",40,80);
  fill(0,0,200);
  text("B",40,120);
  fill(0);
  text("S",40,160);
  text("T",40,200);
  text("W",40,240);
  text("R",40,280);
  
  text(R,40,60);
  text(G,40,100);
  text(B,40,140);
  text(S,40,180);
  text(T,40,220);
  text(W,40,260);
  
  fill(200);
  rect(60,27,15,15);
  rect(20,27,15,15);
  rect(60,67,15,15);
  rect(20,67,15,15);
  rect(60,107,15,15);
  rect(20,107,15,15);
  rect(60,147,15,15);
  rect(20,147,15,15);
  rect(60,187,15,15);
  rect(20,187,15,15);
  rect(60,227,15,15);
  rect(20,227,15,15);
  rect(60,267,15,15);
  rect(20,267,15,15);
  
  fill(0);
  text("+",60,40);
  text("-",20,40);
  text("+",60,80);
  text("-",20,80);
  text("+",60,120);
  text("-",20,120);
  text("+",60,160);
  text("-",20,160);
  text("+",60,200);
  text("-",20,200);
  text("+",60,240);
  text("-",20,240);
  text(">",60,280);
  text("<",20,280);
  
  ellipse(150,40,20,20);
  pushMatrix();
  translate(150,80);
  xOne = 0;
  yOne = 0;
  xTwo = xOne + sin(timer)*20/1.1;
  yTwo = yOne + cos(timer)*20/1.1;
  triangle(xOne,yOne,xTwo,yTwo,xTwo + 10,yTwo + 10);
  popMatrix();
  timer += .25;
  text("?",145,140);
  
  if (R > 255) {
    R = 255;
  }
  if (G > 255) {
    G = 255;
  }
  if (B > 255) {
    B = 255;
  }
  if (S > 100) {
    S = 100;
  }
  if (T > 255) {
    T = 255;
  }
  if (W > S) {
    W = S;
  }
  if (R < 0) {
    R = 0;
  }
  if (G < 0) {
    G = 0;
  }
  if (B < 0) {
    B = 0;
  }
  if (S < 1) {
    S = 1;
  }
  if (T < 0) {
    T = 1;
  }
  if (W < 0) {
    W = 0;
  }
  if (mode == 1) {
    pushMatrix();
    noStroke();
    fill(R,G,B,T);
    translate(100,400);
    rotate(Rot);
    ellipse(0,0,S + W,S);
    popMatrix();
  }
  if (mode == 2) {
    pushMatrix();
    translate(100,400);
    rotate(Rot);
    float xOne = 0;
    float yOne = 0;
    float xTwo = xOne + sin(timer)*S/1.1;
    float yTwo = yOne + cos(timer)*S/1.1;
    fill(R + random(30)-random(30),G + random(30)-random(30),B + random(30)-random(30),T);
    triangle(xOne,yOne,xTwo,yTwo,xTwo + 10,yTwo + 10);
    popMatrix();
  }
}

