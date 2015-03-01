
float hu,wu; //height unit, width unit
float amp = 10;
void setup(){
 size(350,350);
 hu = height/6; 
 wu = width/6;
}
float[][] cr = {{55,77,178},{209,103,3},{108,171,204},
                {111,9,31},{41,127,114},{101,57,32},
                {74,22,58},{205,184,65},{147,54,46}};
void draw(){
  background(16);

  for(int i=0;i<3;i++){
    for(int j=0;j<3;j++){
      fill(cr[i*3+j][0],cr[i*3+j][1],cr[i*3+j][2]);
      strokeWeight(0);
      stroke(cr[i*3+j][0],cr[i*3+j][1],cr[i*3+j][2]);
      ellipse(hu*(j*2+1),wu*(i*2+1),hu*2-2,wu*2-2);
    }
  }
  
  loadPixels();
  for (int i = 0; i < height; i++) {
    for(int j = 0; j < width; j++){
    color cc = pixels[i*width+j];
    if (cc!= color(16)) pixels[i*width+j] = color(red(cc)+random(-amp,amp),green(cc)+random(-amp,amp),blue(cc)+random(-amp,amp));
  }
  }
  updatePixels();
}
