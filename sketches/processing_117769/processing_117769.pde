
//20131023 processing lesson -HorusWang
//Randomness&noise;
void setup(){
size(500,100);
noiseSeed(10);
stroke(0,10);

}


void draw(){
background(255);
strokeWeight(3);
stroke(20, 30, 50);
float nlevel = 0.1;
float xstep = 20;
float ystep = 0;
float lastx = 30;
float lasty = 50;
float ynoise = random(20);
float y ;
int border = 30;
for (int x=border; x<=width-border;x+=xstep) {
y = 10+noise(ynoise)*100;
y += ystep;
stroke(x,y,x+y);
line(x, y, lastx, lasty);
lastx = x;
lasty = y;
ynoise += nlevel;
}


}


