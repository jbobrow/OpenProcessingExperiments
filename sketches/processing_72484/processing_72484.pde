
class Eyes {
  //variables
  float x, y, xs, ys;
  color c;
  float d;
  float f;

  //constructor

  Eyes(float xPos, float yPos, float xSize, float ySize, color eyeColor, float eyesDistant, float blink) {

    x = xPos;
    y= yPos;
    xs = xSize;
    ys = ySize;
    c = eyeColor;
    d = eyesDistant;
    f = blink;
  }  

  //methods


  void display() {
    
    if (frameCount%f<8){
     ellipse(x-d/2,y,xs,ys/10); 
     ellipse(x+d/2,y,xs,ys/10);  
     fill(70,55,16);
    rect(x-d/2,y-d/3,50,15);
    
    fill(70,55,16);
    rect(x+d/2,y-d/3,50,15);  
    } else {
      
      
    
    
    //LEFT EYES
    //white
    fill(255);
    ellipse(x-d/2, y, xs, ys);
    //iris  
    fill(c);
    ellipse(x-d/2, y, 15, 15);  
    //pupil
    fill(0);
    ellipse(x-d/2, y, 5, 5);
    //reference
    fill(0,255,0);
    rect(x,y,5,5);
    
      //LEFT EYES
    //white
    fill(255);
    ellipse(x+d/2, y, xs, ys);
    //iris  
    fill(c);
    ellipse(x+d/2, y, 15, 15);  
    //pupil
    fill(0);
    ellipse(x+d/2, y, 5, 5);
    //reference
    fill(0,255,0);
    rect(x,y,5,5);
    fill(70,55,16);
    rect(x-d/2,y-d/2,50,15);
    
    fill(70,55,16);
    rect(x+d/2,y-d/2,50,15);
  }
 
   
  
  }
  
}

