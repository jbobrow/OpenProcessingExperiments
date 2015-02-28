
float x = 0;
float y = 0;
float eyeR;
float eyeG;
float eyeB;
void setup() {
  background(200);
size(500,500);
}
void draw(){
stroke(20,20,20);
fill(eyeR+200,0,0);
ellipse(x+250,y+100,100,100);
fill(eyeG+0,200,0);
ellipse(x+220,y+100,30,50);
fill(eyeG+0,200,0);
ellipse(x+280,y+100,30,50);
fill(eyeB+0,100,80);
rect(x+210,y+150,80,100);
fill(60,60,60);
ellipse(x+220,y+265,50,30);
ellipse(x+280,y+265,50,30);
x = random(20,60);
y = random(60,60);
eyeR = random(0,120);
eyeG = random(0,256);
eyeB = random(0,256);
}


