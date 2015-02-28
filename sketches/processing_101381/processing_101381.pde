
CurveClass c;

float w, h;
void setup() {
  size(600,600);
  background(255);
  frameRate(10);
  c=new CurveClass(width/2, height/2,200,200);
}

void draw() {
  //background(255);
  fill(255, 5);
  rectMode(LEFT);
  rect(0,0, width, height);
  strokeWeight(3);
  stroke(220,100,200);
  if(mousePressed) { 
    c=new CurveClass(mouseX, mouseY, w, h);
  }
  c.drawRec();
}

void mouseReleased(){
  w=mouseX;
  h=mouseY;
  draw();
}

class CurveClass {
  float xpos, ypos, w, h;
  float curvy=0;
  float endcurve=0;
  float cir;

  CurveClass(float x1, float y1, float x2, float y2) {
    this.xpos=x1;
    this.ypos=y1;
    this.w=x2;
    this.h=y2;
  }

  void drawRec() {
    rectMode(CENTER);
    noFill();
    rect(xpos, ypos, w, h);
    //strokeWeight(0.1);
    stroke(255-curvy,100,150+curvy,150-curvy);
    curvey0(xpos-w/2,ypos-h/2,xpos+w/2,ypos-h/2);
    curvey1(xpos+w/2,ypos-h/2,xpos+w/2,ypos+h/2);
    curvey3(xpos-w/2,ypos+h/2,xpos-w/2,ypos-h/2);
    curvey2(xpos+w/2,ypos+h/2,xpos-w/2,ypos+h/2);
  }

  void curvey0(float verX1,float verY1,float verX2,float verY2) {
    beginShape();
    vertex(verX1,verY1);
    bezierVertex(verX2,verY2,verX2-curvy-endcurve,verY2+curvy+endcurve,verX2-endcurve-curvy,verY2+curvy+endcurve);
    endShape();
    if(curvy<100) {
      curvy+=1;
      endcurve+=1;
    }
  }

  void curvey1(float verX1,float verY1,float verX2,float verY2) {
    beginShape();
    vertex(verX1,verY1);
    bezierVertex(verX2,verY2,verX2-curvy-endcurve,verY2-curvy-endcurve,verX2-curvy-endcurve,verY2-endcurve-curvy);
    endShape();
    if(curvy<100) {
      curvy+=1;
      endcurve+=1;
    }
  } 


  void curvey2(float verX1,float verY1,float verX2,float verY2) {
    beginShape();
    vertex(verX1,verY1);
    bezierVertex(verX2,verY2,verX2+curvy+endcurve,verY2-curvy-endcurve,verX2+endcurve+curvy,verY2-curvy-endcurve);
    endShape();
    if(curvy<100) {
      curvy+=1;
      endcurve+=1;
    }
  } 

  void curvey3(float verX1,float verY1,float verX2,float verY2) {
    beginShape();
    vertex(verX1,verY1);
    bezierVertex(verX2,verY2,verX2+curvy+endcurve,verY2+curvy+endcurve,verX2+curvy+endcurve,verY2+endcurve+curvy);
    endShape();
    if(curvy<100) {

      curvy+=1;
      endcurve+=1;
    }
    else {
      ellipse(xpos,ypos,cir,cir);
      if (cir<(3*w/2)) {
        cir+=10;
      }
    }
  }
}
