
void setup (){
  size (600, 310);
}

void draw (){
  
  background (255);

  if (mousePressed){
  for (int j=0; j <= height; j=j+40){




    for (int i=0; i <= width; i=i+80){
      
      for (int y=0; y <= width; y=y+160){
        
        
            for (int x=13; x <= width; x=x+80){
      
              for (int e=40; e <= width; e=e+80){
                
                for (int o=26; o <= width; o=o+80){
      
                  for (int u=80; u <= width; u=u+160){
                
             
      line (0, j, width, j);
      fill (0);
      rect (i, y, 40, 40);
      rect (x, e, 40, 40);
      rect (o, u, 40, 40);
                  }
                }
            
              }
              
            }
      }
 
    }
  }
  }else{
    
    for (int i=0; i <= width; i=i+80){
      
      for (int y=0; y <= width; y=y+160){
        
        
            for (int x=13; x <= width; x=x+80){
      
              for (int e=40; e <= width; e=e+80){
                
                for (int o=26; o <= width; o=o+80){
      
                  for (int u=80; u <= width; u=u+160){
                
             
      fill (0);
      rect (i, y, 40, 40);
      rect (x, e, 40, 40);
      rect (o, u, 40, 40);
                  }
                }
            
              }
              
            }
      }
 
    }
  
  }
 

}

