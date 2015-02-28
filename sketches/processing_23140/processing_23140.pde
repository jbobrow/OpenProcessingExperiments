

PImage img;
PImage img1;
PImage img2;
PImage img3;
int a=1;
int b=1;
int c=1;
int direccion=100;
int d=1;
void setup () {
  
size (900,800);

img=loadImage ("1.jpg");
img1=loadImage ("2.jpg");
img2=loadImage ("3.jpg");
img3=loadImage ("4.jpg");
  frameRate (30);
}
 void draw (){
   background (random (0,200),random (0,100),0);
 
   
   
   //cambia el tinte el cuarto valor es alfa//
// tint (128,100,0);
 
 for (int a=0;a<=800;a=a+50){
   for (int b=0;b<=800;b=b+100){
     for (int c=400;c<=800;c=c+100){
 image (img,b,a,60,40);
 image (img3,d,100,200,100);
 //image (img2,pmouseX,pmouseY,mouseX,mouseY);
 
   //imagen sigue el mouse//
 image (img1,mouseX, mouseY,100,80);
 d= d + direccion;
if(d>=600  || d<=0) {
direccion = direccion *-1;
 }
 
 }}
 }}
 

