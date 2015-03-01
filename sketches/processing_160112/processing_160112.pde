
void setup (){
  size (500,500);
  background(255);
}  
  
void draw (){
float x1= random (width);
float x2= random (width);

strokeWeight (10);
stroke(20,300,45,40);
line (x1, 0, x2, height);
}
