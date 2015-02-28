
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
    int x, r, g, b,tL,cL,tR,cR,body,head,aL,aR; 
    float inc,big,rotation,rate,y;
    AudioPlayer player;
    PImage head1;
    PImage body1;
    PImage armLeft;
    PImage armRight;
    PImage thighLeft;
    PImage thighRight;
    PImage calfLeft;
    PImage calfRight;
    PImage femaleHead;
    PImage femaleBody;
    PImage femaleArmLeft;
    PImage femaleArmRight;
    PImage femaleThighLeft;
    PImage femaleThighRight;
    PImage femaleCalfLeft;
    PImage femaleCalfRight;
    PImage dogHead;
    PImage bigDogHead;
  
  
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
      float fileFloat = random(1,25);
      int file = int(fileFloat);
      player = minim.loadFile("scream"+file+".wav",2048);
      player.loop();
      thighLeft= loadImage("maleLeftThigh.png");
      calfLeft = loadImage("maleLeftCalf.png");
      thighRight = loadImage("maleRightThigh.png"); 
      calfRight = loadImage("maleRightCalf.png");
      body1 = loadImage("maleBody.png");
      head1 = loadImage("maleHead.png");
      armRight = loadImage("maleRightArm.png");
      armLeft = loadImage("maleLeftArm.png");
      
      femaleThighLeft= loadImage("femaleLeftThigh.png");
      femaleCalfLeft = loadImage("femaleLeftCalf.png");
      femaleThighRight = loadImage("femaleRightThigh.png"); 
      femaleCalfRight = loadImage("femaleRightCalf.png");
      femaleBody = loadImage("femaleBody.png");
      femaleHead = loadImage("femaleHead.png");
      femaleArmRight = loadImage("femaleRightArm.png");
      femaleArmLeft = loadImage("femaleLeftArm.png");
      
      dogHead = loadImage("dogHead.png");
      bigDogHead = loadImage("bigDogHead.png");
      
      tL = ((int)random(2)+1);
      cL = ((int)random(2) + 1);
      tR = ((int)random(2) + 1);
      cR = ((int)random(2) +1);
      body = ((int)random(2) +1);
      head = ((int)random(4) +1);
      aR = ((int)random(2) +1);
      aL = ((int)random(2) +1);
      
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
      
      
      if (tL == 1) {
      image(thighLeft,-4,-5,9,28);
      }
      else {
      image(femaleThighLeft,-4,-5,9,28);
      }
     // point(0,0);
      //popMatrix();
      pushMatrix();
      translate(-2,24);
      
      rotate(cos(inc)-5);
   
      //line(0,0,12,25);
      
      if (cL == 1) {
      image(calfLeft,-4,-5,8,28);
      }
      else {
        image(femaleCalfLeft,-4,-5,8,28);
      }
      //pops back to mouse click position
      popMatrix();
      popMatrix();
     
      //other leg
      pushMatrix();
      rotate(cos(inc)*-1);
          
      //line(0,0,12,25);
      pushMatrix();
      translate(-5,-4);
        //rotate(-atan(25.0/12)+1.2);
       // point(0,0);
        //translate(0,-4);
        
        if (tR == 1) {
        image(thighRight,-4,-5,8,28);
        } 
        else {
          image(femaleThighRight,-4,-5,8,28);
        }
     // popMatrix();
      pushMatrix();
        
      translate(0,25);
      rotate(-cos(inc)-5);
     
      //line(0,0,12,25);
     
      if (cR == 1) {
      image(calfRight,-7,-5,9,28);
      } else {
         image(femaleCalfRight,-7,-5,9,28);
      }
      popMatrix();
      popMatrix();
      popMatrix();
      
      pushMatrix();  
      //body
      rotate((cos(inc/5)+2)/10);
      //line(0,0,1,-38);
      pushMatrix();
        rotate(atan(-38.0/1)+3.1415/2);
        
        if (body ==1) {
        image(body1,-9,-38,18,38);
        }
        else {
          image(femaleBody,-9,-38,18,38);
        }
      popMatrix();
      translate(1,-38);
      rotate((cos(inc/5))/10);
      //line(0,0,1,-5);
      
      //head
     
     if (head == 1) {
      image(head1,-7,-16,13,17);
     }
      else if (head==2) {
        image(femaleHead,-7,-16,13,17);
     }
     else if (head==3) {
       image(dogHead,-11,-22,22,29);
     } else {
       image(bigDogHead,-11,-22,22,29);
     }
      //strokeWeight(2);
      //ellipse(0,-11,12,12);
      
      //arms
      //strokeWeight(2);
      pushMatrix();
      translate(-8,3);
      rotate((sin(-inc)-3)*1.5);
      //line(0,0,19,19);
   
      scale(1.5);
      
      if (aR==1) {
      image(armRight,-3,0,6,27);
      }
      else {
        image(femaleArmRight,-3,0,6,27);
      }
      popMatrix();
      
      //other arm
      pushMatrix();
      translate(8,4);
      rotate(tan(19/19)-0.09);
      rotate(sin(-inc)-3);
     // line(0,0,19,19);
       scale(1.5);   
      
       if (aL == 1) {
      image(armLeft,-3,0,6,27);
       }
       else {
         image(femaleArmLeft,-3,0,6,27);
       }
      popMatrix();
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
    background(100,200,200);
    for (int i =600; i>=0; i=i-20) {
      int r = (int)(100-(((i-20)/(600.0-20))*random(256*abs(sphereScale))));
      int g = (int)(200-(((i-20)/(600.0-20))*random(256*abs(sphereScale))));
      int b = (int)(200-(((i-20)/(600.0-20))*random(256*abs(sphereScale))));
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
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


