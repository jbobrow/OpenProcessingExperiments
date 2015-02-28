

class alien{
  float speed = 1;
  float xPos,yPos, d, xspeed;
  boolean on=false;
  int countX, countY;

  alien(float x, float y){
    xPos=x;
    yPos=y;
    on=true;

  }

  void display(){
    if(on){
      fill(random(0,255), random(0,255),random(0,255),75);
      rect(xPos,yPos,40,40);
        new alien(xPos,yPos);
        redraw ();
    }
  }

  void hit(){
    d=dist(xPos,yPos,myBullet.xPos,myBullet.yPos);
    if(on){
      if(d<25){
        on=false;
        myBullet.tripped=false;
      
      }

  }
  }
  
  void move(){
   xPos=xPos+speed;
    if(xPos > width){

      xPos=xPos-speed;
      xPos=countX+speed;
    }
    if (key=='d'){
      xPos=xPos+countX;
    } 
    if (key =='a'){
      xPos=xPos+speed+3;
    }
if (key =='q'){
 yPos=xPos+speed; 
 yPos=height/2;
}
if (key =='w'){
  xPos=width/2;


  }
  
    
}
}






