
float margen, sp, diam, n;  
  
void setup(){  
  margen = 2;  
  sp = 30;
diam=20;  
n=0;
  size(500, 500); 
  colorMode(HSB, 300);
  
  smooth();  
}  
  
void draw(){   
   background(mouseX, mouseX, 300);
   for(float y =margen; y <= height-margen; y += sp*3){  
    for(float x = margen; x <= width-margen; x += sp*3){  
      float d;  
       float N = noise(n); 
      d = dist(mouseX, mouseY, x, y);  
     float dia;  
    dia = map(100, 100, width,  height, 11);   
    if(mousePressed==false){
    stroke(225); 
    strokeWeight(2);
    translate(mouseX*4, mouseY*4);
    rotate(80);
    
      fill(random(0, 255));
  rect(mouseX, mouseY, mouseX, mouseY);
  fill(225);
  line(mouseX, mouseY, x, y);
   fill(9, 11, 88);  
    rect(mouseX,width/2,(15*N),7);   
    fill(158, 208, 245);  
    ellipse(mouseY,height/2,4*(d*N),6);  

    
    }  
  }  
   }
}


