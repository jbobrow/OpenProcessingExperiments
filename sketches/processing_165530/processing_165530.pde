

float i,r,a,t;
void setup(){
size(400,400);
}

void draw(){
  background (0);
  stroke(22,187,250,180);
  strokeWeight (2);

for (i=0;i++<400;
a=noise(i/64)*9+t,
point(200+cos(a)*r,200+sin(a)*r/2))r=abs(noise(i)-.2)*mouseX;
t+=0.7;
r+=0.3;
for (i=0;i++<200;
a=noise(i/4)*.33+t/r,
point(200+cos(a)*r,200+sin(a)*r/2.5))r=abs(noise(i)-.4)*mouseX;
t+=0.4;
for (i=0;i++<230;
a=noise(i/31)*9+t/r,
point(200+cos(a)*r*0.89,200+sin(a)*r/1.8))r=abs(noise(i)-.2)*mouseX;
t+=.32;
r+=.3;
for (i=0;i++<250;
a=noise(i/22)*9+t/r,
point(200+cos(a)*r*0.89,200+sin(a)*r/3.2))r=abs(noise(i)-.2)*mouseX;
t+=.32;
r+=.9;
for (i=0;i++<255;
a=noise(i/89)*9+t/r,
point(200+cos(a)*r*0.89,200+sin(a)*r/.3))r=abs(noise(i)-.2)*mouseX;
t+=.32;
r+=.9;
for (i=0;i++<250;
a=noise(i/22)*9+t/r,
point(200+cos(a)*r*0.89,200+sin(a)*r/.8))r=abs(noise(i)-.2)*mouseX;
t+=.22;
r+=.8;
for (i=0;i++<255;
a=noise(i/89)*9+t/r,
point(200+cos(a)*r*0.89,200+sin(a)*r/8.3))r=abs(noise(i)-.2)*mouseY;
t+=.12;
r+=.9;
for (i=0;i++<250;
a=noise(i/22)*9+t/r,
point(200+cos(a)*r*0.89,200+sin(a)*r/2.3))r=abs(noise(i)-.2)*mouseY;
t+=.55;
r+=.9;

}
