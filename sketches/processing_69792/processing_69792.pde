
PImage character, ghostkitten;
float [] x = new float [10000];
float [] y = new float [10000];
 
void setup () {
   
  size (500,500);
  smooth();
  noStroke();
  ghostkitten = loadImage("ghostkitten.png");
   
  for (int i = 0; i<10000; i++) {
    x[i] = 0;
    y[i] = 0;
     
  }
   
}
 
void draw () {
   
  background (0,16,66);
   
  for (int i=0; i<99; i++) {
    x[i] = x [i+1];
    y[i] = y [i+1];
     
    image(ghostkitten,mouseX-50,mouseY-50,100,100);
    //fill (random(100),random(50),random(100),200*2); //colour i is the circles devided by two makes it lighter
    fill (139,183,182,20*2); 
    ellipse (x[i], y[i], i, i);
    fill (252,241,242,20*2); 
    ellipse (x[i], y[i], i-50, i-50);
    
     
  }
   
  x[99] = mouseX;
  y[99] = mouseY;
   
}


