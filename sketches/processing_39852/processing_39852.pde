
int num = 100;

float[] x = new float[num]; // x-coordinate
float[] y = new float[num]; // y-coordinate
float[] speed = new float[num];//speed

void setup() {
  size(300, 300);
  
  for (int i=0; i < num;i++) {
    x[i] = i;
    speed[i] = random (.5,4);//sets the lines at different speeds
  }
}

void draw() {
  background(0,114,232);
  stroke(255);
  strokeWeight(100);
  point(height/2,width/2);
  stroke(0);
  strokeWeight(20);
  point(height/2,width/2);
  
  for(int i=0; i<num; i++) {
    strokeWeight(2);
    stroke(random(160),random(142),random(69),100);
   //line(x[i],x[i],width,x[i]);
   line(0,x[i],x[i],height);
   line(x[i],0,width,x[i]);
   
    
    
    
    x[i] = x[i] + speed[i];
    if (x[i] > width) {
      x[i] = 0;
  }
}
}

