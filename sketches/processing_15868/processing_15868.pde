
Button[] button = new Button[10];

void setup(){
  size(1000,311);
  smooth();
  
  for (int i = 0; i < button.length; i++){
    button[i] = new Button(i*100+25,height/2-25,50,50,random(5),random(4));
    
  }
}

void draw(){
  background(255);
  for(int i = 0; i < button.length; i++){
    button[i].display();
    button[i].move();
  }
}
    void mousePressed(){
    for (int i = 0; i < button.length; i++){
      button[i].click(mouseX,mouseY);
      
    }
  }



class Button {
  float x;
  float y;
  float w;
  float h;
  float xSpeed;
  float ySpeed;
  boolean on;
  
  Button(float tempX, float tempY, float tempW, float tempH,float tempxSpeed, float tempySpeed) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    xSpeed = tempxSpeed;
    ySpeed = tempySpeed;
    on = false;
  }
  
  void click(int mx, int my){
    if(mx > x && mx < x + w && my > y && my < y + h){
      on = !on;
    }
  }
  void display(){
    
    if(on){
    fill(0);
    rect(x,y,w,h);
    }else{
    fill(200);
    rect(x,y,w,h);
  }
}

void move(){
  x = x + xSpeed;
  if((x > width) || (x < 0))
  xSpeed = xSpeed *-1;
  y = y + ySpeed;
  if((y > height)|| (y < 0))
  ySpeed = ySpeed *-1;
}
}


