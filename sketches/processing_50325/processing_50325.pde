
size(800,800);
noFill();
smooth();
for(int i=0; i<width; i+=30){
  for(int j=0; j<height; j+=30){
    strokeWeight(random(20));
    stroke(random(255),random(255),1);
    arc(random(800), random(800), random(800),random(800), radians(45), radians(170));
    arc(random(800), random(800), random(800),random(800), radians(10), radians(90));

    strokeWeight(random(20));
    stroke(0,0,random(255));
    arc(random(800), random(800), random(800),random(800), radians(180), radians(300));
    arc(random(800),random(800),random(800),random(800), radians(15), radians(270));
  }
}

