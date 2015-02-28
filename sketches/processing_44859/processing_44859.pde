
//get inspired from http://www.openprocessing.org/visuals/?visualID=3673

PImage img;   
    

void setup(){   

  img = loadImage("trees.png");  

  size(640, 400); 

  noStroke();   

  colorMode(HSB, 350);   

  smooth();   

  

}   

void draw(){   

  int p = 3;    

  for(int y = 0; y < height; y += p){   

    for(int x = 0; x < width; x += p){   

      color c = img.get(x,y);   

      tec(x, y, c, p);   

    }}}   

    

void tec(float x, float y, color c, float z){// la técnica del trazo   

  int pic = round(random(10));  

  for(int i = 0; i <= pic; i++){  

    float h = hue(c) + random(10);  

    float s = saturation(c) + random(55);  

    float b = brightness(c) + random(55);  

    pushMatrix();  

    line(x,y,x+random(10),y+random(-5,10));  

    stroke(h,s,b);  

    popMatrix();  

  }   

}   

void keyPressed(){   

  redraw();    

}   


