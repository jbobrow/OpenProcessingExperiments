
int COLOR = 5,
    coner = 0;

size(400,400);
colorMode(RGB,400);
background(400,400,400);

for(int x=0; x<=180; x +=5){
noStroke();

fill(COLOR,COLOR,COLOR,100);
triangle(0,400,400-coner,400-coner,350-coner,350-coner);//leftunder

fill(COLOR,COLOR,COLOR,100);
triangle(400,0,coner,coner,coner+50,coner+50);//rightover

fill(COLOR,COLOR,COLOR,100);
triangle(400,400,400-coner,coner,350-coner,coner+50);//rightunder

fill(COLOR,COLOR,COLOR,100);
triangle(0,0,coner,400-coner,coner+50,350-coner);//leftover
if (x>=85){
  COLOR = COLOR-25;
  }else{
  COLOR = COLOR+25;
  }
coner = coner+7;
}


