
class DotMove { 

  float x, y; //calculate wiggling coords
  float targetX; //target that ex and ey are trying to get to
  float targetY;
  int diameter;
  float speed = 1.5;
  float ex, ey; //will keep track of the eased position of the Dot as it tries to go from where it is, to its target
  float ox, oy;
  float easing = 0.04;

  
  int s = second();
  
  
  void drawCrosshair(){
  image(crosshair, ex, ey, 8, 8);


}

  //constructor
  DotMove(float tempX, float tempY, int tempDiameter) { 
    x = tempX;
    y = tempY;
    ex=x;
    ey=y;
    diameter = tempDiameter;
  }

  void move() {
    

    if (s < 30) {
      targetX= width/2+random(-20, 20);
      targetY= height/2+random(-20, 20);

    }
    else 
    {
      targetX = x;
      targetY = y;
    }

    x += random(-speed, speed);
    y += random(-speed, speed);


    ex += (targetX-ex) * easing; //easing
    ey += (targetY-ey) * easing; //easing
  }

  void display() {
    
    //Grab colors from the reference image here.
    //Do anything associated with display here.
    
drawCrosshair();
  if (s < 30) {
      targetX= width/2+random(-20, 20);
      targetY= height/2+random(-20, 20);
      

  
      float xpos = random (width);
      float ypos = random (height);
    
  color temp = logo.get(int(xpos), int(ypos)); //getting color
  
    if(blue(temp) < 200 )
{
    ex = xpos;
    ey = ypos;
}else{
    drawCrosshair();

    }
  }
  }
}

/*  }else{
    
    drawCrosshair();
    
    }
 }

}
*/



