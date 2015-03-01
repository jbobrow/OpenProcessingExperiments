
size(600,600);
colorMode(HSB);
for (int i=0; i<width; i=i+15) {
println(i);
fill(i/3,255,255);
ellipse(300,300,width-i,width-i);
}


