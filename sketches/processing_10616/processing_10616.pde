
size(800, 800);
color (HSB);
noStroke();
smooth();
float[] coswave = new float[width];

for (int i = 0; i < width; i++) {
  float amount = map(i, 0, width, 0, PI);
  coswave[i] = abs(cos(amount));
}



  
for (int i = 0; i < width; i++) {
fill(coswave[i]*150,150,150);
ellipse (i, 0, i, 800);
ellipse (i,100,i,800);
ellipse (i,800,i,800);
ellipse (800,i,400,i);

ellipse (i,600,i,300);
ellipse (200,i,500,i);

}






