
int numBugs = 1;
Bug[] bug = new Bug[numBugs];

boolean a = false;

int status = 0;

void setup() {
  size(640, 640, P2D);
  for (int i = 0; i < numBugs; i++) {
    bug[i] = new Bug();
  }
}

void draw() { 
  
  println("status="+status);
  println("a="+a);
  if (a == true) {
    for (int i = 0; i < numBugs; i++) {
      if (status == 1) {
        bug[i].effectDraw();
      } else if (status == 2) {
        bug[i].effectDraw2();
      } else if (status == 3) {
        bug[i].effectDraw3();
      } else if (status == 4) {
        bug[i].effectDraw4();
      } else {
        bug[i].effectDraw5();
      }
      bug[i].moveUserIn();
    }
  } else {
    background(100);
    pushMatrix();
    rectMode(CENTER);
    fill(255);
    rect(width/2, height/2, 65, 65);
    popMatrix();
    for (int i = 0; i < numBugs; i++) {
      bug[i].draw();
      //bug[i].effectDraw();
      bug[i].moveUserOut();
    }
  }
}

void keyPressed() {
  if (a == false) {
    a = true;
  } else {
    a = false;
  }

  //

  if (status < 5 && a == true) {
    status += 1;
  }
  if (status == 5) {
    status = 0;
  }
}

class Bug {

  float vx, vy, posX, posY, distance;

  float d;
  float red;
  float green;
  float blue;

  int rad = 2;

  //EFFECTDRAW2
  float t;
  float x;
  float y;
  float xv;
  float yv;
  float tt;
  float c;


  Bug() {
    this.vx = 0;
    this.vy = 0;
    this.posX = 320;
    this.posY = 320;

    //EFFECTDRAW3
    this.x = width / 2;
    this.y = height / 2;
  }

  public void draw() {
    //background(50);
    noStroke();
    fill(0);
    ellipse(this.posX, this.posY, 5, 5);
  }

  public void effectDraw() {
    noStroke();
    fill(150, 60);
    distance =random(0, 150);
    ellipse(this.posX, this.posY, 50+distance, 50+distance);
    loadPixels();

    for (int i=0; i<height; i++) {
      for (int j=0; j<width; j++) {

        color c = pixels[i*width+j];

        red = c <<5 & 0xff;
        green = c << 1 & 0xaa;
        blue = c & 0xff;

        d =dist(this.posX, this.posY, j, i)*.4;

        red += 50/d-rad;
        green += 50/d-rad;
        blue += 155/d-rad;

        pixels[i*width+j]=color(red, green, blue);
      }
    }

    updatePixels();
  }

  public void effectDraw2() {
    //    if (mousePressed) {
    //      xv += 0.01 * (this.posX - this.x);
    //      yv += 0.01 * (this.posY - this.y);
    //    } else {
    //      xv /= 1.1;
    //      yv /= 1.1;
    //    }
    xv += 0.01 * (this.posX - this.x);
    yv += 0.01 * (this.posY - this.y);

    float[][] pixi = new float[width][height];
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        t = dist(i, j, this.posX, this.posY);
        tt = dist(i, j, this.x, this.y);
        c = t*tt;
        if (c > 100 && c < 120) {
          c = 0;
        }
        pixi[i][j] = 255 - (c / 20);
        c=0;
      }
    }
    for (int i = 0; i < width; i++) {
      for (int j = 0; j < height; j++) {
        t = pixi[i][j];
        stroke(t, 20 + t, 50 + t*1.2, 255);
        point(i, j);
      }
    }
    this.x += xv;
    this.y += yv;
  }

  public void effectDraw3() {
  }

  public void effectDraw4() {
    fill(255, 100);
    stroke(10, 120, 50);
    ellipse(this.posX, this.posY, 50, 50);
    noFill();
    stroke(random(0, 255), 120, 50, 60);
    ellipse(this.posX, this.posY, 100, 100);
  }

  public void effectDraw5() {
    rectMode(CENTER);
    fill(255, 100);
    stroke(10, 120, 50);
    rect(this.posX, this.posY, 50, 50);
    noFill();
    stroke(random(0, 255), 120, 50, 60);
    ellipse(this.posX, this.posY, 100, 100);
  }


  ////////////////////////////////////////////////////////////////
  public void moveUserIn() {
    this.vx += random(-0.1, 0.1) * 55.00 ;
    this.vy += random(-0.1, 0.1) * 55.00 ;

    // Friction
    this.vx *= 0.95;  
    this.vy *= 0.95;

    // Move
    this.posX += this.vx;
    this.posY += this.vy;

    // Stage boundaries

    if (this.posX > width) {
      this.posX = width;
      // Reverse
      this.vx *= -1;
    }
    if (this.posX < 0) {
      this.posX = 0;
      this.vx *= -1;
    }
    if (this.posY > height) {
      this.posY = height;
      this.vy *= -1;
    }
    if (this.posY < 0) {
      this.posY = 0;
      this.vy *= -1;
    }
  }


  public void moveUserOut() {
    this.vx += random(-0.1, 0.1) * 1.00 ;
    this.vy += random(-0.1, 0.1) * 1.00 ;

    // Friction
    this.vx *= 0.95;  
    this.vy *= 0.95;

    // Move
    this.posX += this.vx;
    this.posY += this.vy;

    // Stage boundaries

    if (this.posX > 350) {
      this.posX -= random(1, 10)*1.00;
      this.vx *= -1;
    }
    if (this.posX < 290) {
      this.posX += random(1, 10)*1.00;
      this.vx *= -1;
    }
    if (this.posY > 350) {
      this.posY -= random(1, 10)*1.00;
      this.vy *= -1;
    }
    if (this.posY < 290) {
      this.posY += random(1, 10)*1.00;
      this.vy *= -1;
    }
  }
}



