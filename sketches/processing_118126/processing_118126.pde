
int eSize = 3;

size(510,510);
background(255,255,255);


for(int x = 0; x <=width; x +=10){
   stroke(x,255,255,127);
   line(x,0,x,height);
}

for(int x = 0; x <=width; x +=10){
   stroke(x,255,255,127);
   line(x,400,510-x,height);
}


for(int x = 0; x <=width; x +=10){
   stroke(x,255,255,127);
   line(x,400,510-x,height);
}

noStroke();
fill(255,0,0);
ellipse(100,50,10,10);

noStroke();
fill(255,0,0);
ellipse(80,30,5,5);

noStroke();
fill(255,0,0);
ellipse(350,330,15,15);

noStroke();
fill(255,0,0);
ellipse(420,340,10,10);

noStroke();
fill(255,0,0);
ellipse(440,300,5,5);

noStroke();
fill(255,0,0);
ellipse(344,325,5,5);





for(int x = 0; x <=width; x +=3){
   stroke(x,225,0,127);
   line(400-x,400-x,x,height);
}


for(int x = 0; x <=width; x +=3){
   stroke(x,225,0,127);
   line(100-x,100-x,x,height);
}

for(int x = 40; x <=width; x +=10){
   stroke(x,225,0,127);
   line(100-x,100-x,x,height);
}

for(int x = 100; x <=height; x +=50){
   stroke(x,225,0,127);
   line(100-x,100-x,x,width);
}








