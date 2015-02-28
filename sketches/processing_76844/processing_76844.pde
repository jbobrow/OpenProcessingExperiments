
int count = 4;
float[] xpos;
float[] ypos;
float[] speed;
void setup()
{
size(500, 500);
background(255);

xpos = new float[count];
ypos = new float[count];
speed = new float[count];

xpos[0] = 150;
ypos[0] = 250;
speed[0] = 0;

xpos[1] = 300;
ypos[1] = 320;
speed[1] = 0;

xpos[2] = 50;
ypos[2] = 300;
speed[2] = 0;

xpos[3] = 110;
ypos[3] = 375;
speed[3] = 0;
}
void draw()
{
background(255);
int i = 0;
while(i < count) {
speed[i] = speed[i] + 0.1;

if(ypos[i] > 500) {
speed[i] = speed[i] * -0.95;
}

ypos[i] = ypos[i] + speed[i];

rect(xpos[i], ypos[i], 25, 25);
i = i +1;
}
}
void mousePressed()
{
xpos = expand(xpos, count + 1);
ypos = expand(ypos, count + 1);
speed = expand(speed, count + 1);

xpos[count] = mouseX;
ypos[count] = mouseY;
speed[count] = 0;
count = count + 1;
}

