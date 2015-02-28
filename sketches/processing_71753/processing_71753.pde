
int x;
int y;

float d = 50;

void setup(){
size(screen.width,screen.height);
background(255);
frameRate(15);
}

void draw(){

d = random(50,150);
noStroke();
smooth();
fill(random(0,255),random(0,255), random(0,255),random(0,255));
ellipseMode(CENTER);
ellipse(random(0,width),random(0,height),d,d);

}
