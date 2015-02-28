
size(250,250);
background(0);


stroke(random(255));

for(int i=20; i<500; i +=5){
  stroke(random(255),random(255),random(255));
  strokeWeight(random(5));
    line(i,random(255),i,random(255));
    line(random(255),i,random(255),i);
}

