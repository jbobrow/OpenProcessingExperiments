
ArrayList<Circle> circles = new ArrayList(); 
int index = 0;
int thaMouse;

void setup(){
  size(500,500);
    background(0);
}
void draw(){
  for(int i = 0; i<10; i++){
    pushMatrix();
    for(int j = 0; j < 10; j++){
      figure();
      translate(200,0);
      figure();
    }
    popMatrix();
    translate(0,200);
  }
}
 void figure(){

 if(mousePressed == true){
 //translate(0,50);
 Circle r = new Circle();
 circles.add(r);
 
  }
 mouseReleased();
 }
 
 
 void mouseReleased(){
  thaMouse = mouseX;
 //translate(50,0);
  }

 
public class Circle{
  int r = (int)random((thaMouse));
  //int r = 40;
  //int g = (int)random((thaMouse));
  //int r = (int)(noise(thaMouse)*200;
  int g = (int)(noise(thaMouse)*200);
  int b = (int)(noise(thaMouse)*255);
  //int b = (int)random((thaMouse));
  //int b = (int)(noise(thaMouse)*200);
  int x = (int)random(50);
  int y = (int)random(50);
  float yold;
  //int d = 50;
  int d =(int)random(50);
  int t = 1;
 public Circle(){
   stroke(255);
    fill((r),(g),b);
    ellipse(x,y,d,d);
    yold = y;
  }
}
