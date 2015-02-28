
String space = ":";
String hourspace = "";
float growatx;
float growaty;
int lastSecond=0;
   
void setup() {
  size (900, 500);
  smooth();
  frameRate(24);
   
  background(57, 41, 9);
}
 
void draw() {
   
  float posxer;   
  float posyer;
  float wider=0;
  float taller=0;
  float shader=0;
  float twister=0;
  float larger=0;
   
  int m =minute();
  int h =hour();
  int s =second();
   
   
   
  if(s==0){
    noStroke();
  fill(57, 41, 9,255);
  rect(0,0,50,13);
  }
   
  if (lastSecond != s){
   
   
  if (m<10) {        //ensures no single digit minutes
    space = " : 0";
  }
  else
  {
  space =" : ";
  }
  
  if (h<10) {        //ensures no single digit hours
    hourspace = "0";
  }
  else
  {
  hourspace ="";
  }
  
  String time = hourspace+h+space+m;
  fill(58, 42, 10);
  text(time, 3, 10);
   
   
 
  for (int x = 0; x < 50; x++)    //x boundary of printed time
  {
    for (int y =0; y< 10; y++)    //y boundary of printed time
    {
      if (get(x, y)!=get(1, 1) && random(5)<3)    //compares color of pixel to background pixel, randomizer, and second pulsator
      {
        growatx=map(x, 0, 50, 30, 880);        //maps growth pixel to main part o screen
        growaty=map(y, 0, 15, 120, 480);
         posxer=growatx;
          posyer=growaty;
          
                     
 
                    if (random(20)<1){                              //background poly
                  for (int j=0; j<s; j++)
                    {
                         
                    Poly[] myPoly2 = new Poly[s];
                      larger = random(0.04, 0.3);
                      shader = random(-30, -150);
                      wider = random(40,80);
                      taller = random(20, 40);
                      twister = random(-5,5);
                       
                      myPoly2[j] = new Poly(random(0,1200), random(30,470), wider, taller, shader, twister, larger);
                      myPoly2[j].display();
                      }
                    }
                       
                     
                     
                 Poly[] myPoly = new Poly[s];                        //actualy digit polypore
                  for (int i=0; i<s/5; i++)
                    {
                      larger = random(0.2, 0.8);
                      shader = random(10,50);
                      wider = random(40);
                      taller = random(20, 40);
                      twister = random(-5,5);
                       
                      myPoly[i] = new Poly(posxer+random(-10,10), posyer+random(-10,10), wider, taller, shader, twister, larger);
                      myPoly[i].display();
                    }
                   
                     
                           
      }
      else
      {
        growatx=0;
        growaty=0;
      }
    }
  
   
  }
 
 
 
  lastSecond=s;
  }
   
fill(57, 41, 9,20);
  noStroke();
  rect(0,15,1200,470);
   
}
 
class Poly {
  float posX;
  float posY;
  float wide;
  float tall;
  float shade;
  float twist;
  float large;
 
 
 
  Poly (float _posX, float _posY, float _wide, float _tall, float _shade, float _twist, float _large) {
    posX=_posX;
    posY=_posY;
    wide=_wide;
    tall=_tall;
    shade=_shade;
    twist=radians(_twist);
    large=_large;
  }
 
  void display() {
    pushMatrix();
    stroke(55+shade, 12+shade, 6+shade, 255+shade);
    strokeWeight(2);
    fill(95+shade, 52+shade, 16+shade, 255+shade/3);
    translate(posX, posY);
    scale(large);
    rotate(twist);
     
    curve(-wide ,-tall*2, 0,0, 0.7*wide, 1.5*tall, 5*wide*random(-1.5,1.5), 3*tall);
     
    ellipse(0, 0, wide, tall);
    stroke(155+shade, 98+shade, 46+shade);
    strokeWeight(4);
    fill(125+shade, 72+shade, 26+shade);
    ellipse(0, 0-tall/4.5, wide/2, tall/2);
    noStroke();
    fill(200+shade, 140+shade, 70+shade);
    ellipse(wide/15, 0-tall/3, wide/5, tall/5);
    popMatrix();
  }
}


