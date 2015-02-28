
//import processing.pdf.*;


int yo;
int bro;
int ho;
int low;
int blow = 70;
int go = 30;
 
void setup(){
  size (500, 500);
  background (0, 0, 0);
  //beginRecord(PDF, "finalpattern5.pdf");
   
   
        fill(0,0,0,blow);
        strokeWeight(3);
        stroke(255,255,255,go);
                 
        yo = 0;
        bro = 10;
        while(yo < 500){
        rect(yo,yo,bro,bro);
        bro = bro + 5;
        yo = yo + 5;
        }
         
                    fill(0,0,0,blow);
             stroke(255,255,255,go);       
         
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
            stroke(255,255,255,go);
         
            yo = 500;
            bro = 10;
            while(yo > 0){
            rect(yo, yo, bro, bro);
            bro = bro - 5;
            yo = yo - 5;
            }      
           
                                         
                     
                     
                            fill(0,0,0,blow);
                     stroke(255,255,255,go) ;      
         
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
    
      
   
 //  endRecord();
}


