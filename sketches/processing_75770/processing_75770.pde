
int lastSecond; 

void setup() {
  size (300, 300);
  smooth();
}


void draw() {

  background(0);

  int s = second();   
  int m = minute();       
  int h = hour();

  float ml = map(m, 0, 59, 0, 200);




  if (s != lastSecond)
  {
    textAlign(CENTER);
    text("LOADING ", width/2, height/2-25);

    lastSecond = s+1;
  }

  rect(50, height/2, ml, 15);


  fill(255);
  textAlign(CENTER);
  text("Estimated time remaining: "+ h + " hours", width/2, height/2+35);
}
