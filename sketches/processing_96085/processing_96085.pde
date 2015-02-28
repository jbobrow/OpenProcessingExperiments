
import processing.dxf.*;
import ddf.minim.analysis.*;
import ddf.minim.*;
FFT fftLin;
FFT fftLog;
Waveform myRects;
Minim minim;
AudioPlayer groove;
boolean record;
void setup(){
size(1000, 500, P3D);
noStroke();
minim = new Minim(this);
groove = minim.loadFile(“groove.mp3″);
groove.loop();
background(255);
fftLog = new FFT(groove.bufferSize(), groove.sampleRate());
fftLog.logAverages(22, 4); //adjust spacing here
float w = float(width/fftLog.avgSize());
float x = w;
float y = 0;
float z = 50;
float radius = 10;
myRects = new Waveform(x,y,z,radius);
}
void draw(){
background(0);
directionalLight(126,126,126,sin(radians(frameCount)),cos(radians(frameCount)),1);
ambientLight(102,102,102);
float zoom = 1000;
PVector foc = new PVector(myRects.x*0.5, myRects.y*0.5, 0);
PVector cam = new PVector(zoom*sin(radians(frameCount)), zoom*cos(radians(frameCount)), -zoom);
camera(foc.x+cam.x,foc.y+cam.y,foc.z+cam.z,foc.x,foc.y,foc.z,0,0,1);
//play the song
fftLog.forward(groove.mix);
myRects.update();
if(record){
beginRaw(DXF, “output.dxf”);
}
// DXF will export the stuff drawn between here.
myRects.plotTrace();
if(record){
endRaw();
record = false;
println(“Done DXF~!”);
}
}
void stop() {
// always close Minim audio classes when you finish with them
groove.close();
// always stop Minim before exiting
minim.stop();
super.stop();
}
class Waveform{
float x,y,z;
float radius;
PVector[] pts = new PVector[fftLog.avgSize()];
PVector[] trace = new PVector[0];
Waveform(float incomingX, float incomingY, float incomingZ, float incomingRadius){
x = incomingX;
y = incomingY;
z = incomingZ;
radius = incomingRadius;
}
void update(){
plot();
}
void plot(){
for(int i = 0; i < fftLog.avgSize(); i++){
int w = int(width/fftLog.avgSize());
x = i*w;
y = frameCount*5;
z = height/4-fftLog.getAvg(i)*10;
stroke(0);
point(x, y, z);
pts[i] = new PVector(x, y, z);
trace = (PVector[]) expand(trace, trace.length+1);
trace[trace.length-1] = new PVector(pts[i].x, pts[i].y, pts[i].z);
}
}
void plotTrace(){
/*
//drawing points
for(int i=0; i stroke(255,0,0);
//locator(trace[i].x, trace[i].y, trace[i].z, 1);
point(trace[i].x, trace[i].y, trace[i].z);
}
*/
//drawing poly surface
fill(255,20); noStroke();
//stroke(0,255,255,5);
int inc = fftLog.avgSize();
for(int i=1; i if(i%inc != 0){
beginShape(TRIANGLE_STRIP);
vertex(trace[i].x, trace[i].y, trace[i].z);
vertex(trace[i-1].x, trace[i-1].y, trace[i-1].z);
vertex(trace[i+inc].x, trace[i+inc].y, trace[i+inc].z);
vertex(trace[i-1+inc].x, trace[i-1+inc].y, trace[i-1+inc].z);
endShape(CLOSE);
}
}
//draw splines
int skip = 5;
stroke(255, 20); noFill();
for(int i=0; i beginShape();
for(int j=0; j curveVertex(trace[i+j].x, trace[i+j].y, trace[i+j].z);
}
endShape();
}
}
}
void keyPressed() {
// use a key press so that it doesn’t make a million files
if (key == ‘r’) record = true;
}
void locator(float x, float y, float z, float sc){
line(x-sc,y,z,x+sc,y,z);
line(x,y-sc,z,x,y+sc,z);
line(x,y,z-sc,x,y,z+sc);
}
