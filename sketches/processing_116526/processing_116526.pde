
int[] x = new int[200];
int[] y = new int[200];

void setup(){
  size(1200,800);
  background(255);
  //noStroke();
 for(int i =0; i < 200; i ++){
   x[i] = i*4;
   y[i] = i;
}
println(x);
}

void draw() {
  background(255);
   for (int i =0 ; i < 200; i++){
     x[i] = i*(mouseX/15);
      x[i] = i*(mouseY/40);
   y[i] = i;
    noFill();
ellipse(x[i],y[i],mouseY,i);
//line(y[i],x[i],mouseY,mouseX);
rect(30,y[i],mouseX,i);
fill(0);
text("ShitStained",y[i]*2,x[i]*2);
 }
 }


