
class Alien {
    int xPos;
    int yPos;
    
    Alien(int x, int y){
      xPos = x;
      yPos = y;
    }
  
    void display() {
   rectMode(CORNER);
   fill(100,75,200);
   rect(0,0,width,height);
   ellipseMode(CENTER);
   rectMode(CENTER);
   stroke(250);
   fill(100,250);
   rect(xPos,yPos,20,100);
   fill(255);
   ellipse(xPos,yPos-30,60,60);
   fill(10);
   ellipse(xPos-20,yPos-30,16,32);
   ellipse(xPos + 20,yPos-30,16,32);
   stroke(250);
   line(xPos-10,yPos+50,xPos - 20,yPos + 60);
   line(xPos+10,yPos+50, xPos + 20,yPos + 60);
   line(xPos-10,yPos,xPos- 20, yPos + 10);
   line(xPos+10,yPos,xPos+20,yPos + 10);
  }
}

