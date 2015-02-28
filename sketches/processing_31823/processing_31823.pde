
int yo;
int bro;
int ho;
int low;
int blow = 5;
 
void setup(){
  size (500, 500);
  background (255, 255, 255);
   
   
        fill(0,0,0,blow);
        strokeWeight(1);
        stroke(0,0,0,50);
                 
        yo = 0;
        bro = 10;
        while(yo < 500){
        rect(yo,yo,bro,bro);
        bro = bro + 5;
        yo = yo + 5;
        }
         
                    fill(0,0,0,blow);       
         
                    yo = 0;
                    bro = 10;
                    ho = 10;
                    low = 500;
                    while(yo < 500){
                    rect(yo,low,bro,ho);
                    bro = bro + 5;
                    yo = yo + 5;
                    ho = ho - 5;
                    low = low - 5;
                    }
             
             
            fill(0,0,0,blow);
         
            yo = 500;
            bro = 10;
            while(yo > 0){
            rect(yo, yo, bro, bro);
            bro = bro - 5;
            yo = yo - 5;
            }      
           
                                         
                     
                     
                            fill(0,0,0,blow);       
         
                            yo = 500;
                            bro = 10;
                            ho = 10;
                            low = 0;
                            while(yo > 0){
                            rect(yo,low,bro,ho);
                            bro = bro - 5;
                            yo = yo - 5;
                            ho = ho + 5;
                            low = low + 5;                   
                            }
                        
}
 
void draw(){
    
      
   
   
}

