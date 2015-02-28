
int lineLength=45;
float[] x = new float[4000];
float[] y = new float[4000];

void setup(){

size(700,400);
background(255);
smooth();
stroke(0,100);
}
void draw(){
  
for(int i=0; i<4000; i++){
   x[i] = random(0,700);
  y[i] = random (0,400);
line(x[i],y[i],x[i]+lineLength,y[i]+lineLength);
rotate(radians(5));
   x[i] = dist(x[i],y[i],mouseX, mouseX);
}
}





