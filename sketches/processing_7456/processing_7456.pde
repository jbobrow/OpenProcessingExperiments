
PImage p ;
int pix [][]= new int [1000][1300];
int v=10;
void setup(){
  size(1024,768);
  p = loadImage("ttete.jpg");
  p.loadPixels();
  smooth();
}
void draw(){
 //background(220);
  for(int i=v;i<height-10;i+=v){
 for(int j=v;j<width-10;j+=v){
   
   strokeWeight(0);
   pix[i][j]=p.get(j,i);
   
 
   if(pix[i][j]<1){
   
   stroke(pix[i][j],100);
  line(j,i,j+random(-v,v),i+random(-v,v));
  line(j,i,j+random(-v,v),i+random(-v,v));
  line(j,i,j+random(-v,v),i+random(-v,v));
   }}}
  } 
  void mousePressed(){
if(mousePressed){
  saveFrame("line-####.tif"); 
}}

