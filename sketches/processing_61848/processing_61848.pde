
//Write a function to draw a shape to the screen multiple times, 
//each at a different position.

int x=50;

void setup() {
size(400,400);
colorMode(HSB,360,100,100);

background(188,65,92);
noStroke();
fill(100,100,100);
rect(100,100,100,100);
fill(150,100,100);
rect(0,0,200,200);

}
void draw(){
float r=random(400);
float s=random(20,350);
float q=random(.1,8);
float c=random(1,360);
car(r,s,q,c);
}


void car(float x, float y, float a, float c) {
//noStroke();

fill(c,100,100);
scale(a);
rect(x,y+50,100,40);
fill(c+125,100,100);
rect(x+30,y+30,40,20);
fill(c+100,100,100);
triangle(x+70,y+30, x+100, y+50, x+70,y+50);
stroke(0);
strokeWeight(5);
fill(c+30,100,100);
ellipse(x+20,y+90, 25,25);
ellipse(x+70,y+90, 25,25);

}


