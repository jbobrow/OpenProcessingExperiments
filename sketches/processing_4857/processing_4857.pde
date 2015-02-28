
size(200,200);
float frecuencia = 50;
float amplitud = 50;
float a = 0.0;
float inc = PI/frecuencia;
background(66,252,248);
strokeWeight(2);
for(int i=0; i<200; i=i+4) {
  stroke(255,i,0);
  line(i, width/2, i, width/2 + sin(PI/frecuencia*i) * amplitud);
}



