
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


stroke(10, random(100), random(200));

bezier  (150, 150, 10, waveY+70, 90, 110, 0, 150);//wave2
bezier(300, 150, 160, waveY+70, 240, 110, 150, 150);//wave2
bezier(450, 150, 310, waveY+70, 390, 110, 300, 150);//wave2
bezier(600, 150, 460, waveY+70, 540, 110, 450, 150);//wave2

stroke(10, random(100), random(200));

bezier  (150, 220, 10, waveY+140, 90, 180, 0, 220);//wave3
bezier(300, 220, 160, waveY+140, 240, 180, 150, 220);//wave3
bezier(450, 220, 310, waveY+140, 390, 180, 300, 220);//wave3
bezier(600, 220, 460, waveY+140, 540, 180, 450, 220);//wave3

stroke(10, random(100), random(200));

bezier  (150, 290, 10, waveY+210, 90, 250, 0, 290);//wave4
bezier(300, 290, 160, waveY+210, 240, 250, 150, 290);//wave4
bezier(450, 290, 310, waveY+210, 390, 250, 300, 290);//wave4
bezier(600, 290, 460, waveY+210, 540, 250, 450, 290);//wave4

stroke(10, random(100), random(200));

bezier  (150, 360, 10, waveY+280, 90, 320, 0, 360);//wave4
bezier(300, 360, 160, waveY+280, 240, 320, 150, 360);//wave4
bezier(450, 360, 310, waveY+280, 390, 320, 300, 360);//wave4
bezier(600, 360, 460, waveY+280, 540, 320, 450, 360);//wave4



if(waveY >= height-80 || waveY <= 0)


{
  waveDir = -waveDir;
}

waveY = waveY+waveDir;


}
