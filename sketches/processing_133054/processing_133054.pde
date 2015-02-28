
// random
println(random(10));
println(random(-10,10));

// lets draw
size(600,600);
background(255);

for (int x = 0; x<width; x=x+1) {
  line(x,0,x,random(height));
}

stroke(255,0,0);
for (int x=0; x<width; x=x+1) {
  
  float myPerlin = noise(float(x)/100);
  float myY = map(myPerlin,0,1,10,x);
  line(x,0,x,myY);
}

