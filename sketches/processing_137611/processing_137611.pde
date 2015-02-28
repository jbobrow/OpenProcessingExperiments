
PFont blur;  
PFont helvetica; 
int start_time = 3000;
int change = int(random(10,250));
int size= int(random(10,250));
int position= int(random(10,250));


void setup() { 
    size(700, 700); 
    background(255);
  stroke(175);

   blur  = createFont("Blur",16,true);
   helvetica = createFont("helvetica",size,true);

  } 

  void draw() {
     

    
       if ( millis() > start_time && millis() < start_time + 1000 ) {
      textFont(blur,100);                
  fill(size,position,change);                        
  text("CREATIVE",size, position);  
  position = position + 2;
    }
         if ( millis() > start_time+1000 && millis() < start_time + 2000 ) {
      textFont(helvetica,position/5);                 
  fill(0);                         
  text("COMPUTING",100,100+1);  
    }
       

  }
      


      

    
 
 



