
PImage me;

void setup() {
  size(400,400);
  me = loadImage("me.png");


}
void draw(){
  image(me,0,0,width/2,height/2);
  image(me,0,200,width/2,height/2);  
  image(me,200,0,width/2,height/2);
  image(me,200,200,width/2,height/2);  
  
if((mouseX>1)&&(mouseX<width/2)&&(mouseY<height/2)) {
loadPixels();
  for(int i=0;i<width/2;i++) {
    for(int j=0;j<height/2;j++) { 
      pixels[i*width+j] = color(red(pixels[i*width+j]*int(random(5))),green(pixels[i*width+j]*int(random(5))),blue(pixels[i*width+j])*int(random(5)));
}}
 for(int i=width/2;i<width;i++) {
    for(int j=0;j<height/2;j++) { 
      pixels[i*width+j] = color(red(pixels[i*width+j]*int(random(5))),green(pixels[i*width+j]*int(random(5))),blue(pixels[i*width+j])*int(random(5)));//pixels[((width-i)*width)+j];
}}
updatePixels();
}

if((mouseX>width/2)&&(mouseY<height/2)) {
loadPixels();
  for(int i=0;i<width/2;i++) {
    for(int j=height/2;j<height;j++) { 
      pixels[i*width+j] = color(255-red(pixels[i*width+j]),255-green(pixels[i*width+j]),255-blue(pixels[i*width+j]));
}}
  for(int i=width/2;i<width;i++) {
    for(int j=height/2;j<height;j++) { 
      pixels[i*width+j] = color(255-red(pixels[i*width+j]),255-green(pixels[i*width+j]),255-blue(pixels[i*width+j]));
}}
updatePixels();
}

if((mouseX>width*.5)&&(mouseY>height*.5)) {
loadPixels();
   for(int i=width/2;i<width;i++) {
    for(int j=height/2;j<height*.75;j++) { 
      pixels[i*width+j] = pixels[((width-i)*width)+j];
}}
   for(int i=0;i<width/2;i++) {
    for(int j=0;j<height/2;j++) { 
      pixels[i*width+j] = pixels[((width/2-i)*width)+j];
}}
   for(int i=width/2;i<width;i++) {
    for(int j=0;j<height/2;j++) { 
      pixels[i*width+j] = pixels[((width-i)*width)+j];
}}
  for(int i=0;i<width/2;i++) {
    for(int j=height/2;j<height*.75;j++) { 
      pixels[i*width+j] = pixels[((width/2-i)*width)+j];
}}

updatePixels();
}

if((mouseX<width*.5)&&(mouseY>height*.5)) {
loadPixels();
  for(int i=width/2;i<width;i++) {
    for(int j=0;j<height/2;j++) { 
      pixels[i*width+j] = pixels[(i*width)-j];
}}

  for(int i=0;i<width/2;i++) {
    for(int j=0;j<height/2;j++) { 
      pixels[i*width+j] = pixels[((width/2-i)*width)-j];
}}

  for(int i=0;i<width/2;i++) {
    for(int j=height/2;j<height;j++) { 
      pixels[i*width+j] = pixels[(i*width)+height-j];
}}
updatePixels();
}

}

