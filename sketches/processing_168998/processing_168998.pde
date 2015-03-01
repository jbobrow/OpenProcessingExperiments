
Circle circles[] = new Circle[1];
int counter = 0;
 
void setup(){
  size(500, 500);
  background(255);
  for (int k = 0; k < circles.length; k++){
      circles[k]= new Circle(int(random(width)), int(random(height)));
  }
}
void draw(){
  for (int k = 0; k < circles.length; k++) {
        circles[k].grow();
        circles[k].display();
    }
  counter = counter + 1;

}

void mousePressed(){
  background(random(255),random(255),random(255));
}
    
    
   class Circle{
int x;
int y;
int r = 0;
color c = color(random(0,255),random(0,255),random(0,255));
 
Circle(int tempx, int tempy){
  x = tempx;
  y = tempy;
}
  
 void display(){
  fill(c);
  noStroke();
  ellipse(x,y, r*2,r*2);
}
 
void grow(){
  r = r + 1;
  if (r > 80){
    r=0;
    x= int(random(width));
    y=int(random(height));
  c = color(random(0,255),random(0,255),random(0,255));
}
 }

} 
