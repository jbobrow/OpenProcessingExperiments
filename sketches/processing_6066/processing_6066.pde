
int i,j=1,m=1,l=1;
float p=1,q=1;
void setup() {
  size(400, 400);
  background(random(10,200),random(10,200),random(10,200));
  colorMode(HSB);
  loadPixels();
  i=width*height;
}

void draw() {
  j=1+(j)%400;
  for (int k=0; k<i; k++){
    p=saturation(pixels[i-round(p)]);
    q=hue(pixels[constrain(abs(i-k-1),0,i-1)]);//counting the pixels from the other end of
    // the picture - the upper and lower part are talking to each other
    pixels[k]=color(p%400+k%200,1+abs((j-p)+5*q)%400,50+j%200+j%(j+q));//mix it all up
  }
  updatePixels();
  delay(400);//takes some time to watch it
}








