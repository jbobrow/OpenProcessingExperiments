
class Node{
  float x,y;
  float dis;
  float angle;
  float dx,dy;
  float sl;
  boolean select=false;
  Node(float xpos, float ypos, float distance){
    x=xpos;
    y=ypos;
    dis=distance;
  }
  void checkdist(Node a){
    float d=dist(x,y,a.x,a.y);
    if (d<dis){
      stroke(255,150);
      line(x,y,a.x,a.y);
    }
  }
  void move(){
    if(select==false){
      dx = mouseX - x;
      dy = mouseY - y;
      angle = atan2(dy, dx);  
      //      x += cos(angle) * sl + random(-5,5)*(frameCount%5);
      //      y += sin(angle) * sl + random(-5,5)*(frameCount%5);
      sl=random(5);
      x += cos(angle) * sl+random(-9,9);
      y += sin(angle) * sl+random(-9,9);
    }
    else{
      x = mouseX;
      y = mouseY;
    }
  }
  void mouseSelect(){
    if(dist(mouseX,mouseY,x,y)<15 & select==false){
      select=true;
    }
    else{
      select=false;
    }
  }
  void display(){
    if(select==true){
      fill(255,100,0);
    }
    else{
      fill(0);
    }
    stroke(0,255,255,50);
    ellipse(x, y, 20, 20);
  }

}          












