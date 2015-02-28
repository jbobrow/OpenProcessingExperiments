
float y = 200; 
float ballx = 200; 
float bally = 100; 
int p1=0;
int p2=0;
int comlev=7;
int level=1;
int num=20;
int[] gamelevel= { 
  0,0,0 };
float[] ipx=new float[num];
float[] ipy=new float[num];
color ec=rcolor();
color bc=rcolor();
float my = 10; 
float mx = -10; 
String txt;
color rcolor() { 
  return color(random(255),255,255); 
}

void setup(){ 
  size(400,400); 
  background(0); 
  smooth();
  noStroke(); 
  textFont(createFont("Arial",20));
  textAlign(CENTER);
  colorMode(HSB);
  for(int i=0;i<num;i++) {
    ipx[i]=random(100,width-100);
    ipy[i]=random(0,height);
  }
} 
void new_position(int i) {
  mx=random(5,10);
  my=random(-10,-5);
  if(i!=-1) {
    ipx[i]=random(100,width-100);
    ipy[i]=random(0,height); 
  }
}
void draw(){ 
  fill(0,12);
  rect(0,0,width,height);
  fill(bc);
  ellipse(ballx, bally, 15, 15);
  level=1+int((p1+p2)/5);
  if(gamelevel[0]==1) {
         fill(bc);
      ellipse(width/2,height/2,100,100);
      if(abs(dist(width/2,height/2,ballx,bally))<=50) new_position(-1);
    } 
  if(gamelevel[1]==1) {
      for(int i=0;i<num;i++) {
      ellipse(ipx[i],ipy[i],10,10);
      if(abs(dist(ipx[i],ipy[i],ballx,bally))<=10) new_position(i);   
    }
  }
  if(gamelevel[2]==1) {
      fill(bc);
      ellipse(width*(1/4.0),height*(1/4.0),50,50);
      if(abs(dist(width*(1/4.0),height*(1/4.0),ballx,bally))<=25) new_position(-1);
       ellipse(width*(3/4.0),height*(3/4.0),50,50);
      if(abs(dist(width*(3/4.0),height*(3/4.0),ballx,bally))<=25) new_position(-1);
  }
  fill(255);
  if(p1<20&&p2<20) {
    txt="Player:"+p1+" Computer:"+p2;
    text("Level "+level,width/2,height-20);
  } 
  else {
    txt=(p1>=20)?"You Won!":"You lost!";
  }
  text(txt,width/2,height-50); 
  fill(ec);
  rect(0, mouseY, 10, 50); 
  rect(width-10, y-25, 10, 50); 
  ballx+=mx;
   bally+=my; 
  if(bally >height-16 || bally < 16) my *= -1; 

  if(ballx < 10 && abs(bally - mouseY) < 35){ 
    ec=rcolor();
    bc=rcolor();
    mx *= -1; 
    my = (bally - mouseY)/4; 
  } 
  if(ballx > width- 10 && abs(bally - y) < 35){ 
    ec=rcolor();
    bc=rcolor();
    mx *= -1; 
    my = (bally - y)/4; 
  } 
  if(abs(bally-y)>10) y=(bally>y)?y+comlev:y-comlev;
  if(abs(bally-y)<10) y=(bally>y)?y+2:y-2;      
  if(ballx < 0 || ballx >width){ 
    if(ballx<0) p2++; 
    if(ballx>width) p1++; 
    ballx = random(180,220);
    bally = random(90,110);
  }  
  switch(level) { 
  case 1:
    gamelevel[0]=1;
    gamelevel[1]=0;
    gamelevel[2]=0;
    break;
  case 2:
    gamelevel[0]=0;
    gamelevel[1]=1;
    gamelevel[2]=0;
    break;
  case 3:
    gamelevel[0]=1;
    gamelevel[1]=1;
    gamelevel[2]=0;
    break;
  case 4:
    gamelevel[0]=1;
    gamelevel[1]=1;
    gamelevel[2]=1;
    break;
  }
} 






