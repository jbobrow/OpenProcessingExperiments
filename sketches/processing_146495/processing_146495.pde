
int hue = 0;
int sat = 99;
int brite = 0;
int brush = 0;
int X2 = 0;
int Y2 = 0;
boolean srce = true;
boolean dest = true;
int s1 = 0;
int s2 = 0;
int s3 = 0;
int s4 = 0;
int d1 = 0;
int d2 = 0;
int d3 = 0;
int d4 = 0;
float banana = 0;
// float banana is from my last project

void setup(){
colorMode(HSB, 360, 100, 100);
size(600,800);
background(0,0,99);
}

void draw()
{
if(keyPressed)
{
if(key == '1')
{
brush = 0;
}
else if(key == '2')
{
brush = 1;
}
else if(key == '3')
{
brush = 2;
}
if((key == 'R' || key == 'r') && hue < 360)
{
hue++;
}
else if((key == 'F' || key == 'f') && hue > -1)
{
hue--;
}
if((key == 'D' || key == 'd') && sat < 100)
{
sat++;
}
else if((key == 'A' || key == 'a') && sat > -1)
{
sat--;
}
if((key == 'W' || key == 'w') && brite < 100)
{
brite++;
}
else if((key == 'S' || key == 's') && brite > -1)
{
brite--;
}
}
stroke(hue, sat, brite);
fill(hue, sat, brite);
rect(10,10,10,10);
if(mouseButton == LEFT)
{
if(brush == 0)
{
line(mouseX,mouseY,pmouseX,pmouseY);
}
else if(brush == 1)
{
line(mouseX,mouseY,X2,Y2);
}
else if(brush == 2)
{
if(mouseButton == LEFT)
{
banana += 1;
rotate(banana);
rect(mouseX,mouseY,55,55);
d1 = mouseX;
d2 = mouseY;
dest = false;
}
else if(dest ==false)
{
d3 = mouseX;
d4 = mouseY;
blend(s1,s2,(s3-s1),(s4-s2),d1,d2,(d3-d1),(d4-d2),ADD);
dest = true;
}
}
}
else if (mouseButton == RIGHT)
{
if(brush == 1)
{
X2 = mouseX;
Y2 = mouseY; 
}
else if(brush == 2 && srce == true)
{
s1 = mouseX;
s2 = mouseY; 
srce = false;
}
else if(brush == 2 && srce == false)
{
s3 = mouseX;
s4 = mouseY; 
srce = true;
}
}

}


