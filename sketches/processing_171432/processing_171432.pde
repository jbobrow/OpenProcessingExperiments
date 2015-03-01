
PImage smallfire;
PImage smallfireside;
Thing theThing;

void setup(){
  size(700,700);
  theThing=new Thing(0,0,0,0);
  smallfire=loadImage("smallflame.gif");
  smallfireside=loadImage("smallflameside.gif");
  //smallfire.filter(INVERT);
}

void draw(){
  background(255);
  fill(0);
 
  
  //copy(smallfire,0,0,256,256,350,350,32,32);
  theThing.move();
  theThing.draw();
  theThing.controller();

}

class Thing {
  float x,y;
  int x_speed, y_speed,eyeX,eyeY;
  boolean upMove, downMove, rightMove, leftMove;
  
  Thing(float Class_X, float Class_Y, int X_Speed, int Y_Speed){
    x = Class_X;
    y = Class_Y;
    eyeX=0;
    eyeY=0;
    
    x_speed=X_Speed;
    y_speed=Y_Speed;
    
    upMove=false;
    downMove=false;
    rightMove=false;
    leftMove=false;
  }
  
  void draw(){
    fill(#224713);
    rect(x,y,40,40);
    if(upMove)
    {
      
      eyeY+=5;
      pushMatrix();
      scale(.10,-.10);
      image(smallfire,(x+7)*10,(y+75)*-10);
      popMatrix();
    }
    if(downMove)
    {
      
      eyeY-=5;
      pushMatrix();
      scale(.10);
      image(smallfire,(x+7)*10,(y-35)*10);
      popMatrix();
    }
    if(leftMove)
    {
      
      eyeX+=5;
      pushMatrix();
      scale(-.10,.10);
      image(smallfireside,(x+75)*-10,(y+10)*10);
      popMatrix();
      
    }
    if(rightMove)
    {
      
      eyeX-=5;
      pushMatrix();
      scale(.10);
      image(smallfireside,(x-35)*10,(y+10)*10);
      popMatrix();
    } 
    triangle(x+20,y+40,x+10,y+50,x+30,y+50);
    triangle(x+20,y,x+10,y-10,x+30,y-10);
    triangle(x+40,y+20,x+50,y+10,x+50,y+30);
    triangle(x,y+20,x-10,y+10,x-10,y+30);
    fill(#FF0000);
    ellipse(x+20,y+20,40,40);
    fill(0);
    ellipse(x+20+eyeX,y+20+eyeY,10,10);
    eyeX=0;
    eyeY=0;
  }
  

  void controller()
  {
    if(keyPressed)
    {
       if(key=='w'||key=='W')
         upMove=false;
       if(key=='a'||key=='A')
         leftMove=false;
       if(key=='s'||key=='S')
         downMove=false;
       if(key=='d'||key=='D')
         rightMove=false;
      
       if (key == CODED) 
       {
         if (keyCode == RIGHT) 
          {
            rightMove=true;
          } 
          if (keyCode == LEFT) 
          {
            leftMove=true;
          }
         if (keyCode == UP) 
          {
            upMove=true;
          } 
          if (keyCode == DOWN) 
          {
            downMove=true;
          }  
       }
    }
    
  }
  
  
  void move(){
    //y-=10;
    /*if (x>width || x<0){
      x_speed = -x_speed;
    }
    if (y<0) {
      y_speed += 1;
    }*/
    if (y+40<700) {
      y +=5;
    }
    else y=660;
    if(rightMove)
      x+=5;
    if(leftMove)
       x-=5;
    if(upMove)
      y-=10;
    if(downMove)
      y+=5;
    if(x>660)
      x=660;
    if(x<0)
      x=0;
    if(y>660)
      y=660;
    if(y<0)
      y=0;
    
    //x+=x_speed-x;
    //y+=y_speed/2;
  }
}





