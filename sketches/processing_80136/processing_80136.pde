


size(1000,800);

background(0);
noStroke();

for(int a = 0;a<=width;a+=200){
for(int b=0;b <=height;b+=200){
noFill();
strokeWeight(40);
stroke(random (10,250),random(50,200),random(200,250),70);
ellipse(a,b,500,500);
}
}


