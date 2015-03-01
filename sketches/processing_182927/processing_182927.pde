
size(300,550); 
background(255); 
float x = random(255); 
smooth();
stroke(200);
for(int a=0;a<500;a=a+10){
for(int b=30;b<600;b=b+10){
line(a,b,b,a)
}
}
for(int i=0;i<400;i=i+100){
for(int z=0;z<440;z=z+60){
//fill(x,152,x+5);
fill(150,150,150,150);
stroke(255);
//ellipse(i,i,30,30)
//ellipse(z,z,40,40)
ellipse(i,z,20,20)
ellipse(z,i,30,30)
ellipse(z,60,40,40)
;
}
}
;
fill(150,0,0,140);
beginShape();
arc(150,450,55,55,PI, TWO_PI);
rect(147,450,5,40);
endShape();

