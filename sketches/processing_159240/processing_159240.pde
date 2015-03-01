
void setup() {  //setup function called initially, only once
  size(300,300);
  background(250);  //set background white
}
int i=0;
void draw () {
fill (30,123, 0)

background(250);
cuadrado (i, 150, 20, 20);
i= i+1;
if(i>=300){
i=0;
}
cuadrado (30, 30, 50, 240);
cuadrado (220, 30, 50, 240);


}

void cuadrado(int x, int y, int a, int h, int c) {  //draw function loops 

rect (x, y, a, h);
fill(198,73,5);
}
  
