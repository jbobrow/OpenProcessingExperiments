
void setup() {  //setup function called initially, only once
  size(250, 250);
}
int i=0;

void draw() {  //draw function loops 
  background(255);
    fill(random(255),180,180,180);
    cuadrados(i,125,30,30);
     fill(random(255),255,40,148);
     cuadrados(50,30,30,200);
      fill(random(255),255,40,148);
     cuadrados(170,30,30,200);
     i=i+1;
     if (i>=250){
       i=0;
     }
}
void cuadrados(int x, int y, int a, int h){
   rect(x,y,a,h);
}
