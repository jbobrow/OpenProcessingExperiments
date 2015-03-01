

int eflag = 0, ex, ey;
int point = 0;
int num;
int width=600;
int height=700;
int flag = 10;

void setup()
{
size(600,700);
colorMode(RGB, 256);
smooth();
textSize(24*2);
textAlign(CENTER);
}

void draw()
{
if(flag == 10)
{
fact();
fill(256, 0, 0);
text("Press ENTER KEY", width/2, height/2);
flag = 0;
}
if(flag == 1)
{
fact();
enemy();
mainDraw();
check();
}
if(flag == 0)
{
if(keyCode == ENTER)
{
flag = 1;
keyCode = UP;
}
}
}

void fact()
{
fill(256, 256, 256);
rect(0, 0, width, height);
}

void enemy()
{
if(eflag == 0)
{
eflag = 1;
ex = (int)random(width);
ey = 0;
}
if(eflag == 1)
{
ey += 30;
if(ey > height)
{
eflag = 0;
point ++;
}
}
}

void mainDraw()
{
fill(#4A84E5);
ellipse(mouseX, height-50, 40, 40);
fill(256, 0, 0);
ellipse(ex, ey, 5, 5);
}

void check()
{
num = abs(ex - mouseX) * abs(ex - mouseX) + abs((height-50) - ey) * abs((height-50) - ey);
if(num < 2025)over();
}

void over()
{
fact();
fill(256, 0, 0);
flag = 0;
text("GAME OVER", width/2, 87);
text("score=" + point, width/2, 113+24);
textSize(24);
fill(0,0,200);
//text(“Press ENTER KEY\n to play again”,width/2,height/2+24);
point = 0;
eflag = 0;
}


