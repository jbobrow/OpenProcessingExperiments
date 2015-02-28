
import processing.opengl.*;


float[] XPosition=new float[7000];
float[] YPosition=new float[7000];


void setup() {
  size(500, 500, OPENGL);
  background(100,0);
  

  rotate(PI/3.0);

}


void draw() {
  background(0);
  stroke(255);
  
  smooth();
  border();
  
noStroke();

  fill(224, 255, 255);
  

 int i = 0;
  while (i<XPosition.length) {
    ellipse(XPosition[i], YPosition[i],1, 1);

 XPosition[i] = XPosition[i] + ((mouseX-XPosition[i])/30.0);
  YPosition[i] = YPosition[i] + ((mouseY-YPosition[i])/30.0);

    if (dist( XPosition[i], YPosition[i], mouseX, mouseY) < 400) {

      float t = atan2(mouseY-YPosition[i], mouseX - XPosition[i]);     

rotate(PI/1);
ellipse(XPosition[i], YPosition[i],2,2);




     if(mousePressed == true && mouseButton == RIGHT){
       
       XPosition[i] = XPosition[i]-cos(t)*5;
      YPosition[i] = YPosition[i]-sin(t)*5;
     }



      if (mousePressed==true && mouseButton == LEFT) {



    ellipse(XPosition[i], YPosition[i],1,1);

  
        XPosition[i] = XPosition[i]+cos(t)*1;
      YPosition[i] = YPosition[i]+sin(t)*1;
         
         XPosition[i] = XPosition[i]+(random(-10, 10));
    YPosition[i] = YPosition[i]+(random(-10, 10));


        XPosition[i] = XPosition[i]+1;

        if (XPosition[i]>500) {
          XPosition[i]=0;
        }
      }
    }

    if (XPosition[i]>480) {
      XPosition[i]=480;
    }
    if (XPosition[i]<20) {
      XPosition[i]=20;
    }
    if (YPosition[i]>480) {
      YPosition[i]=480;
    }
    if (YPosition[i]<20) {
      YPosition[i]=20;
    }



    i = i+ 1;
  }
}


void border(){
  strokeWeight(1);
  noFill();
  stroke(245,245,245);
  smooth();
  quad (10, 10, 10, height-10, width-10, height-10, width-10, 10);

}

  

