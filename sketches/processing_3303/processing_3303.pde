
PImage duna; 
    int col;

void setup(){ 
duna = loadImage("duna.jpg"); 
  size(duna.width,duna.height); 
  colorMode(RGB,255); 
   
  background (255); 
} 
void draw(){ 
 
  
  int spacer = 7;  
  for(int y = 0; y < height; y += spacer){ 
    for(int x = 0; x < width; x += spacer){ 
      col = duna.get(x,y);
      fill(col);
      pincel(x,y, col, spacer);
    }
  } 
}
void pincel(float x, float y, color c, float amp){
  int puntos = round(random(5, 10));
  for(int i = 0; i <= puntos; i++){
    float h = hue(c) + random(51, 80);
    float s = saturation(c) + random(-10,30);
    float b = brightness(c) + random(-10,5);
    
    pushMatrix();
    {
      translate(x,y);
      rotate(amp-(random(2,5)));
      fill(h/2,s*2,b, 80);
      float tam = random(2, amp);
      
     stroke(h/2,s*2,b,60);
      
      ellipse(random(amp, amp*2),random(amp, amp*2), tam/1.5, tam);
    }
    popMatrix();
    
  }
}

