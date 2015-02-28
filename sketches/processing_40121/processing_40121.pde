
void setup(){
  size(800,800);
  smooth();
  background(0);
}

void draw(){
  background(0);
    for(int x = 0; x < width; x+=30){
      for(int y = 0; y < height; y+=10){
        
      if(y%20 == 0){
        fill(240,20,20);
        rect(x,y,10,10);
       if(x%50 == 0){
         fill(0,0,255);
         ellipse(x,y,10,10);  
           if(y%10 ==0){
             fill(0,255,0);
             rect(x,y,5,5);
               if(y%50 == 0){
                 strokeWeight(5);
                 if(mousePressed) {
                   stroke(0,0,255);
                   line(x,0,x,width);
                  } else {  
                   stroke(239,255,229);
                 line(0,y,height,y);                
                   if(x%10 == 0){
                     if(mousePressed){
                       fill(255);
                       strokeWeight(10);
                       line(x,0,x,width);           
                       } else {
                       stroke(255,248,41);
                        
           
     // stroke(255);       
      //strokeWeight(.1);
      //line(x,0,mouseX,mouseY);
                        
                     }
                   }
                  
               }
             }
           } 
          }
        }
      }
    }
  }


