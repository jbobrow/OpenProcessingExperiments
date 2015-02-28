
int yo;
int bro = 10;
int ho = 10;

void setup(){
  size (500, 500);
  background (0, 0, 0);
  
  
        fill(250,0,0,5);
        strokeWeight(1);
        
        yo = 0;
        while(yo < 500){
        rect(yo,yo,bro,bro);
        bro = bro + 5;
        yo = yo + 5;
        }
        
            fill(200,150,0,5);
        
            yo = 500;
            bro = 10; 
            while(yo > 0){
            rect(yo, yo, bro, bro);
            bro = bro - 5;
            yo = yo - 5;
            }       
}

void draw(){
   
     
  
  
}

