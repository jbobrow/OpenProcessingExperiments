
int yo;
int bro;
int ho;
int low;
int blow = 0;
 
void setup(){
  size (500, 500);
  background (0, 0, 0);
   
        //noStroke();
        fill(250,0,0,blow);
        strokeWeight(1);
        stroke(255,255,255,100);
                 
        yo = 0;
        bro = 10;
        while(yo < 500){
        rect(yo,yo,bro,bro);
        bro = bro + 5;
        yo = yo + 5;
        }
         
                    fill(200,75,0,blow);       
         
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
             
             
            fill(200,125,0,blow);
         
            yo = 500;
            bro = 10;
            while(yo > 0){
            rect(yo, yo, bro, bro);
            bro = bro - 5;
            yo = yo - 5;
            }      
           
                                         
                     
                     
                            fill(250,200,0,blow);       
         
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

