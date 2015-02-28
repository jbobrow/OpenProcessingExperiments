
size(500,800); 
smooth();
background(0);



for (int i=0; i<100000; i=i+1){
float redSize = random (10);
noStroke();
fill (random(255),0,0);
ellipse(random (width), random (height), redSize, redSize);
}

