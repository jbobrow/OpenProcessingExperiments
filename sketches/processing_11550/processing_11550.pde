

int counter = 0;  

int repeat = 4;  

int x =100;  

int y = 200;  

int rectWidth = 3;  

int rectHeight = 200;  

void setup(){  

 size(600, 600);  

background(0, 0, 90);   

frameRate(300);  

}  

   

void draw(){  


  int multNumber = modulo(counter, repeat);  

  moveRect(multNumber);  

    

  rect(x, y, rectWidth, rectHeight);  

  

    if (x > width){  

    resetValues();  

  }  

  increaseCounter();  

}  

int modulo(int ctr, int _repeat){  

 int m = ctr % _repeat;  

 return m;   

}  

void moveRect(int multNumber){  

     

  y = rectHeight * multNumber;  

  x += rectWidth;   

}  

   

void increaseCounter(){     

  counter ++;   

}  


void resetValues(){  

   background(0, 0, 90);  

   x = mouseY;  

   y = mouseX;   
}

