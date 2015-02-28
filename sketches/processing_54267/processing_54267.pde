
void setup()
{
  size(800,200);
  colorMode(HSB,360,100,100);
  smooth();
}

void draw()
{
  background(360);
  
  cup(200,50,100,15,PI/20,color(20,80,100),2);
  cup(100,30,50,10,PI/30,color(120,80,90),1);
  cup(50,100,200,50,PI/25,color(90,70,100),1.5);
  cup(300,50,150,30,PI,color(100,40,90),0.5);
  cup(400,150,80,2,PI/15,color(300,40,90),2);
  cup(500,50,100,8,PI/10,color(150,40,90),1);
  cup(580,150,80,10,PI/15,color(270,40,90),3);
  cup(600,30,180,12,PI/14,color(330,40,90),4);
  cup(700,20,150,2,PI/9,color(20,40,90),1.8);
  cup(750,100,40,10,PI/18,color(60,40,90),2);
}

void cup (float x,float y,float w,float scaleVal,float angleInc, color c,float sw)
{
  pushMatrix();
 noFill();
  stroke(c);
  strokeWeight(sw);
  translate(x,y);
  float angle = 0;

  //body
  arc(0,0,w,w,radians(-20),radians(200));
  //handle
  arc(w/2,0,(w*0.3),(w*0.3),radians(-90),radians(90));
  arc(w/2,0,w/5,w/5,radians(-90),radians(90));
  //liquid
  for(float i = -(w/2); i<= w/2; i+=1){
    float j = sin(angle)*scaleVal;
    ellipse(i,j,0.5,0.5);
    angle += angleInc;
   }
  popMatrix();
}

  

