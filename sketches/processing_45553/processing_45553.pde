
// fink translation

PImage imgf;

void setup(){
  size(700,700);
  smooth();
  imgf = loadImage("fink.png");
  


}
void draw(){
    if(frameCount %2 == 0){
    fill(frameCount * 8 % 300, frameCount * 8 % 360,
    frameCount *7 % 300);
    pushMatrix();
    translate(50, 70);
    rotate(radians(frameCount * 2  % 360));
    image(imgf,0,0,100,100);
    popMatrix();
  /// 
  if(frameCount %2 == 0){
    fill(frameCount * 8 % 300, frameCount * 8 % 360,
    frameCount *7 % 300);
  pushMatrix();
  translate(70,70);
  rotate(radians(frameCount*2 %360));
  scale(2.0);
  image(imgf,0,0,100,100);
   popMatrix();
  if(frameCount %2 == 0){
    fill(frameCount * 8 % 300, frameCount * 8 % 360,
    frameCount *7 % 300);
    pushMatrix();
    translate(100,100);
    rotate(radians(frameCount * 2 % 360));
    image (imgf,100,10,400,400);
    popMatrix();
     if(frameCount %2 == 0){
    fill(frameCount * 8 % 300, frameCount * 8 % 360,
    frameCount *7 % 300);
    pushMatrix();
    translate(200,200);
    rotate(radians(frameCount*2 %360));
    scale(2.0);
    image (imgf,100,10,400,400);
    popMatrix();
  }}}}
}
  

