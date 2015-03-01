
import java.awt.Frame;
import java.awt.BorderLayout;
ArrayList banglesCone_arr = new ArrayList();
ArrayList bangles_arr = new ArrayList();
ArrayList sparklesSet = new ArrayList();
float s1 = random(0, width);
int counter = 0;
int prevDirection = 0;

/*
static public void main(String args[]) {
  Frame frame = new Frame("testing");
  frame.setUndecorated(true);
  PApplet applet = new banglesOfBangles();
  frame.add(applet);
  applet.init();
  frame.setBounds(0, 0,4800, 600); 
  frame.setVisible(true);

}
*/
void setup() {
  background(0);
  size(4800, 600, P3D);
  noStroke();
  fill(255);
  banglesCone_arr.add(new BanglesCone(random(0, width), random(0, width)));
}

void draw() {
  background(0);   
  noStroke();

  for (int i = 0; i < sparklesSet.size(); i++) {
    Sparkles sp = (Sparkles) sparklesSet.get(i);
    if (sp.maxSpread1 > -250) {
      sp.updateSparkles();
      if (sp.type == 2) {
          sp.typeTwoSparks();
      }else {
          sp.createSparkles();
      }
    } else { //enough sparkles --> make it into Bangles
      println("yes!");
      if (counter > 7) {
        prevDirection = (int) random(0, 7);
        counter = 0;
      } 
      bangles_arr.add(new Bangles(sp.xpos, sp.ypos, prevDirection));
      sparklesSet.remove(i);
      counter++;
    }
  }

  for (int i = 0; i < banglesCone_arr.size(); i++) {
    BanglesCone bg = (BanglesCone) banglesCone_arr.get(i); 
    bg.update();
    bg.createBangleCone();
 
    if (bg.xB >= width || bg.xB <= 0
          || bg.yB >= height || bg.yB <= 0)  {
      
      banglesCone_arr.add(new BanglesCone(random(0, width), random(0, height)));
      sparklesSet.add(new Sparkles(bg.xB, bg.yB,  (int) random(0, 7), 1));
      sparklesSet.add(new Sparkles(bg.xB, bg.yB, (int) random(0, 7), 2));

    }
  }

  
  for (int i = 0; i < bangles_arr.size(); i++) {
    Bangles bg = (Bangles) bangles_arr.get(i);
    if (bangles_arr.size() > 16) {
      Bangles bg1 = (Bangles) bangles_arr.get(7);
      if (bg1.banglesToCone) {
        print("yes!");
        int j = 7;
        while (j >= 0) {
          bangles_arr.remove(j);
          j--;
        }
        banglesCone_arr.add(new BanglesCone(bg.xpos, bg.ypos));
      }
      break;
    } else {
        bg.update();
        bg.slowTransformBangles();
    }
  }

   if (banglesCone_arr.size() > 3) { //leave some always on screen
    ifCollide();
   }
}

void ifCollide() {
  BanglesCone temp1, temp2;
  beginShape();
    for (int i = 0; i < banglesCone_arr.size(); i++)  {
      for (int j = i; j < banglesCone_arr.size(); j++)  {
          temp1 = (BanglesCone) banglesCone_arr.get(i);
          temp2 = (BanglesCone) banglesCone_arr.get(j);
          float x1 = temp1.xB;
          float y1 = temp1.yB;
          float x2 = temp2.xB;
          float y2 = temp2.yB;
          float d = .5;
          if (dist(x1, y1, x2, y2) < temp1.maxDiam + temp2.maxDiam ) {
           temp1.opacityOfBangleCone--;
           stroke(255, 0, 0);
          }
          if (temp1.opacityOfBangleCone < 255) {
            if (temp1.opacityOfBangleCone < 0)  {
              banglesCone_arr.remove(j);
            } else {
              temp1.opacityOfBangleCone--;
            }
          }
      }
    }
     endShape();
}

class BanglesCone {
  ArrayList banglesCone_arr;
  float xB,yB,vxB,vyB;
  float speed = random(5, 10), angle, direction;
  int age = 0;
  int currentOp = 255;
  float maxDiam = random(80, 230);
  float opacityOfBangleCone = 255;
  float angleX = random(360);
  float angleY = random(360);
  
  BanglesCone(float xB, float yB) { 
    banglesCone_arr = fillBanglesCone(maxDiam);
    this.xB = xB;
    this.yB = yB;
    flyRandom();
  }
  
  /* creates a cone full of bangles */
  public ArrayList fillBanglesCone(float BanglesConeDiam) {
    ArrayList temp = new ArrayList();
    while (BanglesConeDiam > 0) {
      temp.add(new Bangles(BanglesConeDiam));
      BanglesConeDiam  -= 10;
    }
    return temp;
  }
  
  void update() {
    age++;
    xB += vxB*speed;
    yB += vyB*speed;
    if (yB > height) {
      yB =height;
      vyB *= -.8; 
    }
  
    if (yB < 0) {
      yB =0;
      vyB *= -.8;    
    }
    
    if(xB < 0) {
      xB = 0;
      vxB *= -1;    
    }
    
    if(xB > width) {
      xB = width;
      vxB *= -1;    
    }
    fill(255);
  }
  
  void flyRandom() {
    vxB = random(-1, 1);
    vyB = random(-1, 1); 
  }
  
  void createBangleCone() {
    pushMatrix();
    int rotT = 0;
    for (int i = 0; i< banglesCone_arr.size(); i++) {
      Bangles bg = (Bangles) banglesCone_arr.get(i);    
      pushMatrix();  
      translate(xB, yB);
      rectMode(CENTER);
      bg.createBangles(opacityOfBangleCone);
      popMatrix(); 
    }
   popMatrix(); 
  }
  

}


class Bangles {
  boolean yOutofBounds, xOutofBounds;
  float angle = 0;
  int direction;
  float diam = random(5, 15);
  int age = 0;
  int currentOp = 255;
  float bgDiam;
  float xpos, ypos;
  int rotT = 1; 
  float r, g, b;
  float rate =  100;
  float y = 10000, vx, vy;
  int limit = 200;
  int sc = 2;
  float speed = random(1, 10);
  float angleX = random(360);
  float angleY = random(360);
  boolean banglesToCone = false;
  int lineToCircle = 60;
  float cR = random(0,255), cG=random(0, 255), cB=random(0, 255);
  
  Bangles(float bgDiam) {
    this.bgDiam = bgDiam;
  }
  
  Bangles(float xpos, float ypos, int direction) {
    this.bgDiam = random(0, 70);
    this.xpos = xpos;
    this.ypos = ypos;
    directionToMove(direction);
  }
  
  void createBangles(float opacityOfBangleCone) {
    float rotT = 0;
    noStroke();
    pushMatrix();
    rotate(10);
    for (int i = 0; i< 100; i++) {
        rotate(angle);
        fill(random (55), random(155) ,random(255), opacityOfBangleCone);
        ellipse(0, bgDiam, diam, diam);
        angle += 2;
    }
    popMatrix();
   colorMode(RGB,255, 255, 255, 255);  
  }
   
  void update() {
    if (angleX > 360) {
      angleX =  0;
    }
    if (angleY > 360) {
      angleY = 0;
    }
    angleX+=1;
    angleY+=1;
    underTheLimits();

    if (yOutofBounds && xOutofBounds) {
      banglesToCone = true;
    } else {
      angle=0;
      if (rotT  < 50) {
        rotT++;
      }
      if (rate > 0) {
        rate--;
      } else {
        this.xpos += vx*speed;
        this.ypos += vy*speed;
      }
      if (limit < 360) {
          limit++;
       }
       if (sc > 1) {
         sc-= .0001;
       }

       while (lineToCircle  > 0) {
         lineToCircle--;
       }
    }
  }
  
  void slowTransformBangles() {
    float y = rate;
    float angle = 0;
    noStroke();
    pushMatrix();
    translate(xpos, ypos);
    rotateX(radians(angleX));
    rotateY(radians(angleY));
    while (angle < limit) {
      pushMatrix();
        translate(0, y);
        rotate(radians(angle));
        fill(random (55), random(155) ,random(255) );
        ellipse(lineToCircle,  bgDiam, diam, diam);
        angle++;
        if (y > 0) {
          y--;
        }
     popMatrix(); 
    }
    popMatrix();  
  }
  
  
  void slowTransformBangles1() {
    noStroke();
    pushMatrix();
    translate(xpos, ypos);
    for (int i = 0; i< 100; i++) {
        translate(0, angle);
        fill(random (55), random(155) ,random(255) );
        ellipse(0, bgDiam, diam, diam);
        angle++;
    }
    popMatrix();  
  }
  
  
   void directionToMove(int direction) {
    if (direction == 0) {
      vx = 0;
      vy = -1;
    }
    
    //go to the right and up.
    if (direction == 1) {
      vx = 1;
      vy = -1;
    }
    
    //go to the right
    if(direction == 2) {
      vx = 1;
      vy = 0; 
    }
    
    //go to the lower right..
    if (direction == 3) {
      vx = 1;
      vy = 1;
    }
    
    //go straight down the stage.
    if (direction == 4) {
      vx = 0;
      vy = 1;
    }
    //go lower left
    if (direction == 5) {
      vx = -1;
      vy = 1;
    }
    //go left.
    if(direction ==6) {
      vx=-1;
      vy=0;
    }
    
    //go upper left
    if(direction ==7) {
      vx=-1;
      vy=-1;
    }
  }
  
  void underTheLimits() {
    if (ypos > height) {
      ypos = height-50;
     //reverse course in vy.
      vy *= -.8;
      yOutofBounds = true;
    }
  
    if (ypos < 0) {
      //force the object back to the stage
      ypos =0+50;
     //reverse course in vy.
      vy *= -.8; 
      yOutofBounds = true;
    }
    
    if(xpos < 0) {
      xpos = 0+50;
      vx *= -1;
      xOutofBounds = true;
    }
    
    if(xpos > width) {
      xpos = width-50;
      vx *= -1;
      xOutofBounds = true;

    }
  }
}

class Sparkles {
  float xpos, ypos, maxSpread = 500, maxSpread1 = 100, maxSpread2 = 100;
  int direction;
  float vx,vy;
  float speed;
  int age = 1;
  boolean constant = false;
  float x, y;
  float xScVal, yScVal;
  boolean yOutofBounds = false, xOutofBounds = false;
  int con = 1;
  float r, g, b;
  int type = 1;
  Sparkles(float xB, float yB, int direction, int type) {
    this.xpos = xB;
    this.ypos  = yB;
    this.speed = random(1,5);
    this.direction = direction;
    directionToMove(direction);
    this.xScVal = random(.8,1.1);
    this.yScVal = random(1,1.2);
    this.type = type;
  }
  
  void typeTwoSparks() {
    pushMatrix();
    translate(this.xpos, this.ypos);
    if (constant) {
      scale(xScVal,yScVal);
        for (int i = 0; i < 1000; i++) {
             float x = cos(i) *random(1, random(1, maxSpread2));
             float y = sin(i) * i* random(.06, .2);
             ellipse(x, y, random(1, 2), random(1, 2));
             strokeWeight(random(1,3));
             stroke(random(0,x+y*2),random(0,x*2),random(0,y*2),150);
        }
    } 
    if (maxSpread2 >  -10) {
      maxSpread2--;
    } else {
      maxSpread2 = random(80, 120);
    }
    popMatrix();
  }

  void createSparkles() {
    pushMatrix();
    translate(this.xpos, this.ypos);
    if (constant) {
      scale(xScVal,yScVal);
        for (int i = 0; i < 1000; i++) {
             float x = cos(i) *random(1, random(1, maxSpread1));
             float y = sin(i) * i* random(.06, .2);
             ellipse(x, y, random(1, 2), random(1, 2));
             strokeWeight(random(1,3));
             if (maxSpread1 > -60) {
               stroke(random(0,x+y*2),random(0,x*2),random(0,y*2),150);
             } else {
             if (i%2 == 0) {
               stroke(random(0,x+y*2),random(0,x*2),random(0,y*2),150);
             } else {
               stroke(random (55), random(155) ,random(255) );
             }
             }
        }
    } else {
      scale(xScVal,yScVal);
      for (int i = 0; i < 1000; i++) {
           float x = cos(i) *random(1, random(1, maxSpread));
           float y = sin(i) * i* random(.06, .2);
           point(x,y);
           strokeWeight(random(1,3));
           r = random(0,x+y*2);
           g = random(0,x*2);
           b = random(0,y*2);
           stroke(r, g, b,200);
      }
    }
    popMatrix();
  }
  
  void updateSparkles() {
    if ((yOutofBounds || xOutofBounds) && (this.age > 130)) {
      constant = true;
      //if (maxSpread1 > 4) {
        maxSpread1-=2;
      //}
      if (xScVal > 3 || yScVal > 3 ) {
        xScVal=3;
        yScVal=3;
      } else {
        xScVal+=.1;
        yScVal+=.1;
      }
    } else {
      this.xpos += vx*speed;
      this.ypos += vy*speed;
      maxSpread-=2;
      underTheLimits();
      this.age++;
    }
  }
  
  void directionToMove(int direction) {
    if (direction == 0) {
      vx = 0;
      vy = -1;
    }
    
    //go to the right and up.
    if (direction == 1) {
      vx = 1;
      vy = -1;
    }
    
    //go to the right
    if(direction == 2) {
      vx = 1;
      vy = 0; 
    }
    
    //go to the lower right..
    if (direction == 3) {
      vx = 1;
      vy = 1;
    }
    
    //go straight down the stage.
    if (direction == 4) {
      vx = 0;
      vy = 1;
    }
    //go lower left
    if (direction == 5) {
      vx = -1;
      vy = 1;
    }
    //go left.
    if(direction ==6) {
      vx=-1;
      vy=0;
    }
    
    //go upper left
    if(direction ==7) {
      vx=-1;
      vy=-1;
    }
  }
  
  void underTheLimits() {
    if (ypos > height) {
      ypos = height;
     //reverse course in vy.
      vy *= -.8;
      yOutofBounds = true;
    }
  
    if (ypos < 0) {
      //force the object back to the stage
      ypos =0;
     //reverse course in vy.
      vy *= -.8; 
      yOutofBounds = true;
    }
    
    if(xpos < 0) {
      xpos = 0;
      vx *= -1;
      xOutofBounds = true;
    }
    
    if(xpos > width) {
      xpos = width;
      vx *= -1;
      xOutofBounds = true;

    }
  }  
}

/*
void mouseMoved(){
  fill(255);
  text( "x: " + mouseX + " y: " + mouseY, mouseX + 2, mouseY );
}
*/
