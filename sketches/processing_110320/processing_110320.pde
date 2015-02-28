
int posX=0;
int posY=0;
int speedX=50;
int speedY=4;

void setup() {
size (500,500);
}

void draw(){
background(180,179,162);

posX=posX+speedX;
posY=posY+speedY;

if(posX>width){
speedX=speedX*-1;
}

if(posX<0){
speedX=speedX*-1;
}

if(posY>height){
speedY=speedY*-1;
}

if(posY<0){
speedY=speedY*-1;
}

noStroke();
fill(0);
ellipse(posX,posY,30,30);
fill(95,95,95);
ellipse(posX+100,posY,30,30);
fill(79,82,79);
ellipse(posX+350,posY,30,30);
fill(254,240,0);
ellipse(posX,posY+100,50,50);
fill(252,63,46);
ellipse(posX+100, posY+100,50,50);
fill(57,109,237);
ellipse(posX+237,posY+100,50,50);
fill(123,126,122);
ellipse(posX,posY+200,30,30);
fill(173,173,173)
ellipse(posX+100,posY+200,30,30);
fill(137,137,137);
ellipse(posX+350, posY+200,30,30);
fill(240,240,240);
ellipse(posX+230,posY+200,30,30);

}
