
int[] x = new int[15];
int[] y = new int[15];

void setup() {
  size(800, 600);
  background(255);
  for (int i = 0; i < x. length; i ++) {
    x[i] = 0;
    y[i] = 0;
  }
}
void draw() {
  println(frameRate);
  if (mousePressed){
      background(random(255), random(255), random(255));
  }
  for (int i = 0; i < x. length-1; i ++) {
    x[i] = x[i+1];
    y[i] = y[i+1];
  }
  x[x.length-1] = mouseX;
  y[y.length-1] = mouseY;
 if (mousePressed) { 
  for (int i = 0; i < x. length; i ++) {
   
    
        ellipse(x[i], y[i], 300, 250);
        ellipse(x[i]+100, y[i]-30, 20, 20);
        ellipse(x[i]-100, y[i]-30, 20, 20);


        strokeWeight(random(30));
        line(x[i], y[i], mouseX, mouseY);
      
    }
  }
}

