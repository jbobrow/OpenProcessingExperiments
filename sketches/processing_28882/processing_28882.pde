
float x;
float y =100;
float xspeed= +5;
float yspeed= 5;

void setup(){
size (500,500);
background(0);
x=0;
y=0;
}

void draw(){
  

if (x>=480){
xspeed=-3;

}
if(x<=20){
xspeed=+3;

}
if (y>=480){
yspeed=-10;

}
if(y<=20) {
yspeed=+10;
}


x=x+xspeed;
y=y+yspeed;
fill(x,y,20);
ellipse(x,y,40,40);
}

                
                
