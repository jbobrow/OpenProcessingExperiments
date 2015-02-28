
//Reforço 6
//Giovanna DallaCruz
size(200,200);
for(int x=20;x<250;x+=60)
{  for(int y=10;y<200;y+=50){
    line(x,y,x+30,y);
    line(x-13,y+10,x-13,y+35);
    if(x>=20&&x<=80&&y==10){
      fill(255,0,0);
      ellipse(x-13,y,5,5);
    }
    else{
      fill(255);
      ellipse(x-13,y,5,5);
    }
  }
}
