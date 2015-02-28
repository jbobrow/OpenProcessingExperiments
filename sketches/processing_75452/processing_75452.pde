
//store mouseX,mouseY for 50 frames
int[] x = new int[70];
int[] y = new int[70];

void setup(){
  size(640,480);
  for (int i =0; i <x.length; i=i+1){ // i ++ ==== i =i+1;
    x[i] =0;
    y[i] = 0;
    /*
    x[0] = 0;
    x[1] = 0;
    x[2] = 0;
    x[3] = 0;
    .........
    x[49] = 0;
  */
}
}
void draw(){
background(255);
  for(int i =0; i < x.length-1; i++){
    x[i] = x[i +1];// x[49] = x[49+1];
    y[i] = y[i +1];

    x[x.length-1] = mouseX;
    y[x.length-1] = mouseY;

  noStroke();
  fill(255-i*3);
  ellipse(x[i],y[i],i,i); 
  }

}


