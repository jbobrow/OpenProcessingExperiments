
size(800,600); 
smooth();
background(0);



for (int i=0; i<100000; i=i+1){
float redSize = random (10);
noStroke();
fill (random(255),0,0);
ellipse(random (width), random (height), redSize, redSize);
}
for (int i=0; i<2500; i=i+1){
float greenSize = random (15);
noStroke();
fill (255);
ellipse(random (width), random (250,350), greenSize, greenSize);
}

for (int i=0; i<1000; i=i+1){
float blueSize = random (20);
noStroke();
fill (255);
ellipse(random (200,300), random (height), blueSize, blueSize);
}

saveFrame("danish_flag.jpg");

