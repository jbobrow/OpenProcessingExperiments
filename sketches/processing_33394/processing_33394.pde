
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
  
  size(500, 500);
  smooth();
  //frameRate(100);

}

void draw(){


  
for (int i = 0; i < 500; i = i+1) {
    for (int j = 0; j < 500; j = j+1) {
     line(0,i,i,0);
    //ellipse(i*150,j*150,i*5,i*5);
  //  strokeWeight(i*1.3);
   stroke(5,i*17,random(50,150));
    //fill(i*25,random(50,150),5);
    }
  }


  fill(random(0, 255), random(0, 255), random(0, 255));
  noStroke();


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

