


size(1000,800);

background(0);
noStroke();

for(int a = 0;a<=width;a+=50){
for(int b=0;b <=height;b+=100){
noFill();
strokeWeight(random (1,10));
stroke(random (0,70));
line(a, b , 1200,400);
fill (10, 115,20,50);
rect(a,b,200,80);
noFill();
rect (a,b,800,200);
}
}


