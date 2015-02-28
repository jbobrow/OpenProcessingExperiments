
PFont f;
  
void setup()
{
  size(700,100);
  f = loadFont("HelveticaCY-Bold-48.vlw");
}

void draw() {
  
  background(#2A6C22);
  noStroke(); 
  int s = second(); 
  int m = minute();  
  int h = hour();   

  fill(#F0E61D);
  rect(0, 10, h*10, 20);
  fill(#F0E61D);
  rect(0, 40, m*10, 20);
  fill(#F0E61D);
  rect(0,70, s*10, 20);
 
  textFont(f,16);                 
  fill(255);  
  text(h,width-30,26);
  text(m,width-30,56);
  text(s,width-30,85); 
  
}

