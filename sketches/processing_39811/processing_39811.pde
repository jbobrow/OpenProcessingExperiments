
int num = 20; // 20 lines

// make the arrays
float[] x = new float[num]; // variable x
color[] g = new color[num]; // grayscale
float[] speed = new float[num]; // speed



void setup() {
  size(300, 300);
  background(100);
  
  // seat the array
  for (int i=0; i < num;i++) {
    x[i] = i;
    g[i] = color(random(1,255));    
    speed[i] = random(0.5, 4);
   
  }
}

void draw() {
  background(50);
  
  for (int i=0; i < num; i++) {
    stroke(g[i]);
    line(x[i],0,x[i],height);
    line(width,x[i],0,x[i]);
    
    

    //loops lines
    x[i] = x[i] + speed[i]*.75;
    if (x[i] > width + 10) {
      background(random(1,1.001));
      x[i] = -10;
     
      
    }
    
  }
  
}








