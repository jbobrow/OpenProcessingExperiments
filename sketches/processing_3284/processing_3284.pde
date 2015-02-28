
/*
* Written por 0p0.
*/

ArrayList bolas;

void setup() {
  size(600,600);
  //frameRate(30);
  bolas = new ArrayList();
  bolas.add(new Ball(width/2,height/2,random(-3,3),random(-3,3)));
  smooth();
  background(55);
}

void draw() {
  //uncomment next line to disable paint style
  //background(55);
  for (int i = bolas.size()-1; i >= 0; i--) { 
    Ball bola = (Ball) bolas.get(i);
    bola.drawBall();
    bola.moveBall();
    if (bola.finished()) {
      bolas.remove(i);
    }
  }
  println(bolas.size());
}

void mousePressed() {
  bolas.add(new Ball(width/2,height/2,random(-3,3),random(-3,3)));
}

//CLASS "BALL"
class Ball {
  float pox;
  float poy;
  float speedx;
  float speedy;
  int life = 1000;
  int lifeinit = life;

  Ball(float tempX,float tempY,float tempSpeedX,float tempSpeedY) {
    pox = tempX;
    poy = tempY;
    speedx = tempSpeedX;
    speedy = tempSpeedY;
  }

  void drawBall() {
    ellipseMode(CENTER);
    fill(map(life,0,lifeinit,0,255),map(life,0,lifeinit,0,255));;
    noStroke();
    strokeWeight(0.1);
    for(int i = bolas.size()-1; i >= 0; i --){
      ellipse(pox,poy,20,20);
    }
  }

  void moveBall() {
    pox = constrain(pox, 0, width);
    pox = pox + speedx;
    if (pox > width || pox < 0) {
      speedx = speedx * -1;
    }
    poy = constrain(poy, 0, height);
    //speedy = speedy + gravity;
    poy = poy + speedy;
    if (poy > height || poy < 0) {
      speedy = speedy * -1;
      speedx = speedx * 1;
    }
    
    /*
    //Uncommenting the next code block may be dangerous hehe
    //use at your own responsability ;)
    if (pox > width && poy > height/4 && poy < (height/4)*3 || pox < 0 && poy > height/4 && poy < (height/4)*3) {
      //bolas.add(new Ball(pox,poy,random(-7,7),random(-1,1)));
    }
    if (poy > height && pox > width/4 && pox < (width/4)*3 || poy < 0 && pox > width/4 && pox < (width/4)*3) {
      //bolas.add(new Ball(pox,poy,random(-1,1),random(-5,5)));
    }*/
  }

  Boolean finished() {
    life --;
    if (life <= 0) {
      return true;
    }
    else {
      return false;
    }
  }
}




