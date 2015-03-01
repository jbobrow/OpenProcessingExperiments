
void setup() {  //setup function called initially, only once
  size(300, 250);
}
int i=0;

void draw() {  //draw function loops 
  background(245,160,240);
    fill(random(255),255,40,148);
    cuadrados(i,125,30,30);
     fill(random(74,245,65));
     cuadrados(30,30,30,200);
     fill(random(74,245,65));
     cuadrados(250,30,30,200);
     i=i+1;
     if (i>=250){
       i=0;
     }
}
void cuadrados(int x, int y, int a, int h){
   rect(x,y,a,h);
}
