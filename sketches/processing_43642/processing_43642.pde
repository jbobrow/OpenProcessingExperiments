
//Bryn Fraker Midterm

//Spiral

float x,y,angle;
float a,b;
float px,py;
float pa,pb;

void setup(){
  size(900,900);
  smooth();
  //colorMode(HSB, 360,100,100);
  //background(360,0,100);
  background(0);
  x = 0;
  y = 0;
  a = 0;
  b = 0;
  angle = 0;
  frameRate(1000);
  px = x;
  py = y;
  pa = a;
  py = b;
}

void draw(){
  for(int i=0; i < 1000; i+=100000){
  //x = cos(radians(angle)) * px * 20 + width/2;
  //y = sin(radians(angle)) * py * cos(radians(angle)) * x/2 + height/2;
 // a = sin(radians(angle)) * pa /sin(radians(angle)) + width/2;
  //b = cos(radians(angle)) * pb + height/2;
  x = cos(radians(angle)) * px * 20 + width/2;
  y = sin(radians(angle)) * py * cos(radians(angle)) * x/2 + height/2;
  a = sin(radians(angle)) * pa /sin(radians(angle)) *5 + width/2;
  b = cos(radians(angle)) * pb + cos(radians(angle)) +height/2;
  //fill(360,100,0);
  //ellipse(x,y,3,3);
  //ellipse(a,b,3,3);
  strokeWeight(.25);
  //stroke(random(360),75,50,50);
  stroke(255,255,255,50);
  line(x,y,a,b);
  
  //if(x == width/2){
    //rotate(radians(20));
  //}
  }

  px +=.01;
  py +=.01;
  pa +=.01;
  pb +=.01;
  angle ++;
}


