
PImage img;

int kreisGroesse=10;
void setup() {
  size(480, 640);
  smooth();
  img= loadImage("vogue.jpg");
  background(255);
}
void draw () {
  background(255); 
  noStroke();
  for(int i=0;i<width/10;i++) {
    for( int j=0;j<height/10;j++) {

      float kreisGroesse2 = 350 + brightness(img.get(i*kreisGroesse, j*kreisGroesse));
      float r= brightness (img.get(i*kreisGroesse, j*kreisGroesse));

      if(kreisGroesse2<100) {
        kreisGroesse2= 100;
        fill(255,0);
      }
      else
      {
        fill(img.get(i*kreisGroesse, j*kreisGroesse),700);
      }
      //fill(0);
      pushMatrix();
      translate(i*kreisGroesse, j*kreisGroesse);
    //  rotate(r);


    rect(3,3, kreisGroesse2/20, kreisGroesse2/30);

      popMatrix();
    }
  }
}



