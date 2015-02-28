
int waveY = 1;
int waveDir = 3;

void setup()
{
size(600,400);
//frameRate(20);
}

void draw()

{
 background(0,0,15);
noFill();

strokeWeight(10);
stroke(10, random(100), random(200));
color(10, 10,random(255));



noFill();

bezier(150, 80, 10, waveY, 90, 40, 0, 80);//wave1
bezier(300, 80, 160, waveY, 240, 40, 150, 80);//wave1
bezier(450, 80, 310, waveY, 390, 40, 300, 80);//wave1
bezier(600, 80, 460, waveY, 540, 40, 450, 80);//wave1

if(waveY >= height-100 || waveY <= 0)
{
  waveDir = -waveDir;
}

waveY = waveY+waveDir;


}

