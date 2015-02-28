
PImage ritoque;   

void setup (){   
  ritoque=loadImage ("ritoque.JPG");  
  size(ritoque.width, ritoque.height);
  colorMode(HSB);   
  background (255);  
  noStroke();
  noLoop();   
  smooth();   
}   

void draw(){   

  int spacer=4; 
  for (int y=0; y<height; y+=spacer){   
    for (int x=0; x<width; x+=spacer){   
      color c = ritoque.get(x,y);   
      pincel(x,y,c,spacer);

    }   
  }   
}   

void pincel(float x, float y, color c, float f){  

  float puntos = random(5,10);   
  for(int e = 0; e < puntos; e++){  


    float h = hue(c) + 20; 
    float s = saturation(c) + 100;   
    float b = brightness(c) + 40;   

    pushMatrix();   
    translate(x,y);   
    fill(h,s,b,50); 
    float d = random(f, 1);   
    ellipse(random(f, -f),random(-f, f), d*4, d*4);   
    popMatrix();   

  }   

}




