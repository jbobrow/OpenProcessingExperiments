
int counter;

// by dave @ beesandbombs.tumblr.com >:)
 
void setup() {
setup_();
result = new int[width*height][3];
result_ = new int[width*height][3];
}
 
int[][] result, result_;
float time;
 
void draw_() {
if (aberrationAmount == 0.0) {
draw__();
return;
}
 
for (int i=0; i<width*height; i++)
for (int a=0; a<3; a++)
result_[i][a] = 0;
 
for (int a=0; a<3; a++) {
pushMatrix();
translate(width/2, height/2);
scale(1+0.008*a*aberrationAmount);
translate(-width/2, -height/2);
draw__();
popMatrix();
loadPixels();
for (int i=0; i<pixels.length; i++) {
result_[i][a] = pixels[i] >> (8*(2-a)) & 0xff;
}
}
 
loadPixels();
for (int i=0; i<pixels.length; i++)
pixels[i] = 0xff << 24 | result_[i][0] << 16 |
result_[i][1] << 8 | result_[i][2];
updatePixels();
}
 
void draw() {
if (shutterAngle == 0.0) {
time = map(frameCount-1, 0, numFrames, 0, 1) % 1;
draw_();
return;
}
 
for (int i=0; i<width*height; i++)
for (int a=0; a<3; a++)
result[i][a] = 0;
 
for (int sa=0; sa<samplesPerFrame; sa++) {
time = map(frameCount-1 + sa*shutterAngle/samplesPerFrame, 0, numFrames, 0, 1);
draw_();
loadPixels();
for (int i=0; i<pixels.length; i++) {
result[i][0] += pixels[i] >> 16 & 0xff;
result[i][1] += pixels[i] >> 8 & 0xff;
result[i][2] += pixels[i] & 0xff;
}
}
 
loadPixels();
for (int i=0; i<pixels.length; i++)
pixels[i] = 0xff << 24 | (result[i][0]/samplesPerFrame) << 16 |
(result[i][1]/samplesPerFrame) << 8 | (result[i][2]/samplesPerFrame);
updatePixels();
 
/* saveFrame("f##.gif");
if (frameCount==numFrames)
exit(); */
}
 
////////////////////////////////////////////////////
 
float aberrationAmount = 1; // 1 is quite a lot
 
int samplesPerFrame = 32;
int numFrames = 48;
float shutterAngle = .5;
 
void setup_() {
size(500,500,P2D);
}
 
void draw__() {
background(0);
fill(255);
ellipse(width/2 + 100*sin(TWO_PI*time), height/2 + 100*sin(2*TWO_PI*time), 50, 50);
}
