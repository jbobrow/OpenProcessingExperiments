
size (600,200);

stroke(255,0,0);
for (int x=0; x<width; x++){
  float myPerlin = noise(float(x)/10);
  float myY = map(myPerlin,0,1,10,100);
  line(x,0,x,myY);
}

float y = noise(100);
println(y);


