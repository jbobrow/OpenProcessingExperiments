
float easing= 0.5;
PImage cow;
PImage cow1;
PImage cow2;
PImage cow3;
PImage steak1;
PImage steak2;
PImage ground1;
PImage ground2;
PImage ground3a;
PImage ground4;
PImage sausage1;
PImage sausage3;
PImage tripe2;

void setup() {
  size(640,480);
  smooth();
  frameRate(10);
  cow=loadImage("cow.png");
  cow1=loadImage("cow1.png");
  cow2= loadImage("cow2.png");
  cow3=loadImage("cow3.png");
  steak1= loadImage("steak1.png");
  steak2= loadImage("steak2.png");
  ground1= loadImage("ground1.png");
  ground2= loadImage("ground2.png");
  ground3a= loadImage("ground3a.png");
  ground4= loadImage("ground4.png");
  sausage1= loadImage("sausage1.png");
  sausage3= loadImage("sausage3.png");
  tripe2= loadImage("tripe2.png");
}

void draw() {
  background(157,28,32); 

  imageMode(CENTER);

  if(mouseX>=498) {
    if(mouseX<=515) {
      int o=mouseX-498;
      float i=map(o,0,17,0,255);
      pushMatrix();
      translate(320,240);
      tint(255,i);
      drawTripe2(0,0,1);
      noTint();
      popMatrix();
    }
  }

  if(mouseX>=516) {
    if(mouseX<=568) {
      int a=mouseX-516;
      float s=map(a,0,52,1,1.45);
      pushMatrix();
      translate(320,240);
      drawTripe2(0,0,s);
      popMatrix();
    }
  }

  if(mouseX>=569) {
    if (mouseX<=640) {
      int a=mouseX-569;
      float r1=random(0.9,1.45);
      float r2=random(0.9,1.45);
      float s=map(a,0,71,r1,r2);
      pushMatrix();
      translate(320,240);
      drawTripe2(0,0,s);
      popMatrix();
    }
  }

  if(mouseX>=427) {
    if (mouseX<=497) {
      int o= mouseX-427;
      float i=map(o,0,70,0,255);
      pushMatrix();
      translate(320,240);
      tint(255,i);
      drawGround3a(0,0,1.08);
      noTint();
      popMatrix();
    }
  }

  if (mouseX>=498) {
    float m=millis();
    pushMatrix();
    translate(320,240);
    rotate((m/1000)*2);
    drawGround3a(0,0,1.08);
    popMatrix();
  }

    imageMode(CENTER);

    if (mouseX>=72) {
      if (mouseX<=142) {

        int a=mouseX-72;
        float s=map(a,0,70,0,1);
        pushMatrix();
        translate(320,240);
        drawSteak1(0,0,s);
        popMatrix();
      }
    }


    if(mouseX>=143) {
      float m=millis();
      pushMatrix();
      translate(320,240);
      rotate(m/2000);
      drawSteak1(0,0,1);
      popMatrix();
    }

    imageMode(CENTER);
    if(mouseX>=143) {
      if (mouseX<=213) {
        int o= mouseX-143;
        float i=map(o,0,70,0,255);
        pushMatrix();
        translate(320,240);
        tint(255,i);
        drawSteak2(0,0,0.7);
        noTint();
        popMatrix();
      }
    }

    if(mouseX>=214) {
      float a=random(0,1);
      float r=mouseX+a;
      pushMatrix();
      translate(320,240);
      rotate(r);
      drawSteak2(0,0,0.7);
      popMatrix();
    }


    if(mouseX>=214) {
      if (mouseX<=284) {
        int a=mouseX-214;
        float s=map(a,0,70,0,.65);
        int o=mouseX-214;
        float i=map(o,0,70,0,255);
        pushMatrix();
        translate(320,240);
        tint(255,i);
        drawSausage1(0,0,s);
        noTint();
        popMatrix();
      }
    }

    if (mouseX>=285) {
      float r=random(-PI,0);
       float m=millis();
      float g=sin(m/1000);
      float s=map(g,0,1,.65,.85);
      pushMatrix();
      translate(320,240);
      rotate(r);
      drawSausage1(0,0,s);
      popMatrix();
    }
    
    if (mouseX>=285){
    if(mouseX<=355){
    int o=mouseX-285;
    float i=map(o,0,70,0,255);
    pushMatrix();
    translate(320,240);
    tint(255,i);
    drawSausage3(0,0,1);
    noTint();
    popMatrix();
    }
    }
    
    if (mouseX>=356){
      float r= random(-1,1);
      float a=mouseX*r;
    pushMatrix();
    translate(320,240);
    rotate(r);
    drawSausage3(0,0,1);
    popMatrix();
    }

    imageMode(CENTER);
    if (mouseX>=356) {
      if (mouseX<=426) {
        int a=mouseX-356;
        float s=map(a,0,70,2,1);
        pushMatrix();
        translate(320,240);
        drawGround4(0,0,s);
        popMatrix();
      }
    }

    if (mouseX>=427) {
      float m=millis();
      pushMatrix();
      translate(320,240);
      rotate(-m/1200);
      drawGround4(0,0,1);
      popMatrix();
    }
    
      if(mouseX<=10) {
    pushMatrix();
    translate(320,240);
    drawCow(0,0,1);
    popMatrix();
  }

  if(mouseX>=11) {
    if (mouseX<=22) {
      int a=mouseX-11;
      float s=map(a,0,11,1,0.59);
      pushMatrix();
      translate(320,240);
      drawCow(0,0,s);
      popMatrix();
    }
  }

  if(mouseX>=23) {
    if(mouseX<=71) {
      int b=mouseX-23;
      float dx=map(b,0,48,280.667,252.5);
      float dy=map(b,0,48,240.667,249.5);
      pushMatrix();
      translate(dx,dy);
      drawCow1(0,0,.59);
      popMatrix();
    }
  }

  if(mouseX>=23) {
    if(mouseX<=71) {
      int b=mouseX-23;
      float dx=map(b,0,48,342.333,325.5);
      float dy=map(b,0,48,217,201);
      pushMatrix();
      translate(dx,dy);
      drawCow2(0,0,.59);
      popMatrix();
    }
  }

  if(mouseX>=23) {
    if(mouseX<=71) {
      int b=mouseX-23;
      float dx=map(b,0,48,375.334,374.5);
      float dy=map(b,0,48,238.667,245);
      pushMatrix();
      translate(dx,dy);
      drawCow3(0,0,.59);
      popMatrix();
    }
  }

  if(mouseX>=72) {
    pushMatrix();
    translate(252.5,249.5);
    drawCow1(0,0,.59);
    popMatrix();
  }

    if (mouseX>=72) {
      pushMatrix();
      translate(325.5,201);
      drawCow2(0,0,.59);
      popMatrix();
    }

    if(mouseX>=72) {
      pushMatrix();
      translate(374.5,245);
      drawCow3(0,0,.59);
      popMatrix();
    }
  }


  // DRAWING FUNCTIONSSSSSSS

  void drawCow(float x,float y,float z) {
    scale(z);
    image(cow,x,y);
  }

  void drawCow1(float x, float y, float z) {
    scale(z);
    image(cow1,x,y);
  }

  void drawCow2(float x, float y, float z) {
    scale(z);
    image(cow2,x,y);
  }

  void drawCow3(float x, float y, float z) {
    scale(z);
    image(cow3,x,y);
  }

  void drawSteak1(float x, float y, float z) {
    scale(z);
    image(steak1,x,y);
  }

  void drawSteak2(float x,float y,float z) {
    scale(z);
    image(steak2,0,0);
  }

  void drawSausage1(float x, float y, float z) {
    scale(z);
    image(sausage1,x,y);
  }
  
  void drawSausage3(float x,float y, float z){
  scale(z);
  image(sausage3,0,0);
  }

  void drawGround3a(float x,float y, float z) {
    scale(z);
    image(ground3a,0,0);
  }

  void drawGround4(float x, float y, float z) {
    scale(z);
    image(ground4,x,y);
  }

  void drawTripe2(float x,float y, float z) {
    scale(z);
    image(tripe2,0,0);
  }


