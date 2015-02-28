
BounceBall Ashley;
void setup() {
  size(300,300);
  Ashley=new BounceBall();
}
void draw() {
  Ashley.update();
}
class BounceBall {
  int num_squares= 10;
  int[] x_values= new int[num_squares];
  int[] y_values= new int[num_squares];
 
  int rotation=0;
  
   BounceBall() {
    fill(random(0,255), random(0,255), random(0,255));
    for(int i=0; i<x_values.length; i++){
    x_values[i]=int(random(width));
    y_values[i]=int(random(height));
}
   }
  void update() {
   background(255);
   for(int i=0; i<x_values.length; i++){
  translate(width/2, height/2);
  rotate(radians(rotation));
  noStroke();
  rect(x_values[i], y_values[i],40,40);
  rotation++;
}
  }
}




