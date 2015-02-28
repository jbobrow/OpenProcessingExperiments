
int numpoints = 1000;
float[] x = new float[numpoints];
float[] y = new float[numpoints];
int drawpoints =0;

void setup(){
 size(600,400);
for(int i=0; i<numpoints;i++){
  x[i]=random(50000);
  y[i]=random(1000);}}
void mousePressed(){drawpoints=0;}
void mouseDragged(){
if(drawpoints<numpoints){
  x[drawpoints]=mouseX;
  y[drawpoints]=mouseY;
drawpoints+=1;}}

int frame=0;

void draw(){
  frame++;
background(frame);
for(int i=5; i<drawpoints;i+=2){
if(!mousePressed){
float phase = frame/i;
  x[i]= x[i]+sin(phase);
  y[i]= y[i]+tan(phase);}
stroke(y[i]);
fill(x[i/4], x[i], y[i]); 
specular(255, 255, 255); 
shininess(2.0); 
arc(x[i],y[i],x[i-1]/4,y[i-1]/7,0,PI+QUARTER_PI,PIE);}}
