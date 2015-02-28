
void setup(){
size(500,500);
background(random(0,255),random(0,255),random(0,255));
frameRate(10);
}
void draw(){
stroke(0,0,255);
fill(random(0,255),random(0,255),random(0,255));
ellipse(random(0,500),random(0,500),50,50);
stroke(255,0,0);
fill(random(0,255),random(0,255),random(0,255));
rect(random(0,500),random(0,500),20,50);
stroke(0,255,0);
fill(random(0,255),random(0,255),random(0,255));
rect(random(0,500),random(0,500),30,30);

}
