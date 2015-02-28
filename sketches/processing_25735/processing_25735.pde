
class Berry {
  float r;   // radius
  color col; // color
  float x,y; // location
 
  
  Berry(float tempR) {
    r = tempR;
    col = color(50,100,110,150);
    x = 100;
    y = 100;
  }
  
  void setLocation(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  void display() {
    stroke(0);
    fill(col);
    ellipse(mouseX, mouseY,110,110);// head
 fill(110,150,40);
   ellipse(mouseX,mouseY-30,25,32);//EYES
 fill(110,150,40);
   ellipse(mouseX,mouseY-30,25,32);//EYES
   
     fill(mouseX,200,mouseY);
   
   ellipse(mouseX,mouseY-10,5,5);//bubble
ellipse( mouseX+19,mouseY-50,5,5);//bubble
ellipse(mouseX-30,mouseY-5,10,10);//bubble
ellipse(mouseX-40,mouseY-20,10,10);//bubble
ellipse(mouseX+30,mouseY-5,10,10);//bubble
ellipse(mouseX+40,mouseY-20,10,10);//bubble

ellipse(mouseX+19,mouseY-30,15,22);//inside right
ellipse(mouseX,mouseY-30,15,22);//insideleft
fill(30,79,160);
ellipse(mouseX+19,mouseY-30,5,12);//insidesinsideright
ellipse(mouseX,mouseY-30,5,12);//insideinsideleft
fill(0);
ellipse(mouseX+1,mouseY+10,15,22);//innermouth
fill(67,99,104);
ellipse(mouseX+1,mouseY+10,5,12);//innermouth

  }
  
  
  boolean intersect(Drop d) {
    // distance
    float distance = dist(x,y,d.x,d.y); 
    
   
    if (distance < r + d.r) { 
      return true;
    } else {
      return false;
    }
  }
}

