
int a = 100;
int b = 100;
int c = 100;
int d = 100;

void setup(){
  size(200,200);

  }
  
  void draw(){
      background(255);
      stroke(0);
      line(100,0,100,200);
      line(0,100,200,100);
      if((mouseX<100)&&(mouseY<100)){
        fill(0);
        rect(0,0,100,100);
      }else if ((mouseX>100)&&(mouseY<100)){
        rect(100,0,100,100);
      }else if ((mouseX<100)&&(mouseY>100)){
        rect(0,100,100,100);
      }else if ((mouseX>100)&&(mouseY>100)){
        rect(100,100,100,100);

      }
      
    
      
  }

