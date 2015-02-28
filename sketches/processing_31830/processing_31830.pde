
int yo;
int bro;
int ho;
int low;
int blow = 0;
int go = 2;

int bro_change = 5;

void setup(){
  size (500, 500);
  background (255, 255, 255);
  smooth();
   
   
        fill(255,255,255,blow);
        strokeWeight(100);
        stroke(0,0,0,go);
                 
        yo = 0;
        bro = 10;
        while(yo < 500){
        ellipse(yo,yo,bro,bro);
        bro = bro + bro_change;
        yo = yo + bro_change;
        }
         
                    fill(0,0,0,blow); 
              stroke(0,0,0,go);      
         
                    yo = 0;
                    bro = 10;
                    ho = 10;
                    low = 500;
                    while(yo < 500){
                    ellipse(yo,low,bro,ho);
                    bro = bro + bro_change;
                    yo = yo + bro_change;
                    ho = ho - bro_change;
                    low = low - bro_change;
                    }
             
             
            fill(0,0,0,blow);
         stroke(0,0,0,go);
         
            yo = 500;
            bro = 10;
            while(yo > 0){
            ellipse(yo, yo, bro, bro);
            bro = bro - bro_change;
            yo = yo - bro_change;
            }      
           
                                         
                     
                     
                            fill(0,0,0,blow);       
         stroke(0,0,0,go);
         
                            yo = 500;
                            bro = 10;
                            ho = 10;
                            low = 0;
                            while(yo > 0){
                            ellipse(yo,low,bro,ho);
                            bro = bro - bro_change;
                            yo = yo - 5;
                            ho = ho + 5;
                            low = low + 5;                   
                            }
                        
}
 
void draw(){
    
      
   
   
}

