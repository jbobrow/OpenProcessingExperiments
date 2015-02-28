
size(250,250);
background(255);

int small=30;
int medium=70;
int large=140;

for(int i=0; i<500; i += 50){
  stroke(100);
  line(0,i,250,i);
}

for (int g=50; g<1000; g +=90){
fill(random(100),20);
  ellipse(random(255),random(255),small,small);
  ellipse(random(255),random(255),medium,medium);
  
   fill(random(255),random(255),random(255));
  ellipse(random(255),random(255),small-10,small-10);
}
