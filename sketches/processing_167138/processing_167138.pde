
//Code by Kim Kohler with help from Antony Marefat and inpiration code by Yen-Chia Hsu


Ball[] ballList = new Ball[100];

void setup(){
smooth();
size(600,600);
for(int i=0; i < ballList.length; i++){
  ballList[i] = new Ball();
 
}
  

}

void draw(){
  background(0);

for(int i=0; i < ballList.length; i++){
  ballList[i].update();
  ballList[i].move();
  

  //check if balls overlap

  
    for(int j=i; j<ballList.length; j++)
    {
      if(i!=j)
      {
        float distance = dist(ballList[i].xPos,ballList[i].yPos,ballList[j].xPos,ballList[j].yPos);
        if(distance<=(ballList[i].rad+ballList[j].rad)/2+1)
        {
          
            ballList[i].rad = floor(distance);
          ballList[j].rad = floor(distance);
          
          }
         
        }
      }
    }
  }



class Ball{
 float xPos;
 float yPos;
 float rad;
 float xVel;
 float yVel;

 //This is a construction->
 Ball(){
  xPos= random(width);
  yPos = random(height);
  xVel= random(-1,1);
  yVel = random(-1,1);
  rad = 100;
 } 
  
  void update(){
  fill(random(255),random(0),random(0));
  ellipse(xPos, yPos, rad, rad);
  


  
  collisionLogic();
  
}
  void move(){
    xPos+=xVel;
    yPos+=yVel;
    }

void collisionLogic() {
  
   // walls
  if (yPos + rad >= height) {
    yVel *= random(-2);
    xVel *= random(2);
  }
 
  if (yPos - rad <= height-height) {
    yVel *= random(-2);
    xVel *= random(-2);
  }
  
  if (xPos + rad >= width) {
    xVel *= random(-2);
    yVel *=random(-2);
  }
 
  if (xPos - rad <= width-width) {
    xVel *= random(-2);
    yVel *= random(-2);
  }
}

}
  

