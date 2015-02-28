
float circleX;
float circleY;
float vel = 0;
float vel2= 5;
float circleX2;
float circleY2;
float vel3=1;
float vel4=1;
float gravity=.95;

void setup() {
  
  size(500, 200);
  smooth();
}



void draw() {
background(255);

  fill(random(0, 255), random(0, 255), random(0, 255));
  //noStroke();


  circleX+=vel2;
  circleY+=vel;
  vel+=gravity;
  
  circleX2+=vel4;
  circleY2+=vel3 ;
 
  
  ellipseMode(RADIUS);
  ellipse(circleX, circleY, random(0, 20), random(0, 20));
   ellipse(circleX2, circleY2, random(0, 20), random(0, 20));
   
   
  if ((circleY<0)||(circleY>height)) {
    vel*=-.95;
   
  }


  if ((circleX<0)||circleX>width) {
    vel2*=-1;
  }
  
  
  if ((circleY2<0)||(circleY2>height)) {
    vel3*=-1;
   
  }


  if ((circleX2<0)||circleX2>width) {
    vel4*=-1;
  }


}

