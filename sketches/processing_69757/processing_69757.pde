
//Thanks to Abe Pazos for making his awesome tutorials 

float x = 0;
float a = 0;

void setup(){
  size(500,500);
  background (0);
  noStroke();
  colorMode(HSB, 100);
}

void draw(){
  //movement of ellipses
  float x = map(sin(a)*sin(a*0.4), -1, 1, 0, width);
  float y = map(sin(a*1.1+1.5)*sin(a*2.1), -1,1,0, height);
  //change colors based on sine wave
  float clr = map(sin(a*0.13), -1,1,0,100);
  //size of circle
  float sze = map(sin(a*1.0)*sin(a*2.3), -1,1,5,30);
  //fade in and out
  float bright = map(sin(a*1.3)*sin(a+2.1),-1,1,10,65);
  
  fill(clr, 50, bright);
  ellipse(x,y,sze,sze);
 
  
  a = a + 0.03;
}

