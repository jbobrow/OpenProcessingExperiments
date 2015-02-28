
PImage cloud;

void setup(){
 size(800,600);
 smooth();
 background(255);
 cloud = loadImage("rob.gif");
colorMode(HSB,360,100,100,100);
 imageMode(CORNER);
 image(cloud,0,0);
}

  void draw(){
    if (mousePressed){
    photoF();
  }
 }
  
  void photoF(){
    
  cloud.loadPixels();//without img, will load screen
  int cloudSize =cloud.width*cloud.height;//# of pixels
  for(int i=0; i <cloudSize;i++){
  color cp=cloud.pixels[i];
  float h= hue(cp);
  float s= saturation(cp);
  float br= brightness(cp);
 // println(s);
 if (br>50){
   br=br+10;
   s=s+5;}
   else if (br<5){
     fill(0,100);
     ellipse(i,i,5,5);
   }
   else{
     br=br+10;
     s=10;
     h=h+30;
   }
   
  cloud.pixels[i]= color(h,s,br);
   }
   cloud.updatePixels();
image(cloud,0,0);
  }
  

