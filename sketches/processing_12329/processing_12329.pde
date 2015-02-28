
  import ddf.minim.signals.*;
  import ddf.minim.*;
  import ddf.minim.analysis.*;
  import ddf.minim.effects.*;
  
  
  DrawMan[] guys = {
  };
  Minim minim;
  AudioPlayer player;
  float sphereScale = 1;
  PImage img;
  
  void setup() {
    size(600,600);
    minim = new Minim(this); 
  
    //guys = (DrawMan[])append(guys, new DrawMan(300,300,0.0));
  }
  void mousePressed() {
    guys = (DrawMan[])append(guys, new DrawMan(mouseX,mouseY,0.0));
   
  }
  class DrawMan {
    int x, r, g, b,f1; 
    float inc,big,rotation,rate,y;
    AudioPlayer player;
    PImage flower1;
    PImage flower2;
    PImage flower3;
    PImage flower4;
    PImage flower5;
  
  
    DrawMan(int xpos, int ypos,float time) {
      x = xpos;
      y = ypos;
      player = player;
      minim = minim;
      inc = time;
      big = 1;
      r = r;
      g = g;
      b = b; 
      rotation = rotation;
      rate=random(10);
      float fileFloat = random(1,10);
      int file = int(fileFloat);
      player = minim.loadFile("bell"+file+".wav",2048);
      player.loop();
     flower1= loadImage("flower.png");
     flower2= loadImage("Helianthus_divaricatus_flowers.png");
     flower3= loadImage("Hibiscus_waimeae_flower.png");
     flower4= loadImage("hibiscus-flowers-are.png");
     flower5= loadImage("LoopyPetals.png");
     
     f1 = ((int)random(5)+1);
          
     }
    void DrawMan() {
      stroke(r, g, b);
      smooth();
      strokeWeight(2);
      //cause guys to fall
      y = y+1*rate;
      pushMatrix();
      translate(x,y);
      rotate(rotation);
      rotate(inc*0.34);//this is what makes them spin, inc is a variable that grows
      scale(big+1);
      inc += 0.05*rate;//this is where inc grows
      //remember x,
      pushMatrix();
      //one leg
      
      rotate(cos(inc));
      
      //line(0,0,12,25);
      pushMatrix();
      translate(5,-4);
      rotate(-atan(25.0/12)+1.2);
      
      
      if (f1 == 1) {
      image(flower1,0,0,17,24);
      }
       if (f1 == 2) {
      image(flower2,0,0,25,25);
      }
       if (f1 == 3) {
      image(flower3,0,0,25,21);
      }
       if (f1 == 4) {
      image(flower4,0,0,25,11);
      }
       if (f1 == 5) {
      image(flower5,0,0,34,18);
      }
     
      popMatrix();
     popMatrix();
      popMatrix();
    }
    int getX() {
      return x;
    }
    float getY() {
      return y;
    }
    void resetY() {
      y = -30;
    }
    void setBig(float big) {
      this.big = big;
    }
    void setR(int r) {
      this.r = r;
    }
    void setG(int g) {
      this.g = g;
    }
    void setB(int b) {
      this.b = b;
    }
    void setRotation(float rotation) {
      this.rotation = rotation;
    }
    void movePosTowards() {
      if (this.x > mouseX) {
        this.x= x-3;
      }
      if (this.y > mouseY) {
        this.y = y-1*rate;
      }
      else if (this.x <= mouseX) {
        this.x = x+3;
      }
      else if (this.y <= mouseY) {
        this.y = y+1*rate;
      }
    }
    void movePosAway() {
      if (this.x > mouseX) {
        this.x = x+3;
      }
      if (this.y > mouseY) {
        this.y = y+4;
      }
      else if (this.x <= mouseX) {
        this.x = x-3;
      }
      else if (this.y <= mouseY) {
        this.y = y-4;
      }
    }
    void moveAwayFromGuys(DrawMan g) {
      int guysX = abs(this.x - g.x);
      float guysY = abs(this.y - g.y);
      float guysDis = sqrt(guysX*guysX + guysY*guysY);
      if (guysDis <= 15) {
  
        if (g.x < this.x) {
          this.x++;
        }
        if (g.x > this.x) {
          this.x--;
        }
        if (g.y < this.y) {
          this.y++;
        }
        if (g.y > this.y) {
          this.y--;
        }
      }
    }
    void setRate(float rate) {
      this.rate = rate;
      //set volume here
      float x = pow((rate-1)/800,2);
       player.setGain(-10*(rate-1));
    }
  }
  void draw() {
    background(238,131,234);
    for (int i =600; i>=0; i=i-20) {
      int r = (int)(238-(((i-20)/(600.0-20))*random(256*abs(sphereScale))));
      int g = (int)(131-(((i-20)/(600.0-20))*random(256*abs(sphereScale))));
      int b = (int)(234-(((i-20)/(600.0-20))*random(256*abs(sphereScale))));
      noFill();
      strokeWeight(20);
      stroke(r,g,b);
      if (mousePressed == true) {
  
        if (mouseButton == LEFT) {
          sphereScale = -0.5;
        }
        if (mouseButton == RIGHT) {
          sphereScale = 0.5;
        }
      } 
      sphereScale = 0.995*(sphereScale);
      ellipse(mouseX, mouseY, i*(sphereScale+1),i*(sphereScale+1)); 
    }
    for (int i =300; i>=0; i=i-20) {
      int r = (int)(100-(((i)/(300.0))*100));
      int g = (int)(200-(((i)/(300.0))*100));
      int b = (int)(200-(((i)/(300.0))*100));
      noFill();
      strokeWeight(20);
      stroke(r,g,b,50);
  
      ellipse(mouseX, mouseY, i,i); 
    }
  
    for (int i =0; i<guys.length; i++) {
      guys[i].DrawMan();
  
      //remove from array--just make them come back down   
      if (guys[i].getY() >= 630) {
        guys[i].resetY();
      }
    }
    //get point values for guys
    for (int i =0; i<guys.length; i++) {
      for (int j = 1; j<guys.length; j++) {
        guys[i].moveAwayFromGuys(guys[j]);
      } 
      int closeX = guys[i].getX();
      float closeY = guys[i].getY();
      //get abs distance between cursor and guys
      int xdis = abs(mouseX - closeX);
      float ydis = abs(mouseY - closeY);
      float dis = sqrt(xdis*xdis+ydis*ydis);
      //set scale factor
      guys[i].setBig(pow((600-dis)/600,3));
      if (dis<5) {
        guys[i].setRate(0);
      }
      else {
        guys[i].setRate(pow((600+dis)/600,4));
      }
      //set colors
      guys[i].setR(15);
      guys[i].setG(20);
      guys[i].setB(55);
      if (mousePressed == true) {
        if (mouseButton == LEFT) {
          guys[i].movePosTowards();
        }
        if (mouseButton == RIGHT) {
          guys[i].movePosAway();
        }
      }
      //set rotation
      if (dis == 0) {
        dis = dis+0.01;
      }
      if (mouseY < closeY && mouseX >= closeX) {
        guys[i].setRotation(-asin(ydis/dis));
      } 
      else if ((mouseX < closeX) && (mouseY < closeY)) {
        guys[i].setRotation(PI+asin(abs(ydis/dis)));
      } 
      else if (mouseX < closeX) {
        guys[i].setRotation(PI-asin(ydis/dis));
      }
      else {
        guys[i].setRotation(asin(ydis/dis));
      }
    }
  }
  
  void stop() {
    player.close();
    minim.stop();
    super.stop();
  }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


