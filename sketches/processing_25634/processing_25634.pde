
size (800,600);
background(0);
smooth();


for (int i=0; i<5000; i=i+1){
stroke(255,random(255),random(255),random(255));
strokeWeight(random(25));
line(random(width),random(height),random(width),random(height));
}

