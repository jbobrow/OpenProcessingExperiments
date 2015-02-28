
PImage Ritoque_agua;   
   
void setup(){   
  Ritoque_agua = loadImage("Ritoque_agua.jpg");   
     size (Ritoque_agua.width, Ritoque_agua.height);
  noStroke();   
  noLoop();    
  colorMode(HSB, 2545);   
  smooth();   
  background(255);   
}   
   
void draw(){
  int spacer = 5;
  
  for(int y = 0; y < height; y += spacer){   
    for(int x = 0; x < width; x += spacer){   
      color c = Ritoque_agua.get(x,y);   
      pincelada(x, y, c, spacer);   
      
    }
  }
}

void pincelada(float x, float y,color c, float amp){
  int puntos= round (random (3, 50));
 for(int i = 2; i <= puntos; i++){ 
    float h = hue(c) + random(-5, 5); 
    float s = saturation(c) + random(100); 
    float b = brightness(c) + random(5); 
    pushMatrix(); 
    translate(x,y); 
    fill(h,s,b); 
    float tam = random(2, amp/2); 
    triangle(random(-amp, 70),random(-amp, amp), tam, tam,random(-amp, 0),tam); 
    popMatrix(); 
  }  
} 
 
void keyPressed(){ 
  redraw();  
} 

