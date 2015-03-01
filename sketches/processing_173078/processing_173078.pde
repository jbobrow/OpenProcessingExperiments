
PImage smallfire;
PImage smallfireside;
PImage starter;
Thing theThing;
int countdown;
int assistant;
//Solid snake;
Solid[] maze;
boolean victory;
boolean begin;

void setup(){
  size(700,700);
  theThing=new Thing(25,0);
  starter=loadImage("starter.jpg");
  smallfire=loadImage("smallflame.gif");
  smallfireside=loadImage("smallflameside.gif");
  //snake=new Solid(350,600,50,50);
  begin=true;
  victory=false;
  countdown=690;
  assistant=1;
  maze=new Solid[22];
  maze[0]=new Solid(0,0,700,20);
  maze[1]=new Solid(0,0,20,700);
  maze[2]=new Solid(0,680,700,20);
  maze[3]=new Solid(680,0,20,700);
  maze[4]=new Solid(80,80,40,620);
  maze[5]=new Solid(80,80,160,40);
  maze[6]=new Solid(300,0,180,60);
  maze[7]=new Solid(580,80,40,240);
  maze[8]=new Solid(240,120,200,40);
  maze[9]=new Solid(440,160,140,40);
  maze[10]=new Solid(580,390,40,310);
  maze[11]=new Solid(480,390,100,40);
  maze[12]=new Solid(440,290,40,140);
  maze[13]=new Solid(240,250,200,40);
  maze[14]=new Solid(480,290,40,40);
  maze[15]=new Solid(120,200,60,40);
  maze[16]=new Solid(200,290,40,210);
  maze[17]=new Solid(200,630,40,50);
  maze[18]=new Solid(200,500,320,40);
  maze[19]=new Solid(300,540,40,60);
  maze[20]=new Solid(390,600,40,80);
  maze[21]=new Solid(480,540,40,90);
}

void draw(){
  if(begin)
  {
    scale(.75,1);
    image(starter,0,0);
    scale(4/3,1);
    if(keyPressed)
    {
      if (key == 'a') 
       {
         
         begin=false;
          
       }
    }
  }
  else{background(255);
  fill(255,255,0);
  rect(240,290,200,210); 
  
  //copy(smallfire,0,0,256,256,350,350,32,32);
  for(int i=0; i<22; i++)
    maze[i].draw();
  if(countdown>0&&victory==false)
    theThing.move();
  for(int i=0; i<22; i++)
    theThing.collider(maze[i]);
  theThing.draw();
  theThing.controller();
  fill(255);
  rect(5,687,countdown,5);
  victory=theThing.checkWin();
  assistant++;
  if(assistant%5==0&&!victory)
    countdown--;
  if(countdown<=0&&!victory)
  {
    fill(255,0,0);
    textSize(96);
    text("Failure",200,350);
  }
  if(victory)
  {
    fill(0,240,0);
    textSize(96);
    text("Success!",200,350);
  }
  }
  
}

class Thing {
  float x,y;
  int eyeX,eyeY,direction;
  boolean upMove, downMove, rightMove, leftMove;
  
  Thing(float Class_X, float Class_Y){
    x = Class_X;
    y = Class_Y;
    eyeX=0;
    eyeY=0;
    direction=1;
    
    
    
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
  
  boolean checkWin()
  {
    if(240<=x&&440>=x&&290<=y&&500>=y)
      return true;
    else return false;
    
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
    
    direction=1;
    if (y+40<700) {
      y +=5;   
    }
    else y=660;
    if(rightMove){
      x+=5;
      direction+=1;
    }  
    if(leftMove)
    {
       x-=5;
       direction-=1;
    }
    if(upMove)
    {
      y-=10;
      direction+=20;
    }
    if(downMove)
    {
      y+=5;
      if(upMove)
        direction-=10;
    }
    if(x>660)
      x=660;
    if(x<0)
      x=0;
    if(y>660)
      y=660;
    if(y<0)
      y=0;
    
  }
  
  int calledNumber(int i, Solid s)
  {
    if(i==0)
      return y+40-s.getY();
    else if(i==1)
      return s.getY2()-y;
    else if(i==2)
      return s.getX2()-x;
    else return x+40-s.getX();
  }
  
  void judgement(boolean[] i, Solid s)
  {
    if(i[0])
      y=s.getY()-41;
    if(i[1])
      y=s.getY2()+1;
    if(i[2])
      x=s.getX2()+1;
    if(i[3])
      x=s.getX()-41;
  }
  
  void collider(Solid s){
    //Collision is hard, man.
    int[] register=new int[4];
    int[] registerIndex=new int[2];
    registerIndex[0]=0;
    registerIndex[1]=0;
    int hereForSomeReason=0;
    boolean[] diaCheck=new boolean[4];
    boolean diagonalJudge=false;
    boolean compare=true;
    for(int i=0; i<4; i++)
    {
      diaCheck[i]=false;
      register[i]=0; 
    }
    
    if(x+40>=s.getX()&&x<=s.getX2())
    {
      if(y+40>=s.getY()&&y+40<=s.getY2())
      {
        if(direction==1)
          y=s.getY()-41;
        else if(direction==2||direction==0)
          diaCheck[0]=true;
        
      }
      if(y>s.getY()&&y<s.getY2())
      {
        if(direction==21)
          y=s.getY2()+1;
        else if(direction==20||direction==22)
          diaCheck[1]=true;
      }
    }
    
    
    if(y+40>=s.getY()&&y<=s.getY2())
    {
      if(x>=s.getX()&&x<=s.getX2())
      {
        if(direction==10)
          x=s.getX2()+1;
        else if(direction==0||direction==20)
          diaCheck[2]=true;
      }
      if(x+40>=s.getX()&&x+40<=s.getX2())
      {
        if(direction==12)
          x=s.getX()-41;
        else if(direction==2||direction==22)
          diaCheck[3]=true;
      }
    }
    
    for(int i=0; i<4; i++)
    {
      if(diaCheck[i]==true)
      {
        
        diagonalJudge=true;
        register[i]=calledNumber(i,s);
        registerIndex[hereForSomeReason]=i;
        hereForSomeReason++;
        if((i<2&&register[i]>10)||(i>1&&register[i]>5))
        {
          diaCheck[i]=false; 
          compare=false;   
        }
      }
    }
    if(diagonalJudge)
    {
      if(register[registerIndex[0]]>register[registerIndex[1]]&&compare)
        diaCheck[registerIndex[1]]=false;
      if(register[registerIndex[0]]<register[registerIndex[1]]&&compare)
        diaCheck[registerIndex[0]]=false;
      judgement(diaCheck,s);
    }
   
  }
}

class Solid {
  float x,y;
  int xdimension, ydimension;
  
  Solid(float Class_X, float Class_Y, int X_Dimen, int Y_Dimen){
    x = Class_X;
    y = Class_Y;
    
    xdimension=X_Dimen;
    ydimension=Y_Dimen;
    
  }
  
  void draw(){
    fill(0,255,255);
    rect(x,y,xdimension,ydimension);    
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  int getX2(){
    return x+xdimension;
  }
  
  int getY2(){
    return y+ydimension;
  }
  


}



