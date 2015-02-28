
float timer=10;
float timer2=15;
float timer3=5;
float counter=0;
SpriteObject[] mysprites=new SpriteObject[100];
PImage horse;
PImage wark;
PImage arm;
PImage forest;
int gameState=0;
int play=0;
int win1state=1;
int playstate2=2;
int win2state=3;
int playstate3=4;
int gameover=5;
void setup()
{

  size(500,500);
  forest=requestImage("Forest.jpg");
  horse=requestImage("horse.png");
  wark=requestImage("wark.png");
  mysprites[0]=new SpriteObject("arm.png");
mysprites[0].x=0;
mysprites[0].y=random(10,500);
mysprites[1]=new SpriteObject("arm.png");
mysprites[1].x=250;
mysprites[1].y=0;
mysprites[2]=new SpriteObject("arm.png");
mysprites[2].x=random(10,500);
mysprites[3]=new SpriteObject("arm.png");
mysprites[3].x=random(10,500);
mysprites[4]=new SpriteObject("arm.png");
mysprites[4].x=random(10,500);
mysprites[5]=new SpriteObject("arm.png");
mysprites[5].x=random(10,500);
mysprites[6]=new SpriteObject("arm.png");
mysprites[6].y=random(10,500);
mysprites[7]=new SpriteObject("arm.png");
mysprites[7].y=random(10,500);
mysprites[8]=new SpriteObject("arm.png");
mysprites[8].y=random(10,500);
mysprites[9]=new SpriteObject("arm.png");
mysprites[9].y=random(10,500);
mysprites[10]=new SpriteObject("arm.png");
mysprites[10].x=random(10,500);
mysprites[11]=new SpriteObject("arm.png");
mysprites[11].y=random(10,500);
mysprites[12]=new SpriteObject("arm.png");
mysprites[12].y=random(10,500);
mysprites[13]=new SpriteObject("arm.png");
mysprites[13].y=random(10,500);
mysprites[14]=new SpriteObject("arm.png");
mysprites[14].y=random(10,500);
mysprites[15]=new SpriteObject("arm.png");
mysprites[15].y=random(10,500);
mysprites[16]=new SpriteObject("arm.png");
mysprites[16].y=random(10,500);
mysprites[17]=new SpriteObject("arm.png");
mysprites[17].y=random(10,500);
mysprites[18]=new SpriteObject("arm.png");
mysprites[18].y=random(10,500);
mysprites[19]=new SpriteObject("arm.png");
mysprites[19].x=random(10,500);
mysprites[20]=new SpriteObject("arm.png");
mysprites[20].x=random(10,500);
mysprites[21]=new SpriteObject("arm.png");
mysprites[21].x=random(10,500);
mysprites[22]=new SpriteObject("arm.png");
mysprites[22].x=random(10,500);
mysprites[23]=new SpriteObject("arm.png");
mysprites[23].x=random(10,500);
mysprites[24]=new SpriteObject("arm.png");
mysprites[24].x=random(10,500);
mysprites[25]=new SpriteObject("arm.png");
mysprites[25].x=random(10,500);
mysprites[26]=new SpriteObject("arm.png");
mysprites[26].y=random(10,500);
mysprites[27]=new SpriteObject("arm.png");
mysprites[27].y=random(10,500);
mysprites[28]=new SpriteObject("arm.png");
mysprites[28].y=random(10,500);
mysprites[29]=new SpriteObject("arm.png");
mysprites[29].y=random(10,500);
mysprites[30]=new SpriteObject("arm.png");
mysprites[30].y=random(10,500);
mysprites[31]=new SpriteObject("arm.png");
mysprites[31].y=random(10,500);
mysprites[32]=new SpriteObject("arm.png");
mysprites[32].y=random(10,500);
mysprites[33]=new SpriteObject("arm.png");
mysprites[33].y=random(10,500);
mysprites[34]=new SpriteObject("arm.png");
mysprites[34].y=random(10,500);
mysprites[35]=new SpriteObject("arm.png");
mysprites[35].y=random(10,500);
mysprites[36]=new SpriteObject("arm.png");
mysprites[36].y=random(10,500);
mysprites[37]=new SpriteObject("arm.png");
mysprites[37].y=random(10,500);
mysprites[38]=new SpriteObject("arm.png");
mysprites[38].y=random(10,500);
mysprites[39]=new SpriteObject("arm.png");
mysprites[39].y=random(10,500);
mysprites[40]=new SpriteObject("arm.png");
mysprites[40].y=random(10,500);
mysprites[41]=new SpriteObject("arm.png");
mysprites[41].y=random(10,500);
mysprites[42]=new SpriteObject("arm.png");
mysprites[42].y=random(10,500);
mysprites[43]=new SpriteObject("arm.png");
mysprites[43].y=random(10,500);
mysprites[44]=new SpriteObject("arm.png");
mysprites[44].y=random(10,500);
mysprites[45]=new SpriteObject("arm.png");
mysprites[45].y=random(10,500);
mysprites[46]=new SpriteObject("arm.png");
mysprites[46].y=random(10,500);
mysprites[47]=new SpriteObject("arm.png");
mysprites[47].y=random(10,500);
mysprites[48]=new SpriteObject("arm.png");
mysprites[48].y=random(10,500);
mysprites[49]=new SpriteObject("arm.png");
mysprites[49].y=random(10,500);
mysprites[50]=new SpriteObject("arm.png");
mysprites[50].y=random(10,500);
mysprites[51]=new SpriteObject("arm.png");
mysprites[51].y=random(10,500);
mysprites[52]=new SpriteObject("arm.png");
mysprites[52].y=random(10,500);
mysprites[53]=new SpriteObject("arm.png");
mysprites[53].y=random(10,500);
mysprites[54]=new SpriteObject("arm.png");
mysprites[54].y=random(10,500);
mysprites[55]=new SpriteObject("arm.png");
mysprites[55].y=random(10,500);
mysprites[56]=new SpriteObject("arm.png");
mysprites[56].y=random(10,500);
mysprites[57]=new SpriteObject("arm.png");
mysprites[57].y=random(10,500);
mysprites[58]=new SpriteObject("arm.png");
mysprites[58].y=random(10,500);
mysprites[59]=new SpriteObject("arm.png");
mysprites[59].y=random(10,500);
mysprites[60]=new SpriteObject("arm.png");
mysprites[60].y=random(10,500);
mysprites[61]=new SpriteObject("arm.png");
mysprites[61].y=random(10,500);
mysprites[62]=new SpriteObject("arm.png");
mysprites[62].y=random(10,500);
mysprites[63]=new SpriteObject("arm.png");
mysprites[63].x=random(10,500);
mysprites[64]=new SpriteObject("arm.png");
mysprites[64].x=random(10,500);
mysprites[65]=new SpriteObject("arm.png");
mysprites[65].x=random(10,500);
mysprites[66]=new SpriteObject("arm.png");
mysprites[66].x=random(10,500);
mysprites[67]=new SpriteObject("arm.png");
mysprites[67].x=random(10,500);
mysprites[68]=new SpriteObject("arm.png");
mysprites[68].x=random(10,500);
mysprites[69]=new SpriteObject("arm.png");
mysprites[69].x=random(10,500);
mysprites[70]=new SpriteObject("arm.png");
mysprites[70].x=random(10,500);
mysprites[71]=new SpriteObject("arm.png");
mysprites[71].x=random(10,500);
mysprites[72]=new SpriteObject("arm.png");
mysprites[72].x=random(10,500);
mysprites[73]=new SpriteObject("arm.png");
mysprites[73].x=random(10,500);
mysprites[74]=new SpriteObject("arm.png");
mysprites[74].x=random(10,500);
mysprites[75]=new SpriteObject("arm.png");
mysprites[75].x=random(10,500);
mysprites[76]=new SpriteObject("arm.png");
mysprites[76].x=random(10,500);
mysprites[77]=new SpriteObject("arm.png");
mysprites[77].x=random(10,500);
mysprites[78]=new SpriteObject("arm.png");
mysprites[78].x=random(10,500);
mysprites[79]=new SpriteObject("arm.png");
mysprites[79].x=random(10,500);
mysprites[80]=new SpriteObject("arm.png");
mysprites[80].x=random(10,500);
mysprites[81]=new SpriteObject("arm.png");
mysprites[81].x=random(10,500);
mysprites[82]=new SpriteObject("arm.png");
mysprites[82].x=random(10,500);
mysprites[83]=new SpriteObject("arm.png");
mysprites[83].x=random(10,500);
mysprites[84]=new SpriteObject("arm.png");
mysprites[84].x=random(10,500);
mysprites[85]=new SpriteObject("arm.png");
mysprites[85].x=random(10,500);
mysprites[86]=new SpriteObject("arm.png");
mysprites[86].x=random(10,500);
mysprites[87]=new SpriteObject("arm.png");
mysprites[87].x=random(10,500);
mysprites[88]=new SpriteObject("arm.png");
mysprites[88].x=random(10,500);
mysprites[89]=new SpriteObject("arm.png");
mysprites[89].x=random(10,500);
mysprites[90]=new SpriteObject("arm.png");
mysprites[90].x=random(10,500);
mysprites[91]=new SpriteObject("arm.png");
mysprites[91].x=random(10,500);
mysprites[92]=new SpriteObject("arm.png");
mysprites[92].x=random(10,500);
mysprites[93]=new SpriteObject("arm.png");
mysprites[93].x=random(10,500);
mysprites[94]=new SpriteObject("arm.png");
mysprites[94].x=random(10,500);
mysprites[95]=new SpriteObject("arm.png");
mysprites[95].x=random(10,500);
mysprites[96]=new SpriteObject("arm.png");
mysprites[96].x=random(10,500);
mysprites[97]=new SpriteObject("arm.png");
mysprites[97].x=random(10,500);
mysprites[98]=new SpriteObject("arm.png");
mysprites[98].x=random(10,500);
mysprites[99]=new SpriteObject("arm.png");
mysprites[99].x=random(10,500);

}
void draw()
{
    imageMode(CORNER);
  if(forest.width>0)
  {
image(forest,0,0,500,500);
  }
  if (gameState==play)
  {
    imageMode(CENTER);
    image(wark,mouseX,mouseY,30,30);
    imageMode(CORNER);
    timer-=0.0167;
    textSize(32);
    fill(0);
    text("Time: "+(int)timer,0,50);
    mysprites[10].render();
    if (mysprites[10].y>500)
    {
      mysprites[10].x=random(10,500);
      mysprites[10].y=0;
    }
    mysprites[10].y+=2;
mysprites[0].render();
    if (mysprites[0].x>500)
    {
      mysprites[0].y=random(10,500);
      mysprites[0].x=0;
    }
       mysprites[0].x+=2;
       mysprites[6].render();
    if (mysprites[6].x>500)
    {
      mysprites[6].y=random(10,500);
      mysprites[6].x=0;
    }
       mysprites[6].x+=2;
       mysprites[7].render();
    if (mysprites[7].x>500)
    {
      mysprites[7].y=random(10,500);
      mysprites[7].x=0;
    }
       mysprites[7].x+=2;
       mysprites[8].render();
    if (mysprites[8].x>500)
    {
      mysprites[8].y=random(10,500);
      mysprites[8].x=0;
    }
       mysprites[8].x+=2;
       mysprites[9].render();
    if (mysprites[9].x>500)
    {
      mysprites[9].y=random(10,500);
      mysprites[9].x=0;
    }
       mysprites[9].x+=2;
 
    if (mysprites[1].y>500)
    {
      mysprites[1].x=random(10,500);
      mysprites[1].y=0;
    }
       mysprites[1].y+=2;
           mysprites[2].render();
    if (mysprites[2].y>500)
    {
      mysprites[2].x=random(10,500);
      mysprites[2].y=0;
    }
       mysprites[2].y+=2;
           mysprites[3].render();
    if (mysprites[3].y>500)
    {
      mysprites[3].x=random(10,500);
      mysprites[3].y=0;
    }
       mysprites[3].y+=2;
           mysprites[1].render();
    if (mysprites[4].y>500)
    {
      mysprites[4].x=random(10,500);
      mysprites[4].y=0;
    }
       mysprites[4].y+=2;
           mysprites[5].render();
    if (mysprites[5].y>500)
    {
      mysprites[5].x=random(10,500);
      mysprites[5].y=0;
    }
       mysprites[5].y+=2;
  }
  
  if (timer<0)
  {
    timer=0;
    gameState=win1state;
  }
if (gameState==win1state)
{
  fill(0);
  rect(0,0,500,500);
  textSize(32);
  fill(0,255,0);
  text("YOU WON ROUND ONE!!!",0,200);
  text("ROUND 2 in: "+(int)timer3,0,300);
  timer3-=0.0167;
}
if(timer3<0)
{
  gameState=playstate2;
  timer3=5;
  timer3+=0;
}
if (gameState==playstate2)
{
   imageMode(CENTER);
    image(wark,mouseX,mouseY,20,20);
    imageMode(CORNER);
  timer2-=0.0167;
  fill(0);
  text("Time: "+(int)timer2,0,50);
mysprites[11].render();
    if (mysprites[11].x>500)
    {
      mysprites[11].y=random(10,500);
      mysprites[11].x=0;
    }
       mysprites[11].x+=4;
       mysprites[12].render();
    if (mysprites[12].x>500)
    {
      mysprites[12].y=random(10,500);
      mysprites[12].x=0;
    }
       mysprites[12].x+=4;
       mysprites[13].render();
    if (mysprites[13].x>500)
    {
      mysprites[13].y=random(10,500);
      mysprites[13].x=0;
    }
       mysprites[13].x+=4;
       mysprites[14].render();
    if (mysprites[14].x>500)
    {
      mysprites[14].y=random(10,500);
      mysprites[14].x=0;
    }
       mysprites[14].x+=4;
       mysprites[15].render();
    if (mysprites[15].x>500)
    {
      mysprites[15].y=random(10,500);
      mysprites[15].x=0;
    }
       mysprites[15].x+=4;
       mysprites[16].render();
    if (mysprites[16].x>500)
    {
      mysprites[16].y=random(10,500);
      mysprites[16].x=0;
    }
       mysprites[16].x+=4;
              mysprites[17].render();
    if (mysprites[17].x>500)
    {
      mysprites[17].y=random(10,500);
      mysprites[17].x=0;
    }
       mysprites[17].x+=4;
              mysprites[18].render();
    if (mysprites[18].x>500)
    {
      mysprites[18].y=random(10,500);
      mysprites[18].x=0;
    }
       mysprites[18].x+=4;
       mysprites[19].render();
    if (mysprites[19].y>500)
    {
      mysprites[19].x=random(10,500);
      mysprites[19].y=0;
    }
       mysprites[19].y+=4;
      mysprites[20].render();
    if (mysprites[20].y>500)
    {
      mysprites[20].x=random(10,500);
      mysprites[20].y=0;
    }
       mysprites[20].y+=4;
       mysprites[21].render();
    if (mysprites[21].y>500)
    {
      mysprites[21].x=random(10,500);
      mysprites[21].y=0;
    }
       mysprites[21].y+=4;
       mysprites[22].render();
    if (mysprites[22].y>500)
    {
      mysprites[22].x=random(10,500);
      mysprites[22].y=0;
    }
       mysprites[22].y+=4;
       mysprites[23].render();
    if (mysprites[23].y>500)
    {
      mysprites[23].x=random(10,500);
      mysprites[23].y=0;
    }
       mysprites[23].y+=4;
       mysprites[24].render();
    if (mysprites[24].y>500)
    {
      mysprites[24].x=random(10,500);
      mysprites[24].y=0;
    }
       mysprites[24].y+=4;
       mysprites[25].render();
    if (mysprites[25].y>500)
    {
      mysprites[25].x=random(10,500);
      mysprites[25].y=0;
    }
       mysprites[25].y+=4;
}
if (timer2<0)
{
  timer2=0;
  gameState=win2state;
}
if(gameState==win2state)
{
  fill(0);
  rect(0,0,500,500);
  fill(0,255,0);
  text("YOU WON ROUND 2!!",100,250);
  text("TRYHARD MODE ENGAGED IN: "+(int)timer3,0,350);
  timer3-=0.0167;
}
if(timer3<0)
{
  gameState=playstate3;
  timer3=0;
  timer3+=0;
}
if(gameState==playstate3)
{
   imageMode(CENTER);
    image(horse,mouseX,mouseY,20,20);
    imageMode(CORNER);
    fill(0);
  text("Survived For: "+(int)counter,0,50);
 counter+=0.0167;
 mysprites[26].render();
    if (mysprites[26].x>500)
    {
      mysprites[26].y=random(10,500);
      mysprites[26].x=0;
    }
       mysprites[26].x+=8;
       mysprites[27].render();
    if (mysprites[27].x>500)
    {
      mysprites[27].y=random(10,500);
      mysprites[27].x=0;
    }
       mysprites[27].x+=8;
       mysprites[28].render();
    if (mysprites[28].x>500)
    {
      mysprites[28].y=random(10,500);
      mysprites[28].x=0;
    }
       mysprites[28].x+=8;
       mysprites[29].render();
    if (mysprites[29].x>500)
    {
      mysprites[29].y=random(10,500);
      mysprites[29].x=0;
    }
       mysprites[29].x+=8;
       mysprites[30].render();
    if (mysprites[30].x>500)
    {
      mysprites[30].y=random(10,500);
      mysprites[30].x=0;
    }
       mysprites[30].x+=8;
       mysprites[31].render();
    if (mysprites[31].x>500)
    {
      mysprites[31].y=random(10,500);
      mysprites[31].x=0;
    }
       mysprites[31].x+=8;
       mysprites[32].render();
    if (mysprites[32].x>500)
    {
      mysprites[32].y=random(10,500);
      mysprites[32].x=0;
    }
       mysprites[32].x+=8;
       mysprites[33].render();
    if (mysprites[33].x>500)
    {
      mysprites[33].y=random(10,500);
      mysprites[33].x=0;
    }
       mysprites[33].x+=8;
       mysprites[34].render();
    if (mysprites[34].x>500)
    {
      mysprites[34].y=random(10,500);
      mysprites[34].x=0;
    }
       mysprites[34].x+=8;
       mysprites[35].render();
    if (mysprites[35].x>500)
    {
      mysprites[35].y=random(10,500);
      mysprites[35].x=0;
    }
       mysprites[35].x+=8;
       mysprites[36].render();
    if (mysprites[36].x>500)
    {
      mysprites[36].y=random(10,500);
      mysprites[36].x=0;
    }
       mysprites[36].x+=8;
       mysprites[37].render();
    if (mysprites[37].x>500)
    {
      mysprites[37].y=random(10,500);
      mysprites[37].x=0;
    }
       mysprites[37].x+=8;
       mysprites[38].render();
    if (mysprites[38].x>500)
    {
      mysprites[38].y=random(10,500);
      mysprites[38].x=0;
    }
       mysprites[38].x+=8;
       mysprites[39].render();
    if (mysprites[39].x>500)
    {
      mysprites[39].y=random(10,500);
      mysprites[39].x=0;
    }
       mysprites[39].x+=8;
       mysprites[40].render();
    if (mysprites[40].x>500)
    {
      mysprites[40].y=random(10,500);
      mysprites[40].x=0;
    }
       mysprites[40].x+=8;
       mysprites[41].render();
    if (mysprites[41].x>500)
    {
      mysprites[41].y=random(10,500);
      mysprites[41].x=0;
    }
       mysprites[41].x+=8;
       mysprites[42].render();
    if (mysprites[42].x>500)
    {
      mysprites[42].y=random(10,500);
      mysprites[42].x=0;
    }
       mysprites[42].x+=8;
       mysprites[43].render();
    if (mysprites[43].x>500)
    {
      mysprites[43].y=random(10,500);
      mysprites[43].x=0;
    }
       mysprites[43].x+=8;
       mysprites[44].render();
    if (mysprites[44].x>500)
    {
      mysprites[44].y=random(10,500);
      mysprites[44].x=0;
    }
       mysprites[44].x+=8;
       mysprites[45].render();
    if (mysprites[45].x>500)
    {
      mysprites[45].y=random(10,500);
      mysprites[45].x=0;
    }
       mysprites[45].x+=8;
       mysprites[46].render();
    if (mysprites[46].x>500)
    {
      mysprites[46].y=random(10,500);
      mysprites[46].x=0;
    }
       mysprites[46].x+=8;
       mysprites[47].render();
    if (mysprites[47].x>500)
    {
      mysprites[47].y=random(10,500);
      mysprites[47].x=0;
    }
       mysprites[47].x+=8;
       mysprites[48].render();
    if (mysprites[48].x>500)
    {
      mysprites[48].y=random(10,500);
      mysprites[48].x=0;
    }
       mysprites[48].x+=8;
       mysprites[49].render();
    if (mysprites[49].x>500)
    {
      mysprites[49].y=random(10,500);
      mysprites[49].x=0;
    }
       mysprites[49].x+=8;
       mysprites[50].render();
    if (mysprites[50].x>500)
    {
      mysprites[50].y=random(10,500);
      mysprites[50].x=0;
    }
       mysprites[50].x+=8;
       mysprites[51].render();
    if (mysprites[51].x>500)
    {
      mysprites[51].y=random(10,500);
      mysprites[51].x=0;
    }
       mysprites[51].x+=8;
       mysprites[52].render();
    if (mysprites[52].x>500)
    {
      mysprites[52].y=random(10,500);
      mysprites[52].x=0;
    }
       mysprites[52].x+=8;
       mysprites[53].render();
    if (mysprites[53].x>500)
    {
      mysprites[53].y=random(10,500);
      mysprites[53].x=0;
    }
       mysprites[53].x+=8;
       mysprites[54].render();
    if (mysprites[54].x>500)
    {
      mysprites[54].y=random(10,500);
      mysprites[54].x=0;
    }
       mysprites[54].x+=8;
       mysprites[55].render();
    if (mysprites[55].x>500)
    {
      mysprites[55].y=random(10,500);
      mysprites[55].x=0;
    }
       mysprites[55].x+=8;
       mysprites[56].render();
    if (mysprites[56].x>500)
    {
      mysprites[56].y=random(10,500);
      mysprites[56].x=0;
    }
       mysprites[56].x+=8;
       mysprites[57].render();
    if (mysprites[57].x>500)
    {
      mysprites[57].y=random(10,500);
      mysprites[57].x=0;
    }
       mysprites[57].x+=8;
       mysprites[58].render();
    if (mysprites[58].x>500)
    {
      mysprites[58].y=random(10,500);
      mysprites[58].x=0;
    }
       mysprites[58].x+=8;
       mysprites[59].render();
    if (mysprites[59].x>500)
    {
      mysprites[59].y=random(10,500);
      mysprites[59].x=0;
    }
       mysprites[59].x+=8;
       mysprites[60].render();
    if (mysprites[60].x>500)
    {
      mysprites[60].y=random(10,500);
      mysprites[60].x=0;
    }
       mysprites[60].x+=8;
       mysprites[61].render();
    if (mysprites[61].x>500)
    {
      mysprites[61].y=random(10,500);
      mysprites[61].x=0;
    }
       mysprites[61].x+=8;
       mysprites[62].render();
    if (mysprites[62].x>500)
    {
      mysprites[62].y=random(10,500);
      mysprites[62].x=0;
    }
       mysprites[62].x+=8;
       mysprites[63].render();
    if (mysprites[63].y>500)
    {
      mysprites[63].x=random(10,500);
      mysprites[63].y=0;
    }
       mysprites[63].y+=8;
       mysprites[64].render();
    if (mysprites[64].y>500)
    {
      mysprites[64].x=random(10,500);
      mysprites[64].y=0;
    }
       mysprites[64].y+=8;
       mysprites[65].render();
    if (mysprites[65].y>500)
    {
      mysprites[65].x=random(10,500);
      mysprites[65].y=0;
    }
       mysprites[65].y+=8;
       mysprites[66].render();
    if (mysprites[66].y>500)
    {
      mysprites[66].x=random(10,500);
      mysprites[66].y=0;
    }
       mysprites[66].y+=8;
       mysprites[67].render();
    if (mysprites[67].y>500)
    {
      mysprites[67].x=random(10,500);
      mysprites[67].y=0;
    }
       mysprites[67].y+=8;
       mysprites[68].render();
    if (mysprites[68].y>500)
    {
      mysprites[68].x=random(10,500);
      mysprites[68].y=0;
    }
       mysprites[68].y+=8;
       mysprites[69].render();
    if (mysprites[69].y>500)
    {
      mysprites[69].x=random(10,500);
      mysprites[69].y=0;
    }
       mysprites[69].y+=8;
       mysprites[70].render();
    if (mysprites[70].y>500)
    {
      mysprites[70].x=random(10,500);
      mysprites[70].y=0;
    }
       mysprites[70].y+=8;
       mysprites[71].render();
    if (mysprites[71].y>500)
    {
      mysprites[71].x=random(10,500);
      mysprites[71].y=0;
    }
       mysprites[71].y+=8;
       mysprites[72].render();
    if (mysprites[72].y>500)
    {
      mysprites[72].x=random(10,500);
      mysprites[72].y=0;
    }
       mysprites[72].y+=8;
       mysprites[73].render();
    if (mysprites[73].y>500)
    {
      mysprites[73].x=random(10,500);
      mysprites[73].y=0;
    }
       mysprites[73].y+=8;
       mysprites[74].render();
    if (mysprites[74].y>500)
    {
      mysprites[74].x=random(10,500);
      mysprites[74].y=0;
    }
       mysprites[74].y+=8;
       mysprites[75].render();
    if (mysprites[75].y>500)
    {
      mysprites[75].x=random(10,500);
      mysprites[75].y=0;
    }
       mysprites[75].y+=8;
       mysprites[76].render();
    if (mysprites[76].y>500)
    {
      mysprites[76].x=random(10,500);
      mysprites[76].y=0;
    }
       mysprites[76].y+=8;
       mysprites[77].render();
    if (mysprites[77].y>500)
    {
      mysprites[77].x=random(10,500);
      mysprites[77].y=0;
    }
       mysprites[77].y+=8;
       mysprites[78].render();
    if (mysprites[78].y>500)
    {
      mysprites[78].x=random(10,500);
      mysprites[78].y=0;
    }
       mysprites[78].y+=8;
       mysprites[79].render();
    if (mysprites[79].y>500)
    {
      mysprites[79].x=random(10,500);
      mysprites[79].y=0;
    }
       mysprites[79].y+=8;
       mysprites[80].render();
    if (mysprites[80].y>500)
    {
      mysprites[80].x=random(10,500);
      mysprites[80].y=0;
    }
       mysprites[80].y+=8;
       mysprites[81].render();
    if (mysprites[81].y>500)
    {
      mysprites[81].x=random(10,500);
      mysprites[81].y=0;
    }
       mysprites[81].y+=8;
       mysprites[82].render();
    if (mysprites[82].y>500)
    {
      mysprites[82].x=random(10,500);
      mysprites[82].y=0;
    }
       mysprites[82].y+=8;
       mysprites[83].render();
    if (mysprites[83].y>500)
    {
      mysprites[83].x=random(10,500);
      mysprites[83].y=0;
    }
       mysprites[83].y+=8;
       mysprites[84].render();
    if (mysprites[84].y>500)
    {
      mysprites[84].x=random(10,500);
      mysprites[84].y=0;
    }
       mysprites[84].y+=8;
       mysprites[85].render();
    if (mysprites[85].y>500)
    {
      mysprites[85].x=random(10,500);
      mysprites[85].y=0;
    }
       mysprites[85].y+=8;
       mysprites[86].render();
    if (mysprites[86].y>500)
    {
      mysprites[86].x=random(10,500);
      mysprites[86].y=0;
    }
       mysprites[86].y+=8;
       mysprites[87].render();
    if (mysprites[87].y>500)
    {
      mysprites[87].x=random(10,500);
      mysprites[87].y=0;
    }
       mysprites[87].y+=8;
       mysprites[88].render();
    if (mysprites[88].y>500)
    {
      mysprites[88].x=random(10,500);
      mysprites[88].y=0;
    }
       mysprites[88].y+=8;
       mysprites[89].render();
    if (mysprites[89].y>500)
    {
      mysprites[89].x=random(10,500);
      mysprites[89].y=0;
    }
       mysprites[89].y+=8;
       mysprites[90].render();
    if (mysprites[90].y>500)
    {
      mysprites[90].x=random(10,500);
      mysprites[90].y=0;
    }
       mysprites[90].y+=8;
       mysprites[91].render();
    if (mysprites[91].y>500)
    {
      mysprites[91].x=random(10,500);
      mysprites[91].y=0;
    }
       mysprites[91].y+=8;
       mysprites[92].render();
    if (mysprites[92].y>500)
    {
      mysprites[92].x=random(10,500);
      mysprites[92].y=0;
    }
       mysprites[92].y+=8;
       mysprites[93].render();
    if (mysprites[93].y>500)
    {
      mysprites[93].x=random(10,500);
      mysprites[93].y=0;
    }
       mysprites[93].y+=8;
       mysprites[94].render();
    if (mysprites[94].y>500)
    {
      mysprites[94].x=random(10,500);
      mysprites[94].y=0;
    }
       mysprites[94].y+=8;
       mysprites[95].render();
    if (mysprites[95].y>500)
    {
      mysprites[95].x=random(10,500);
      mysprites[95].y=0;
    }
       mysprites[95].y+=8;
       mysprites[96].render();
    if (mysprites[96].y>500)
    {
      mysprites[96].x=random(10,500);
      mysprites[96].y=0;
    }
       mysprites[96].y+=8;
       mysprites[97].render();
    if (mysprites[97].y>500)
    {
      mysprites[97].x=random(10,500);
      mysprites[97].y=0;
    }
       mysprites[97].y+=8;
       mysprites[98].render();
    if (mysprites[98].y>500)
    {
      mysprites[98].x=random(10,500);
      mysprites[98].y=0;
    }
       mysprites[98].y+=8;
       mysprites[99].render();
    if (mysprites[99].y>500)
    {
      mysprites[99].x=random(10,500);
      mysprites[99].y=0;
    }
       mysprites[99].y+=8;
       
 //if(
}
//gameover
if (gameState==play && mysprites[0].isMouseOverlapping()==true
||mysprites[1].isMouseOverlapping()==true
||mysprites[3].isMouseOverlapping()==true 
||mysprites[2].isMouseOverlapping()==true
||mysprites[4].isMouseOverlapping()==true
||mysprites[5].isMouseOverlapping()==true
||mysprites[6].isMouseOverlapping()==true
||mysprites[7].isMouseOverlapping()==true
||mysprites[8].isMouseOverlapping()==true
||mysprites[9].isMouseOverlapping()==true
||mysprites[10].isMouseOverlapping()==true)
{
gameState=gameover;
}
else if (gameState==playstate2 &&
mysprites[11].isMouseOverlapping()==true
||mysprites[12].isMouseOverlapping()==true
||mysprites[13].isMouseOverlapping()==true
||mysprites[14].isMouseOverlapping()==true
||mysprites[15].isMouseOverlapping()==true
||mysprites[16].isMouseOverlapping()==true
||mysprites[17].isMouseOverlapping()==true
||mysprites[18].isMouseOverlapping()==true
||mysprites[19].isMouseOverlapping()==true
||mysprites[20].isMouseOverlapping()==true
||mysprites[21].isMouseOverlapping()==true
||mysprites[22].isMouseOverlapping()==true
||mysprites[23].isMouseOverlapping()==true
||mysprites[24].isMouseOverlapping()==true
||mysprites[25].isMouseOverlapping()==true)
{
  gameState=gameover;
}
else if(gameState==playstate3 &&
mysprites[26].isMouseOverlapping()==true
||mysprites[27].isMouseOverlapping()==true
||mysprites[28].isMouseOverlapping()==true
||mysprites[29].isMouseOverlapping()==true
||mysprites[30].isMouseOverlapping()==true
||mysprites[31].isMouseOverlapping()==true
||mysprites[32].isMouseOverlapping()==true
||mysprites[33].isMouseOverlapping()==true
||mysprites[34].isMouseOverlapping()==true
||mysprites[35].isMouseOverlapping()==true
||mysprites[36].isMouseOverlapping()==true
||mysprites[37].isMouseOverlapping()==true
||mysprites[38].isMouseOverlapping()==true
||mysprites[39].isMouseOverlapping()==true
||mysprites[40].isMouseOverlapping()==true
||mysprites[41].isMouseOverlapping()==true
||mysprites[42].isMouseOverlapping()==true
||mysprites[43].isMouseOverlapping()==true
||mysprites[44].isMouseOverlapping()==true
||mysprites[45].isMouseOverlapping()==true
||mysprites[46].isMouseOverlapping()==true
||mysprites[47].isMouseOverlapping()==true
||mysprites[48].isMouseOverlapping()==true
||mysprites[49].isMouseOverlapping()==true
||mysprites[50].isMouseOverlapping()==true
||mysprites[51].isMouseOverlapping()==true
||mysprites[52].isMouseOverlapping()==true
||mysprites[53].isMouseOverlapping()==true
||mysprites[54].isMouseOverlapping()==true
||mysprites[55].isMouseOverlapping()==true
||mysprites[56].isMouseOverlapping()==true
||mysprites[57].isMouseOverlapping()==true
||mysprites[58].isMouseOverlapping()==true
||mysprites[59].isMouseOverlapping()==true
||mysprites[60].isMouseOverlapping()==true
||mysprites[62].isMouseOverlapping()==true
||mysprites[61].isMouseOverlapping()==true
||mysprites[63].isMouseOverlapping()==true
||mysprites[64].isMouseOverlapping()==true
||mysprites[65].isMouseOverlapping()==true
||mysprites[66].isMouseOverlapping()==true
||mysprites[67].isMouseOverlapping()==true
||mysprites[68].isMouseOverlapping()==true
||mysprites[69].isMouseOverlapping()==true
||mysprites[70].isMouseOverlapping()==true
||mysprites[71].isMouseOverlapping()==true
||mysprites[72].isMouseOverlapping()==true
||mysprites[73].isMouseOverlapping()==true
||mysprites[74].isMouseOverlapping()==true
||mysprites[75].isMouseOverlapping()==true
||mysprites[76].isMouseOverlapping()==true
||mysprites[77].isMouseOverlapping()==true
||mysprites[78].isMouseOverlapping()==true
||mysprites[79].isMouseOverlapping()==true
||mysprites[80].isMouseOverlapping()==true
||mysprites[81].isMouseOverlapping()==true
||mysprites[82].isMouseOverlapping()==true
||mysprites[83].isMouseOverlapping()==true
||mysprites[84].isMouseOverlapping()==true
||mysprites[85].isMouseOverlapping()==true
||mysprites[86].isMouseOverlapping()==true
||mysprites[87].isMouseOverlapping()==true
||mysprites[88].isMouseOverlapping()==true
||mysprites[89].isMouseOverlapping()==true
||mysprites[90].isMouseOverlapping()==true
||mysprites[91].isMouseOverlapping()==true
||mysprites[92].isMouseOverlapping()==true
||mysprites[93].isMouseOverlapping()==true
||mysprites[94].isMouseOverlapping()==true
||mysprites[95].isMouseOverlapping()==true
||mysprites[96].isMouseOverlapping()==true
||mysprites[97].isMouseOverlapping()==true
||mysprites[98].isMouseOverlapping()==true
||mysprites[99].isMouseOverlapping()==true)
{
  gameState=gameover;
}
if (gameState==gameover)
{
  fill(255,0,0);
  rect(0,0,500,500);
  fill(0,0,0);
  textSize(55);
  text("GAME OVER",100,250);
}
}

class SpriteObject
{
  float x = 0.0;
  float y = 0.0;
  float w = -1.0;
  float h = -1.0;
  float rotation = 0.0;
  float s = 1.0;
  PImage img;
  boolean loaded = false;
   
  SpriteObject(String filename)
  {
    this.img = requestImage(filename);
  }
  boolean isMouseOverlapping()
  {
    if(mouseX>(this.x-(this.w*0.5*this.s)) 
    && mouseX <(this.x+(this.w*0.5*this.s))
    && mouseY>(this.y-(this.h*0.5*this.s))
    &&mouseY<(this.y+(this.h*0.5*this.s)))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
   void render()
  {
    if (this.img.width > 0 && loaded == false)
    {
      loaded = true;
      if (this.w == -1.0)
      {
        this.w = this.img.width;
      }
      if (this.h == -1.0)
      {
        this.h = this.img.height;
      }
    }
     
    if (loaded)
    {
      imageMode(CENTER);
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.rotation));
      scale(this.s);
      image(this.img, 0, 0, this.w, this.h);
      popMatrix();
    }
  }
}

//y.random 26-62 37
/*mysprites[26].render();
    if (mysprites[26].x>500)
    {
      mysprites[26].y=random(10,500);
      mysprites[26].x=0;
    }
       mysprites[26].x+=8;
       mysprites[[27]26].render();
    if (mysprites[27].x>500)
    {
      mysprites[27].y=random(10,500);
      mysprites[27].x=0;
    }
       mysprites[27].x+=8;
       mysprites[28].render();
    if (mysprites[28].x>500)
    {
      mysprites[28].y=random(10,500);
      mysprites[28].x=0;
    }
       mysprites[28].x+=8;
       mysprites[29].render();
    if (mysprites[29].x>500)
    {
      mysprites[29].y=random(10,500);
      mysprites[29].x=0;
    }
       mysprites[29].x+=8;
       mysprites[30].render();
    if (mysprites[30].x>500)
    {
      mysprites[30].y=random(10,500);
      mysprites[30].x=0;
    }
       mysprites[30].x+=8;
       mysprites[31].render();
    if (mysprites[31].x>500)
    {
      mysprites[31].y=random(10,500);
      mysprites[31].x=0;
    }
       mysprites[31].x+=8;
       mysprites[32].render();
    if (mysprites[32].x>500)
    {
      mysprites[32].y=random(10,500);
      mysprites[32].x=0;
    }
       mysprites[32].x+=8;
       mysprites[33].render();
    if (mysprites[33].x>500)
    {
      mysprites[33].y=random(10,500);
      mysprites[33].x=0;
    }
       mysprites[33].x+=8;
       mysprites[34].render();
    if (mysprites[34].x>500)
    {
      mysprites[34].y=random(10,500);
      mysprites[34].x=0;
    }
       mysprites[34].x+=8;
       mysprites[35].render();
    if (mysprites[35].x>500)
    {
      mysprites[35].y=random(10,500);
      mysprites[35].x=0;
    }
       mysprites[35].x+=8;
       mysprites[36].render();
    if (mysprites[36].x>500)
    {
      mysprites[36].y=random(10,500);
      mysprites[36].x=0;
    }
       mysprites[36].x+=8;
       mysprites[37].render();
    if (mysprites[37].x>500)
    {
      mysprites[37].y=random(10,500);
      mysprites[37].x=0;
    }
       mysprites[37].x+=8;
       mysprites[38].render();
    if (mysprites[38].x>500)
    {
      mysprites[38].y=random(10,500);
      mysprites[38].x=0;
    }
       mysprites[38].x+=8;
       mysprites[39].render();
    if (mysprites[39].x>500)
    {
      mysprites[39].y=random(10,500);
      mysprites[39].x=0;
    }
       mysprites[39].x+=8;
       mysprites[40].render();
    if (mysprites[40].x>500)
    {
      mysprites[40].y=random(10,500);
      mysprites[40].x=0;
    }
       mysprites[40].x+=8;
       mysprites[41].render();
    if (mysprites[41].x>500)
    {
      mysprites[41].y=random(10,500);
      mysprites[41].x=0;
    }
       mysprites[41].x+=8;
       mysprites[42].render();
    if (mysprites[42].x>500)
    {
      mysprites[42].y=random(10,500);
      mysprites[42].x=0;
    }
       mysprites[42].x+=8;
       mysprites[43].render();
    if (mysprites[43].x>500)
    {
      mysprites[43].y=random(10,500);
      mysprites[43].x=0;
    }
       mysprites[43].x+=8;
       mysprites[44].render();
    if (mysprites[44].x>500)
    {
      mysprites[44].y=random(10,500);
      mysprites[44].x=0;
    }
       mysprites[44].x+=8;
       mysprites[45].render();
    if (mysprites[45].x>500)
    {
      mysprites[45].y=random(10,500);
      mysprites[45].x=0;
    }
       mysprites[45].x+=8;
       mysprites[46].render();
    if (mysprites[46].x>500)
    {
      mysprites[46].y=random(10,500);
      mysprites[46].x=0;
    }
       mysprites[46].x+=8;
       mysprites[47].render();
    if (mysprites[47].x>500)
    {
      mysprites[47].y=random(10,500);
      mysprites[47].x=0;
    }
       mysprites[47].x+=8;
       mysprites[48].render();
    if (mysprites[48].x>500)
    {
      mysprites[48].y=random(10,500);
      mysprites[48].x=0;
    }
       mysprites[48].x+=8;
       mysprites[49].render();
    if (mysprites[49].x>500)
    {
      mysprites[49].y=random(10,500);
      mysprites[49].x=0;
    }
       mysprites[49].x+=8;
       mysprites[50].render();
    if (mysprites[50].x>500)
    {
      mysprites[50].y=random(10,500);
      mysprites[50].x=0;
    }
       mysprites[50].x+=8;
       mysprites[51].render();
    if (mysprites[51].x>500)
    {
      mysprites[51].y=random(10,500);
      mysprites[51].x=0;
    }
       mysprites[51].x+=8;
       mysprites[52].render();
    if (mysprites[52].x>500)
    {
      mysprites[52].y=random(10,500);
      mysprites[52].x=0;
    }
       mysprites[52].x+=8;
       mysprites[53].render();
    if (mysprites[53].x>500)
    {
      mysprites[53].y=random(10,500);
      mysprites[53].x=0;
    }
       mysprites[53].x+=8;
       mysprites[54].render();
    if (mysprites[54].x>500)
    {
      mysprites[54].y=random(10,500);
      mysprites[54].x=0;
    }
       mysprites[54].x+=8;
       mysprites[55].render();
    if (mysprites[55].x>500)
    {
      mysprites[55].y=random(10,500);
      mysprites[55].x=0;
    }
       mysprites[55].x+=8;
       mysprites[56].render();
    if (mysprites[56].x>500)
    {
      mysprites[56].y=random(10,500);
      mysprites[56].x=0;
    }
       mysprites[56].x+=8;
       mysprites[57].render();
    if (mysprites[57].x>500)
    {
      mysprites[57].y=random(10,500);
      mysprites[57].x=0;
    }
       mysprites[57].x+=8;
       mysprites[58].render();
    if (mysprites[58].x>500)
    {
      mysprites[58].y=random(10,500);
      mysprites[58].x=0;
    }
       mysprites[58].x+=8;
       mysprites[59].render();
    if (mysprites[59].x>500)
    {
      mysprites[59].y=random(10,500);
      mysprites[59].x=0;
    }
       mysprites[59].x+=8;
       mysprites[60].render();
    if (mysprites[60].x>500)
    {
      mysprites[60].y=random(10,500);
      mysprites[60].x=0;
    }
       mysprites[60].x+=8;
       mysprites[61].render();
    if (mysprites[61].x>500)
    {
      mysprites[61].y=random(10,500);
      mysprites[61].x=0;
    }
       mysprites[61].x+=8;
       mysprites[62].render();
    if (mysprites[62].x>500)
    {
      mysprites[62].y=random(10,500);
      mysprites[62].x=0;
    }
       mysprites[62].x+=8; */
      
//x.random 63-99 37
/*mysprites[63].render();
    if (mysprites[63].y>500)
    {
      mysprites[63].x=random(10,500);
      mysprites[63].y=0;
    }
       mysprites[63].y+=8;
       mysprites[64].render();
    if (mysprites[64].y>500)
    {
      mysprites[64].x=random(10,500);
      mysprites[64].y=0;
    }
       mysprites[64].y+=8;
       mysprites[65].render();
    if (mysprites[65].y>500)
    {
      mysprites[65].x=random(10,500);
      mysprites[65].y=0;
    }
       mysprites[65].y+=8;
       mysprites[66].render();
    if (mysprites[66].y>500)
    {
      mysprites[66].x=random(10,500);
      mysprites[66].y=0;
    }
       mysprites[66].y+=8;
       mysprites[67].render();
    if (mysprites[67].y>500)
    {
      mysprites[67].x=random(10,500);
      mysprites[67].y=0;
    }
       mysprites[67].y+=8;
       mysprites[68].render();
    if (mysprites[68].y>500)
    {
      mysprites[68].x=random(10,500);
      mysprites[68].y=0;
    }
       mysprites[68].y+=8;
       mysprites[69].render();
    if (mysprites[69].y>500)
    {
      mysprites[69].x=random(10,500);
      mysprites[69].y=0;
    }
       mysprites[69].y+=8;
       mysprites[70].render();
    if (mysprites[70].y>500)
    {
      mysprites[70].x=random(10,500);
      mysprites[70].y=0;
    }
       mysprites[70].y+=8;
       mysprites[71].render();
    if (mysprites[71].y>500)
    {
      mysprites[71].x=random(10,500);
      mysprites[71].y=0;
    }
       mysprites[71].y+=8;
       mysprites[72].render();
    if (mysprites[72].y>500)
    {
      mysprites[72].x=random(10,500);
      mysprites[72].y=0;
    }
       mysprites[72].y+=8;
       mysprites[73].render();
    if (mysprites[73].y>500)
    {
      mysprites[73].x=random(10,500);
      mysprites[73].y=0;
    }
       mysprites[73].y+=8;
       mysprites[74].render();
    if (mysprites[74].y>500)
    {
      mysprites[74].x=random(10,500);
      mysprites[74].y=0;
    }
       mysprites[74].y+=8;
       mysprites[75].render();
    if (mysprites[75].y>500)
    {
      mysprites[75].x=random(10,500);
      mysprites[75].y=0;
    }
       mysprites[75].y+=8;
       mysprites[76].render();
    if (mysprites[76].y>500)
    {
      mysprites[76].x=random(10,500);
      mysprites[76].y=0;
    }
       mysprites[76].y+=8;
       mysprites[77].render();
    if (mysprites[77].y>500)
    {
      mysprites[77].x=random(10,500);
      mysprites[77].y=0;
    }
       mysprites[77].y+=8;
       mysprites[78].render();
    if (mysprites[78].y>500)
    {
      mysprites[78].x=random(10,500);
      mysprites[78].y=0;
    }
       mysprites[78].y+=8;
       mysprites[79].render();
    if (mysprites[79].y>500)
    {
      mysprites[79].x=random(10,500);
      mysprites[79].y=0;
    }
       mysprites[79].y+=8;
       mysprites[80].render();
    if (mysprites[80].y>500)
    {
      mysprites[80].x=random(10,500);
      mysprites[80].y=0;
    }
       mysprites[80].y+=8;
       mysprites[81].render();
    if (mysprites[81].y>500)
    {
      mysprites[81].x=random(10,500);
      mysprites[81].y=0;
    }
       mysprites[81].y+=8;
       mysprites[82].render();
    if (mysprites[82].y>500)
    {
      mysprites[82].x=random(10,500);
      mysprites[82].y=0;
    }
       mysprites[82].y+=8;
       mysprites[83].render();
    if (mysprites[83].y>500)
    {
      mysprites[83].x=random(10,500);
      mysprites[83].y=0;
    }
       mysprites[83].y+=8;
       mysprites[84].render();
    if (mysprites[84].y>500)
    {
      mysprites[84].x=random(10,500);
      mysprites[84].y=0;
    }
       mysprites[84].y+=8;
       mysprites[85].render();
    if (mysprites[85].y>500)
    {
      mysprites[85].x=random(10,500);
      mysprites[85].y=0;
    }
       mysprites[85].y+=8;
       mysprites[86].render();
    if (mysprites[86].y>500)
    {
      mysprites[86].x=random(10,500);
      mysprites[86].y=0;
    }
       mysprites[86].y+=8;
       mysprites[87].render();
    if (mysprites[87].y>500)
    {
      mysprites[87].x=random(10,500);
      mysprites[87].y=0;
    }
       mysprites[87].y+=8;
       mysprites[88].render();
    if (mysprites[88].y>500)
    {
      mysprites[88].x=random(10,500);
      mysprites[88].y=0;
    }
       mysprites[88].y+=8;
       mysprites[89].render();
    if (mysprites[89].y>500)
    {
      mysprites[89].x=random(10,500);
      mysprites[89].y=0;
    }
       mysprites[89].y+=8;
       mysprites[90].render();
    if (mysprites[90].y>500)
    {
      mysprites[90].x=random(10,500);
      mysprites[90].y=0;
    }
       mysprites[90].y+=8;
       mysprites[91].render();
    if (mysprites[91].y>500)
    {
      mysprites[91].x=random(10,500);
      mysprites[91].y=0;
    }
       mysprites[91].y+=8;
       mysprites[92].render();
    if (mysprites[92].y>500)
    {
      mysprites[92].x=random(10,500);
      mysprites[92].y=0;
    }
       mysprites[92].y+=8;
       mysprites[93].render();
    if (mysprites[93].y>500)
    {
      mysprites[93].x=random(10,500);
      mysprites[93].y=0;
    }
       mysprites[93].y+=8;
       mysprites[94].render();
    if (mysprites[94].y>500)
    {
      mysprites[94].x=random(10,500);
      mysprites[94].y=0;
    }
       mysprites[94].y+=8;
       mysprites[95].render();
    if (mysprites[95].y>500)
    {
      mysprites[95].x=random(10,500);
      mysprites[95].y=0;
    }
       mysprites[95].y+=8;
       mysprites[96].render();
    if (mysprites[96].y>500)
    {
      mysprites[96].x=random(10,500);
      mysprites[96].y=0;
    }
       mysprites[96].y+=8;
       mysprites[97].render();
    if (mysprites[97].y>500)
    {
      mysprites[97].x=random(10,500);
      mysprites[97].y=0;
    }
       mysprites[97].y+=8;
       mysprites[98].render();
    if (mysprites[98].y>500)
    {
      mysprites[98].x=random(10,500);
      mysprites[98].y=0;
    }
       mysprites[98].y+=8;
       mysprites[99].render();
    if (mysprites[99].y>500)
    {
      mysprites[99].x=random(10,500);
      mysprites[99].y=0;
    }
       mysprites[99].y+=8;
       */ 
       


