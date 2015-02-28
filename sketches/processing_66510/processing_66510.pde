

PImage flower;


void setup(){
    background(0);
    size(1000,1000);
    flower = loadImage("flower12.png");
}

void draw(){
  
  if(mousePressed==true){
    
  
  for(int y=0;y<height;y+=50){
   
     for(int x=0;x<width;x+=50){
     fill(random (140),random (140),random (140));
   
    
     image(flower,x,y);
     }
     
    }
  }
     else {
       for(int y=0;y<height;y+=50){
   
     for(int x=0;x<width;x+=50){
     fill(random (140),random (140),random (140));
   
    
     rect(x,y,30,30);
     }
       }
       
   
  }
  
   
   
}
     
     
     
  

