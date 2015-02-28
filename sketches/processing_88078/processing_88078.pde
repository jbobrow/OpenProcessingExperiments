
float n;
size (500,500);
colorMode (HSB);
background (255);
for (int x=0; x<500; x++) { 
for (int y=0; y<500; y++) {
stroke(100,200,n*250);
n=noise(x/200,y/200);
if (noise(x/200,y/200)>.465) {stroke(140,100,256-(n*250));}
//if (random(2)>1) {stroke(255);}
point(x,y);
}
}
