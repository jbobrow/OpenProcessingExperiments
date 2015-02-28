
float x=0;
float speed=9;

void setup(){
size(400,400);
}

void draw(){
frameRate(30);
colorMode(HSB,360,100,100);
road();
car(x,150);
noStroke();
fill(60,100,100);
ellipse(350,50,40,40);
//speed=speed*1.5;
x=x+speed;
if ((x>=height)||(x<0)){
    speed=speed*-1;
}
}

void road() {
background(120,60,60);
noStroke();
fill(200,85,73);
rect(0,0,400,200);
fill(0);
rect(0,220, 400,130);
strokeWeight(5);
stroke(50,100,100);
line(0,275,400,275);
line(0,290,400,290);
}

void car(float a, float b) {
noStroke();
fill(350,100,100);
rect(a,b+50,100,40);
rect(a+30,b+30,40,20);
triangle(a+70,b+30, a+100, b+50, a+70,b+50);
stroke(0);
strokeWeight(5);
fill(30,100,100);
ellipse(a+20,b+90, 25,25);
ellipse(a+70,b+90, 25,25);

}

