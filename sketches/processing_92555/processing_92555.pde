
 

void setup(){
 
 size(800, 800);
 fill(0);
 background(255); 
}

void draw(){
  
  if(mousePressed){
   
   fill(255, 10);
  rect(0,0,width, height); 
  fill(0);

    
    
    smooth();
   drawLightning();
  }  
}

void drawLightning(){
  
   int x = mouseX;
   int y = mouseY;
  
   int a = x + round(random(100) -50);
   int b = y + round(random(100) -50);
 
   for(int i = 0; i < 3; i++){
    
   stroke(random(255), random(255), random(255));
   ellipse(a, b, 10, 10);
   stroke(0);
   line(x, y, a, b);
   
   x = a;
   y = b;
   
   a = x + round(random(100) -50);
   b = y + round(random(100) -50);
  
   
   }  
}


