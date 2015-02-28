
float X = 1;
float Y = 1;
float Fillah = 10;
float change = 10;
float strokeChange = 20;
float eyeR;
float eyeG;
float eyeB;
void setup(){
size(400,400);
background(0);
frameRate(120);

}

void draw() {
stroke(strokeChange);
fill(Fillah+20,50,15);
rect(X+80,Y+50,20,80);
fill(Fillah+255,0,0);
ellipse(X+90,Y+40,40,40);
line(X+80,Y+130,X+60,Y+180);
line(X+100,Y+130,X+120,Y+180);
fill(eyeR,eyeG,eyeB); 
ellipse(X+100,Y+38,8,30);
ellipse(X+80,Y+38,8,30);
X = X + 1;
Y = Y + 1;
Fillah = Fillah + change;
strokeChange = strokeChange + change;
eyeR = random(1,255);
eyeG = random(1,255);
eyeB = random(1,255);
X = random(-10,10);
Y = random(-10,10);
}

