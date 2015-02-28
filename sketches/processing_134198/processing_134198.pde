
size(800,800);

noStroke();
background(random(255),random(255),random(255));

for(int i=50; i<751; i+=100){
for(int d=30; d<751; d+=100){
  fill(random(255),random(255),random(255));
arc(i,d,50,50,0,PI);
//line(i,d,i+100,d+100);
}
}

for(int i=100; i<751; i+=100){
for(int d=80; d<751; d+=200){
  fill(random(255),random(255),random(255));
arc(i,d,50,50,HALF_PI,PI);

}
}

for(int i=100; i<751; i+=100){
for(int d=80; d<751; d+=200){
  fill(random(255),random(255),random(255));
arc(i,d,50,50, 0, HALF_PI);
}
}


