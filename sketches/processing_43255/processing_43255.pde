
//price of gas (adjusted for inflation)
PImage img;
int directiony;
int y;
int x;
int stop;
PFont font;
float data [] = {1.005,0.095,0.080,0.062,0.60,0.058,0.070,0.060,0.090,1.030,0.058,1.018};
int ytop[] = {158,334,340,343,223,343,339,342,334,147,343,150};
int ybot[]= {700,700,700,700,700,700,700,700,700,700,700,700};


 

void setup(){
  background(255);
  size(1300,700);
  smooth();
  directiony=3;
  img = loadImage ("gasoline1.gif");
  y=700;
  font = loadFont ("SolidOoky-48.vlw");
  //imageMode(center);
  
}

void draw(){
  //background(255);
  for (int i = 0; i < data.length; i++){  
  float imgSize = map(data[i],400,800,0,90);
  x=i*108 + 100;
  //for (int i1 = 0; i1 <ypos.length; i++)
loadImage("gasoline1.gif");
image (img,x, ybot[i], imgSize,imgSize);
textFont(font,18);
text(data[i], i*108+20,data[i]*-200+350);
textFont(font,42);
text("PRICE OF GAS 1979 - 2011", 350, 50);
text("ADJUSTED FOR INFLATION", 330, 85);
fill(0);
 //if(dist(mouseX,mouseY,i*108,700)<50){
 if(ybot[i] > ytop[i]);{
 ybot[i]-=3;}//-= directiony;}
  if(ybot[i] < ytop[i]+100){//data[i]*-200+350){
   ybot[i]+=3;}
   if (mousePressed){
     setup();}
   	

 
}
  
}
//void mousePressed() {
  //for (int i = 0; i < data.length; i++){
  //if(mouseY<imgsize/2){
  //directiony=1;
//} else {
  //y = 600;}
  //}
//}

