
int num;
float[] r = new float[10];
float[] g = new float[10];
float[] b = new float[10];

float[] r1 = new float[10];
float[] g1 = new float[10];
float[] b1 = new float[10];

void setup(){
size(800,100);
frameRate(10);
}
void draw (){
  noStroke();
  if (mousePressed){
     for (int i =0; i < r.length; i++){
    fill(r1[i],g1[i],b1[i]);
    rect(i*100, 0, 100, 100);
     }
}else {
  for (int i =0; i < r.length; i++){
  r[i]= random (255);
  g[i]= random(255);
  b[i]= random(255);
  r1[i] =  r[i];
  g1[i] = g[i];
  b1[i] = b[i];
  fill(r[i],g[i],b[i]);
  rect(i*100, 0, 100, 100);
}

}
}
