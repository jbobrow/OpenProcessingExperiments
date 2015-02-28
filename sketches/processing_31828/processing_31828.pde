
int yo;
int bro;
int ho;
int low;
int blow = 0;
int go = 2;
int bro_yo_change = 5;
 
void setup(){
  size (500, 500);
  background (0, 0, 0);
   
   
        fill(0,0,0,blow);
        strokeWeight(75);
        stroke(250,250,250,go);
                 
        yo = 0;
        bro = 10;
        while(yo < 500){
        ellipse(yo,yo,bro,bro);
        bro = bro + bro_yo_change;
        yo = yo + bro_yo_change;
        }
         
                    fill(0,0,0,blow); 
              stroke(250,250,250,go);      
         
                    yo = 0;
                    bro = 10;
                    ho = 10;
                    low = 500;
                    while(yo < 500){
                    ellipse(yo,low,bro,ho);
                    bro = bro + bro_yo_change;
                    yo = yo + bro_yo_change;
                    ho = ho - bro_yo_change;
                    low = low - bro_yo_change;
                    }
             
             
            fill(0,0,0,blow);
         stroke(250,250,250,go);
         
            yo = 500;
            bro = 10;
            while(yo > 0){
            ellipse(yo, yo, bro, bro);
            bro = bro - bro_yo_change;
            yo = yo - bro_yo_change;
            }      
           
                                         
                     
                     
                           fill(0,0,0,blow);       
         stroke(250,250,250,go);
         
                            yo = 500;
                            bro = 10;
                            ho = 10;
                            low = 0;
                            while(yo > 0){
                            ellipse(yo,low,bro,ho);
                            bro = bro - bro_yo_change;
                            yo = yo - bro_yo_change;
                            ho = ho + bro_yo_change;
                            low = low + bro_yo_change;                   
                            }
                        
}
 
void draw(){
    
      
   
   
}

