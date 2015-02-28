
class Cell  {   
  float x,y;  
  float w,h;  
  int state;  

  Cell(float tempX, float tempY, float tempW, float tempH)  {   
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    state = int(random(4)); 
  }   

  void click(int mx, int my)  {   
    if (mx > x && mx < x + w && my > y && my < y + h) {
      state = (state + 4) % 7; 
    }
    
  }   

  void display()  {   

    noStroke();
    fill(255);
    rect(x,y,w,h);
    
    int b = 8;
    
    if (state == 0) {
    } else if (state == 1) {
   image(image1,x,y);
      
    } else if (state == 2) {
      image(image2,x,y);
      
    } else if (state == 3) {
      image(image3,x,y);
 
   } else if (state == 4) {
     image(image4,x,y);
   } 
  }
}

