
float [] Hx = new float [40];
float [] Hy = new float [40];
void setup(){
  size(500,500);
  background(0);
  smooth();
  colorMode(HSB,360,100,100,100);
  
 for (int i=0;i<Hx.length;i++){
   Hx[i]=random(500);
   Hy[i]=random(500);
  
 }
}

void draw(){
   for  (int i=0;i<Hx.length;i++){
     if(i<39){
        fill(100,i*3,i,i*3);
   noStroke();
   ellipse (Hx[i],Hy[i],30,30);
         stroke(255,i*3);
  strokeWeight(i/10);
  line(Hx[i],Hy[i],Hx[i+1],Hy[i+1]);
  }
  }
}
