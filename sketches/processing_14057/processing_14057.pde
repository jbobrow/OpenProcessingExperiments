
 float xPos = 20;
float speed = 5;
float yPos = 20;
float yspeed = 5;

void setup(){
size(300,300);
stroke(150)
}

void draw (){
//nothings happens in draw().



xPos = xPos + speed;
yPos = yPos + yspeed;
background(0);
rect(xPos,yPos,100,100);
if(xPos>200) {speed = - speed;}

if(xPos<0){
speed=10;
}

if(yPos>200){
yspeed = -yspeed}

if(yPos<20){
yspeed =5 }


}


                
                
