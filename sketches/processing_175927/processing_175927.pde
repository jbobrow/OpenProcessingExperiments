
int BodyX = 200;
int BodyY = 240;
int LegAAX = 225;
int LegAAY = 290;
int LegABX = 265;
int LegABY = 320;
int LegBAX = 175;
int LegBAY = 290;
int LegBBX = 135;
int LegBBY = 320;
int HeadX = 200;
int HeadY = 145;
int EyeAX = 230;
int EyeAY = 145;
int EyeBX = 170;
int EyeBY = 145;
float EyeColorA = (255);
float EyeColorB = (255);
float EyeColorC = (255);

void setup() {
  size (400,400); //Make a 400 Pixel Background
  background(#F20733); //Fill it with a sky blue color (#8BDAED)
}

void draw() {
fill(230,230,230);  
background(#F20733);
rectMode(CENTER);
rect(BodyX,BodyY,50,100);//Body
line(LegAAX,LegAAY,LegABX,LegABY);//LegB
line(LegBAX,LegBAY,LegBBX,LegBBY);//LegA
fill(255,255,255);
ellipseMode(CENTER);
ellipse(HeadX,HeadY,110,80);//Head
fill(EyeColorA,EyeColorB,EyeColorC);
ellipseMode(CENTER);
ellipse(EyeAX,EyeAY,25,45);//EyeB
ellipseMode(CENTER);
ellipse(EyeBX,EyeBY,25,45);//EyeA


BodyY = BodyY - 1;
LegAAY = LegAAY - 1;
LegABY = LegABY - 1;
LegBAY = LegBAY - 1;
LegBBY = LegBBY - 1;
HeadY = HeadY - 1;
EyeAY = EyeAY - 1;
EyeBY = EyeBY - 1;

EyeColorA = (255);
EyeColorB = (255);
EyeColorC = (255);
}
