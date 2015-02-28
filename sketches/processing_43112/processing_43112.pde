
float diameter = 1;
int num = 1000;
float[] x = new float[num];
float[] y = new float[num];
PImage[] MyImage=new PImage[6];
int no=35;
float[] a = new float[no];
import ddf.minim.*;
AudioPlayer player;
Minim minim;


void setup() {
  size(400,300);
  background(200);
  minim = new Minim(this);
  
  player = minim.loadFile("noise.mp3");
  
  player.loop();     
   for (int m = 0; m < MyImage.length; m ++)
   {
    MyImage[m] = loadImage( m +".jpg"); }
      for (int p=0;p< no;p++){
  a[p]= random(0,400);
  }
   }

void draw(){
   noStroke();
   fill(random(10,255));
   for (int i = 0;i < num; i++) {
  x[i] = random(1,399);
}
   for (int i = 0; i < num; i++){
  y[i] = random(1,299);
  }
   
   for (int i = 0; i < num; i++){
   ellipse(x[i],y[i],diameter,diameter);}
}
  
void mouseClicked(){
 
  for (int m = 0; m < MyImage.length; m ++)
 { image(MyImage[int(random(6))],0,0);
 }
  for (int p=0;p< no;p++){
    fill(random(1,255),random(1,255),0,random(1,90));
   rect(a[p],random(1,220),60,100);}

 }






