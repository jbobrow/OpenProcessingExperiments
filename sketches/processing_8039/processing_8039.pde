

class alien{
  float speed = 2;
  float xPos,yPos, d;
  boolean on=false;
  int countX, countY;

  alien(float x, float y){
    xPos=x;
    yPos=y;
    on=true;

  }

  void display(){
    if(on){
      fill(100, 175,250,90);
      stroke(255,255,255,65);
      rect(xPos,yPos,40,40);
        new alien(xPos,yPos);
       // redraw ();
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

    if(xPos > width || xPos < 0){
    speed = speed * -1;
      //xPos=xPos-speed;
     // xPos=countX+speed;
    }
    if (key=='d'){
      xPos=xPos+speed*3;
    } 
    if(key=='e'){
      
            xPos=xPos+speed*7;
    }
    if (key =='a'){
      xPos=xPos+speed*-3;
    }
if (key =='q'){
 yPos=xPos+speed; 
 yPos=height/2;
}
if (key =='w'){
  xPos=width/2;


  }


  if (key=='r'){
       yPos=yPos+speed;
}
  if(yPos > height || yPos < 0){
        speed = speed * -1;
}
}
}





