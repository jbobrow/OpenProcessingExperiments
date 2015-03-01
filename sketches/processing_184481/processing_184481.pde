
//Design three static or animated objects that each move in relation to the mouse in a different way.
Disc myDisc1;
Disc myDisc2;
PImage djhand;
void setup(){
  size(700,400);
   
  myDisc1 = new Disc(200,200);
  myDisc2 = new Disc(500,200);
  djhand = loadImage("http://i.imgur.com/6fhnHhu.png");

}

void draw(){
  background((mouseX/2),(mouseY/2),50,100);
  
  pushMatrix();
  translate(100,100);
  
  fill(150);
  rect(100,100,300,300);
  rect(400,100,300,300);
  
  popMatrix();
  pushMatrix();
    fill(255);
    ellipse(70,300,20,20);
    ellipse(100,320,40,40);
    ellipse(370,300,20,20);
    ellipse(400,320,40,40);
  popMatrix();
  
  
  myDisc1.display();
  myDisc2.display();
  if(mouseX < (width/2)){
  myDisc1.spin();
  }
  else if(mouseX>(width/2)){
  myDisc2.spin();
  }
  
  image(djhand, mouseX-160, mouseY-100,djhand.width/2, djhand.height/2);

}

class Disc {
  color c;
  float rpos;
  float xpos;
  float ypos;
 
  float xspeed;
  Disc(float tempXpos, float tempYpos){
    xpos = tempXpos;
    ypos = tempYpos;
    rpos = 0;
    xspeed = 2;
  }
  void display(){
  pushMatrix();
    translate(xpos,ypos);
    rotate(rpos);
    ellipseMode(CENTER);
    rectMode(CENTER);
      pushMatrix();
       fill(0);
        ellipse(0,0,250,250);
      popMatrix();
    fill(255);
    ellipse(0,0,70,70);
     ellipse(70,0,30,30);
      ellipse(-70,0,30,30);
    rect(0,0,10,10);
   
  popMatrix();
}

void spin()
{
    if(mouseX-xpos == 0)
    {
      rpos = (3.14/2);
      if(mouseY >ypos)
      {
        rpos = (-3.14/2);
      }
    }  
  else
  {      
    rpos = atan(((mouseY-ypos) / (mouseX-xpos)));
  }
  }

}


