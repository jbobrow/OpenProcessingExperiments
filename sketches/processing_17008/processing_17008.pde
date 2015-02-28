
//Scribble by Evan White
int x[];
int y[];
int pos=5;
int ellmove= 0;
void setup(){
  background(255);
  colorMode(HSB);
  size(800,600);
  smooth();
  noStroke();
  x= new int[pos];
  y=new int[pos];
}
void draw(){
for(int i=0; i<pos;i++){
fill(255);
stroke(0);
line(x[ellmove],y[ellmove],x[i],y[i]);
}}
void mouseMoved(){
  x[ellmove]=mouseX;
  y[ellmove]=mouseY;
  ellmove++;
if(ellmove>=pos){
  ellmove=0;
}}
void keyPressed(){
  if(key==32){
    background(255);
  }}

