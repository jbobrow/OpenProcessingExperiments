
OverRect r = new OverRect (10,10,100);
OverRect r2 = new OverRect(50,60,40);

void setup(){
  size(500,500);
}

void draw(){
  background(100);
  r.update(mouseX,mouseY);
  r.display();
  r2.update (mouseX,mouseY);
  r2. display();
}

class OverRect {
  int x,y;
  int rectSize ;
  int grey ;
  
  //constructor
  OverRect(int _x,int _y, int _rectSize){
    x = _x;
    y = _y;
    rectSize = _rectSize;
    grey = 0;
    
  }
  void update (int mx, int my){
    if((mx > x) && (mx < x + rectSize) && (my > y + rectSize)){
      grey = 255;
    }else{
      grey = 0;
    }
    x++;
    y++;
  }
  
  void display (){
    fill(grey);
    rect(x,y,rectSize,rectSize);
  }
}


                
                
