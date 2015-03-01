


int eSize =5;

size(400,400);
colorMode(RGB,255);
background(240);
noStroke();
fill(255,0,0);

for(int y = 0; y <=199; y +=6) {//1
for(int x = 0; x <= 199; x += 6) {// <= de maruga saigomade iku
  fill(x,400,18,200);
 rect(x, y, eSize, eSize);
 }
}


for(int y = 0; y <=199; y +=6) {//2 ystart,end,xstart,end
for(int x = 200; x <= 400; x += 6) {
  fill(180,x-100,x,x);
 rect(x, y, eSize, eSize);
 }
}

for(int y = 200; y <=400; y +=6) {//3
for(int x = 0; x <= 199; x += 6) {
  fill(400,x,18,230);
 rect(x, y, eSize, eSize);
 }
}


for(int y = 200; y <=400; y +=6) {//4
for(int x = 200; x <= 400; x += 6) {
  fill(x,x-200,150,x);
 rect(x, y, eSize, eSize);
 }
}

noStroke(); //dekkairect
fill(255,255,255,80);
rectMode(CENTER);
rect(200,200,350,350);

for(int x = 0; x <=400; x +=1) {
strokeWeight(1);
stroke(051,222,237,40);//221,138,252,70
line(x,0,0,250);//hidariue
stroke(221,138,252,40);//051,222,237,70
line(x,0,400,250);//migiue
stroke(181,252,139,50);//181,252,139,70
line(x,400,0,150);//hidarishita
stroke(252,138,176,50);//252,138,176,70
line(x,400,400,150);//migisita
}


