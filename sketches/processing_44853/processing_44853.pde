
float f =0;  
PImage img;  
   

void setup(){  

  size(600,400);  

img = loadImage("drive through.png");  

}  

   

void draw(){ 
   image (img, 0,0); 

  for(int i=0;i<80;i++){  

    float x,y;  

    x=random(0,width);  

    y=random(0,height); 
  
stroke(220);
strokeWeight(2);

    point(x,y);  
  
  }  

} 


