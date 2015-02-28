
void setup () {
 size (750,750);
 colorMode(HSB,360,100,100);

 
 }
 
 void draw () {
    background(#ffffff);
    float counter = 5;
    
    noFill();
strokeWeight(8);
rect (200,400,240,150);

float sec = map(second(),0,60,0,240);
float msec = map(millis(),0,60,0,360);
float min = map(minute(),0,60,0,240);
float std = map(hour(),0,12,0,240);
    
   
  float a = hour();
  if (a >= 7 && a <= 8) {
    fill (#eead47);
    rect (500,200,150,200);
  }
  else if (a >= 9 && a <= 10) {
    fill (#47b9ee);
    rect (500,200,150,200);
  }
  else if (a >= 11 && a <= 12) {
    fill (#478eee);
    rect (500,200,150,200);
  }

  else if (a >= 13 && a <= 14) {
    fill (#f0f81f);
    rect (500,200,150,200);
  }

  else if (a >= 15 && a <= 17) {
    fill (#dbbc2d);
    rect (500,200,150,200);
  }

  else if (a >= 18 && a <= 19) {
    fill (#dbbc2d);
    rect (500,200,150,200);
  }

  else {
    fill (#000000);
    rect (500,200,150,200);
    
  }
  

 
 stroke(2);
rect (100,100,1,550);   
line (0,0,100,100);
line (0,750,100,650);
line (200000,750,100,650);
line (100,100,750,100);

strokeWeight(2);

noFill();
ellipse (200,200,90,90);

for (int z=0; z<msec; z+=msec) {
pushMatrix();
translate (200,200);
rotate(radians(msec));

fill(#000000);
ellipse(0, 20, 30, 50);
popMatrix();


fill(#E5E5E5);
rect (202, 500,sec,3);

fill(#84FF03);
rect (202,450,min,5);

fill (#FF7E7E);
rect (202,475,std,6);


}
}






