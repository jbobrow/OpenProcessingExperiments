
//I know I got some of this code from somewhere on open processing, but now can't find the original

float n = 12.25; // n = 2 , 3, 4, 5, 1/2, e, PI, sqrt(2) etc
float n1 = 13;
float nSpeed = .000250;
float a = 399f;
float k = 10f;
float r1,r2,r3,r4,r5;
int red;
boolean nGo;

void setup() {
  size(800,800);
  background(255);
  smooth();
  r1=0;
  r2=50;
  r3=100;
  r4=150;
 //noLoop();
  colorMode(HSB, 360, 100, 100);

}
 
void draw() {  
  background(0);
  nSpeed = map(mouseX,0,width,.000050,.000625);
  strokeWeight(1);
    if(nGo){
    //to stop at intervals...  
    if(n > n1){
      nGo = false;
      n1++;
    }
    else {
      n += nSpeed;
    }
  }
  for(float t = -8*PI; t <= 8*PI; t += 0.02) {
 //   float r = k*sqrt(a * sin(n * t));
     float r = a * sin(n * t);
//      float r = a * cos(n * t);
 
    // Polar to Cartesian conversion
    float x = r * cos(t) + width/2;
    float y = r * sin(t) + height/2;

     if (x > (width/8 * 3) || x < (width/8 *5) ){
       red = 255;
     }
     else {
        red = 0;
     }
    r = map(r,0,500,0,200);
   // r1 = map(x,0,width,0,360);

    r2 = map(y,0,height,0,360);
    r3 = map(mouseY,0,height,100,149);
    r4 = map(mouseY,0,height,150,200);
    r5 = map(mouseX,0,width,6,8);

    strokeWeight(r5 - r5/1.325);
   // fill(r, random(r1,r2), random(r3,r4),225);
 // this makes rainbows
 //r1 = dist(x,y,width/2,height/2);
 // fill(r1,360,100,225);

fill(190,20,220,225);
 //  println(r);
//point(x, y)
   // rect(x, y, 3, 3);
    ellipse(x, y, r5, r5);
  }
//  n = map(mouseX,0,width,1,10);

}

void mouseClicked(){
  //n++;
  nGo = !nGo;
}



