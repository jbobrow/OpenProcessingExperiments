
float[] starx = new float[500];
float[] stary= new float[500];
float[] movex=new float[500];
float[] movey=new float[500];
void setup() {  
  size (500, 500);
  for (int i = 0; i<500; i++) {
    starx[i]=width/2;
    stary[i]=height/2;
    movex[i]=random(-10, 10);
    movey[i]=random(-10, 10);
  }
}
void draw() {
  background(0);
  stroke(255);
  for (int i = 0; i<500; i++) {
    //    strokeWeight(2);
    line(starx[i], stary[i],width/2,height/2);
    if (starx[i]>width+100 || starx[i]<0-100||stary[i] >height+100 || stary[i] <0-100) {
      starx[i]= width/2;
      stary[i]=height/2;
    }
    starx[i]+=movex[i];
    stary[i]+=movey[i];
  }
  fill(0);
  ellipse(width/2, height/2, 15, 15);
}



