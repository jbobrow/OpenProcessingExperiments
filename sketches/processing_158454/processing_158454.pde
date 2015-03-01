
int s=0;
int g=10;
float[] y= new float [600];
float [] x  = new float [150];
float [] z  = new float [300];//tamaÃ�Â±o
float [] v = new float [700]; //velocidad
void setup () {
  colorMode(HSB);
  
  noStroke();
  size(500, 500);
  for (int p=0; p < x.length;p+=1) {//cantidad de bolitas
    z[p]=random(150);//cambia el tamaÃ�Â±o
    x[p]=random(width);
    y[p]=random(height);
    v[p]=random(60);//velocidad
  }
}
void draw () {
  background(0);
  s=s+g;
   if(s>150||s==0){
    g=g*-1;
    }
  for (int p=0; p < x.length;p+=10) {
    x[p]+=v[p];//velocidad
    x[p]+=10;//cantidad
    if (x[p]>width) {
      x[p]=0;
    }
    fill(s,150,255);
    rect(y[p], x[p], mouseX, mouseY);
  }
}

