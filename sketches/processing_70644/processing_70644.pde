
UhGuy steve = new UhGuy(275,200);
UhGuy adam = new UhGuy(100,260);
UhGuy bill = new UhGuy(450,260);

void setup() {
  size(550,400);
}
void draw() {
   background(128);
   steve.update();
   adam.update();
   bill.update();
}

class UhGuy {
  float drawX;
  float drawY;
  int bodyWidth;
  
  float centerX = 275;
  float centerY = 200;
    
  UhGuy(int cX,int cY){
    this.centerX = cX;
    this.centerY = cY;
  }
  
  void update(){
    drawX = centerX;
    drawY = centerY+130;
    bodyWidth = 200;
  
    //Body
    noStroke();
    fill(0);
    for(int i=0; i<13; i++){
      drawX += (mouseX-drawX)/80;
      drawY -= 10-(mouseY-drawY)/80;;
      bodyWidth -= 10;
      ellipse(drawX,drawY,bodyWidth,bodyWidth);
    }
    
    //Mask2
    fill(255);
    drawY += 30;
    ellipse(drawX,drawY,75,100);
    
    //Eyes + Mouth
    fill(0);
    ellipse(drawX-20,drawY-15,15,10);
    ellipse(drawX+20,drawY-15,15,10);
    ellipse(drawX,drawY+30,25,6);
    
    //Makeup?
    fill(170);
    triangle(drawX-25,drawY-5,drawX-15,drawY-5,drawX-20,drawY+15); // left bottom
    triangle(drawX+15,drawY-5,drawX+25,drawY-5,drawX+20,drawY+15); // right bottom
    triangle(drawX-25,drawY-25,drawX-15,drawY-25,drawX-20,drawY-35); // left top
    triangle(drawX+15,drawY-25,drawX+25,drawY-25,drawX+20,drawY-35); // right top
  }
}
