
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

  int blanco=4;
  for (int y=0; y<height; y+=blanco){  
    for (int x=0; x<width; x+=blanco){  
      color c1 = ritoque.get(x,y);  
      trazo(x,y,c1,blanco);  
      //color c2 = ritoque.get(y,x);
      //trazo(c2,blanco,x,y);

    }  
  }  
}  

void trazo(float x, float y, color c1, float balan){ 

  float elpincel = random(5,10);  
  for(int e = 0; e < elpincel; e++){ 


    float h = hue(c1) + 40;  // defino las salidas de color.
    float s = saturation(c1);  
    float b = brightness(c1) + 2*random(40);  

    pushMatrix();  
    translate(x,y);  
    fill(h,s,b,90);  //con transparencia noventa, logro que la pintura este mas clara y no tan cargada de color.
    float d = random(balan, 1);  
    ellipse(random(balan, -balan),random(-balan, balan), d*2, d*2);  
    popMatrix();  

  }  
}  

void mousePressed(){  
  redraw();   
  println("valentina");

}  






