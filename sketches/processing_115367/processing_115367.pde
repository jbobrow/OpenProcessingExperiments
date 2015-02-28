
size(400,400);
background(255);

for(int i=0; i<400; i+=10){
fill(i,i*2,i*3);
rectMode(CENTER);
noStroke();
rect(10,i*2,10,10);
}

for(int i=0; i<400; i+=10){
fill(i*2,i,i*3);
rectMode(CENTER);
noStroke();
rect(30,i*2,10,10);
}

for(int i=0; i<400; i+=10){
fill(i*2,i*3,i);
rectMode(CENTER);
noStroke();
rect(50,i*2,10,10);
}

for(int i=0; i<400; i+=10){
fill(i,i,i);
rectMode(CENTER);
noStroke();
rect(70,i*2,10,10);
}
