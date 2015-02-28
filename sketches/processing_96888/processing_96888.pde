
class circle{
  int x;
  int y;
  
  circle(int tempX, int tempY){
    x = tempX;
    y = tempY;
  }
  
  void display(){
    ellipse(x,y,20,20);
  }  
}

void mouseReleased(){
  canDoThing = true;
}

//globals (probably)
int radius;
boolean canDoThing;
circle tempCircle;
ArrayList circles;

//setup
void setup(){
  size(500,500);
  canDoThing = true;
  circles = new ArrayList();
}

void draw(){
  if (mousePressed == true && canDoThing == true){
    tempCircle = new circle(mouseX, mouseY);
    circles.add(tempCircle);
    canDoThing = false;
  }
  
  if (circles.size()>0){
  int i = 0;
  while (i < circles.size()){
    circle temp = (circle) circles.get(i);
    temp.display();
    i++;
    }
  }    
}



