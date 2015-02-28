
float n;
size (500,500);
colorMode (HSB);
background (255);
for (int x=0; x<500; x++) { 
for (int y=0; y<500; y++) {

n=noise(x/200,y/200);
stroke(constrain((n-.35)*1000,0,360),200,250);
point(x,y);
}
}
