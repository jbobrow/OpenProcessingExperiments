
size(400,300);
background(random(200),random(200),random(255),200);
smooth();
for (int i=0; i<width; i+=1){
  strokeWeight(random(3));
  stroke(random(i),random(i),random(i),random(20,200));
  line(0,0,random(i),random(i));
}
for (int i=0; i<width; i+=5){
strokeWeight(random(3));
stroke(random(i), random(255),random(i),random(50,233)); 
fill(random(i), random(255),random(i),random(50,233)); 
rect(random(width),random(height),random(90),random(98));
}
for(int i=0;i<width;i+=50){
  strokeWeight(random(3));
  stroke(random(i),  random(255),random(i),random(50,233));
  fill(random(i), random(255),random(i),random(50,233)); 
  ellipse(random(i),random(i),random(99),random(99));
}
for(int i=0; i<width; i+=30){
  stroke(random(i),random(255),random(i),random(50,233));
  line(random(width),random(height),99,99);
}

