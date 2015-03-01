
int x,y;
float r,g,b;

PImage man,alien;
 
void setup()
{
  size(676,877);
  String manurl= "https://theblueandwhite.files.wordpress.com/2015/02/son-of-man-19641.jpg";
  String alienurl="http://i.imgur.com/uuHiwxY.png";
   man = loadImage(manurl);
   alien = loadImage(alienurl);
 x=-200;
    
}
void draw(){
  
 image(man, 0, 0,676,877);
  pixelize();
  
}

void pixelize()
{
  noStroke();

  image(alien, 200,x-200,250,300);
  if(mousePressed == true){
    if(x>=-100 || x<=350){
   x++;
  }
  if(x>=350){
    x = 350;
   tint();
  }
  }
  if(mousePressed==false){
   x--; 
  tint();
   if((x<=-100)){
     x=-100;
     
   }
  }
  
}
void tint(){
  if(mousePressed==true){
   tint(random(255),g,b);
  }
  if(mousePressed==false){
    noTint();
  }
}
  



