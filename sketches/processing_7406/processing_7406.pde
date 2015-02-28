
class Alien extends Move{
  boolean probed;
  int numFrames = 4; 
  int frame = 0;
  PImage[] images = new PImage[numFrames];
  PImage light;
  
 Alien(float x, float y, float s){
   super (x,y,s);
   images[0]  = loadImage("alien01.png");
  images[1]  = loadImage("alien02.png"); 
  images[2]  = loadImage("alien03.png");
  images[3]  = loadImage("alien04.png");
  light=loadImage("light.png");
   
 }
 
 void display(){
   frame = (frame+1) % numFrames;  // Use % to cycle through frames
  image(images[frame], x, y);
    super.update();
    
 }
 
 void checkforcows(){
   for(int i=0;i<cowhasx.length;i++){
     if(abs(cowhasx[i]-x)<10&&cow[i].mutate==false){
       cow[i].dy=y;
      cow[i].y += (cow[i].dy - cow[i].y) * .3;
      probed=true;
      cow[i].mutate=true;
      image(light,x,y);
     }else if(abs(cowhasx[i]-x)>10&&cow[i].mutate==false){
       probed=false;
       cow[i].y += (cow[i].dy2 - cow[i].y) * .3;
     }else if(abs(cowhasx[i]-x)<10&&cow[i].mutate==true){
       cow[i].dy=y;
      cow[i].y += (cow[i].dy - cow[i].y) * .3;
      probed=true;
      cow[i].mutate=false;
      image(light,x,y);
     }else if(abs(cowhasx[i]-x)>10&&cow[i].mutate==true){
       probed=false;
       cow[i].y += (cow[i].dy2 - cow[i].y) * .3;
     }
   }
    
   }
  
}


