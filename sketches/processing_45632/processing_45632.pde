
//author:robertlun,ncku arch  
//purpose: practice on class  
//concept: the color and figure will change each time
//reference: from teacher

void setup() {
size(300,300);
smooth();
background(0);
float xstart = random(10);
float xnoise = xstart;
float ynoise = random(10);
for (int y = 0; y <= height; y +=1) {
ynoise += 0.01;
xnoise = xstart;
for (int x = 0; x <= width; x += 1) {
xnoise += 0.01;

int alph = int(noise(xnoise, ynoise) * 255);
int alph1 = int(noise(xnoise, ynoise) * 255*xnoise);
int alph2 = int(noise(xnoise, ynoise) * 255*ynoise);
int alph3 = int(noise(xnoise, ynoise) * 100*xnoise);

stroke(alph1,alph2,alph3,alph);
line(x,y, x+1,y+1);
}
}
}

