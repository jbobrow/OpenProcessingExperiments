
PImage ritoque;   
   
void setup (){   
 
  ritoque = loadImage ("ritoque.jpg");  
       size (450,900);   
 
 background (0);  
   colorMode(HSB, 200);    
 noStroke();              
  smooth();               
}   
   
   
void draw(){   
   
  int sp=1;   
  for (int y=0; y<height; y+=sp){   
    for (int x=0; x<width; x+=sp){   
       color c = ritoque.get(x,y);  
      pincelTotal(x,y,c,sp);   
    }   
  }   
}   
   
void pincelTotal(float x, float y, int c, int p){   
  int pincel=round (random(4,7));   
  for(int i = 0; i <= pincel; i++){   
    float h = hue(c) + random(15, 25);         //tonalidad 
    float s = saturation(c) +random(60);       //saturacion 
    float b = brightness(c) + random(8,15);  //brillo 
    pushMatrix();   
    translate(x,y);   
    fill(h,s,b,45);                            //nitidez 
       rotate(1); 
    
   rect(random(20,25),random(25.28),random(20,15),random(18,10)); 
 
     
    popMatrix();   
  }   
}   
   
void keyPressed(){   
      
}   
 


