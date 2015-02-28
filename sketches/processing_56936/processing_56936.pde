

void setup()
{
size(300,484);
}

color skin = color(255,255,177);
boolean LeftArmState=true;
boolean RightArmState=false;
int y;
void draw()
{
rectMode(CORNERS);
fill(150,150,150);
rect(0,0,300,484);
fill(0,255,0);
rect(0,375,300,484); //grass
line(150,150+y,150,300+y); //center body
ellipseMode(CENTER);
fill(skin);
ellipse(150,160+y,70,70); //face
fill(0,0,0);
arc(150,167+y,40,30,0,PI); //mouth
fill(255,255,255);
ellipse(135,150+y,13,13); //eye left
ellipse(165,150+y,13,13); //eye right
fill(0,0,0);
ellipse(135,150+y,5,5); //pupil left
ellipse(165,150+y,5,5); //pupil right

if (LeftArmState)
line(150,210+y,100,175+y);
else
line(150,210+y,100,245+y);

if (RightArmState)
line(150,210+y,200,175+y); 
else
line(150,210+y,200,245+y); 

line(150,300+y,130,400+y); //leg left
line(150,300+y,170,400+y); //leg right
}
void mouseClicked()
{
if (mouseX > 150)
RightArmState = !RightArmState;
else
LeftArmState = !LeftArmState;
rectMode(CORNERS);
fill(0,0,0);
redraw();
}


