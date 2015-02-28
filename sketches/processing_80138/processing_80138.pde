



size(800,900);

background(0);
noStroke();

for(int a = 0;a<=width;a+=10){
for(int b=0;b <=height;b+=20){
noFill();
stroke(random (50,155),150);
stroke (random (50,255), random (50,255), random (50,255),100);
line(a, b , 1100,1200);
stroke(random (50,255), random (50,255), random (50,255));
ellipse(a,b,10,10);
}
}


