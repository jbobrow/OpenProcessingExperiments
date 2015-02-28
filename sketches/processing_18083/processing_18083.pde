
size(250,250);

background(0);

for(int i=0; i<1000; i += 5){
  noFill();
  stroke(0,0,255);
  ellipse(i+random(250),i+random(250),i+20,i+20);
  stroke(200,150,55);
  rect(i+random(250),i+random(250),i+5,1+10);
}
