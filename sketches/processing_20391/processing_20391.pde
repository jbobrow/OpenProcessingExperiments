


void setup() {
  size(700,700);
  smooth();
  background(255,204,126);
  frameRate(5);

  color myColor1 = color(16, 72, 0);
  color myColor2 = color(0,206,22);

  backgroundGradient(0,0,800,800,myColor2,myColor1);

  //ArrayList fibnums = new ArrayList(); //not sure this is necessary?
  //fibnums.add(nextFib());
}

  void backgroundGradient(int x, int y, int w, int h, color startColor, color stopColor) {

  for(int myx = x; myx < (x + w); myx++) {
    color resultColor = lerpColor(startColor, stopColor, norm(myx, x, (x+w)));
    stroke(resultColor);
    line(myx, y, myx, (y+h));
  }
  
  }

void draw() {
  noStroke();
  


  for(int x = 0; x < 2000; x+=40) {
    for(int y = 0; y < 2000; y+=40) {


     
      fill(147,211,211); 

      triangle(x,y,x/12,y/12,x/100,y/100);
    }
  }
}



