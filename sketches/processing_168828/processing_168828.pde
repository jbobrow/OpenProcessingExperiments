
int red = 400,
    green = 20,
    blue = 400,
    coner = 0;

size(400,400);
colorMode(RGB,400);
background(400,400,400);

for(int x=0; x<=140; x +=5){
noStroke();

fill(0,green,blue,80);
triangle(0,400,400-coner,400-coner,350-coner,350-coner);//leftunder

fill(0,green,blue,80);
triangle(400,0,coner,coner,coner+50,coner+50);//rightover

fill(red,green,0,80);
triangle(400,400,400-coner,coner,350-coner,coner+50);//rightunder

fill(red,green,0,80);
triangle(0,0,coner,400-coner,coner+50,350-coner);//leftover

coner = coner+7;
red = red-10;
green = green+20;
blue = blue-10;

}


