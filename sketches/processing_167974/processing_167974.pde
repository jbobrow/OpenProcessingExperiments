
float r;
float g;
float b;




void setup() {
  
  size(500,500);
  background(#000000);
  fill(#000000);
  strokeWeight(2);
  smooth();
  }
  void draw() {
    r=random (255);
    g=random (255);
    b=random(255);
   
   
   
    fill(#CE0F25);
    rect(0,0,60,60);
    fill(#5E0FCE);
    
    rect(61,0,60,60);
    fill(#00FF46);
    rect(121,0,60,60);
    fill(#FFC400);
    rect(181,0,60,60);
    fill(#00FFDF);
    rect(241,0,60,60);
    
    fill(r,g,b);
    rect(301,0,60,60);
    
    fill(255);
    rect(361,0,60,60);
    
    if (mousePressed) {if(mouseX>0 && mouseX<60 && mouseY <50 )  stroke(#FF0900);}
    
    if (mousePressed) {if(mouseX>60 && mouseX<115 && mouseY <50 )  stroke(#290CF0);}
    
    if (mousePressed) {if(mouseX>125 && mouseX<150 && mouseY <50 )  stroke(#0CF00D);}
    
    if (mousePressed) {if(mouseX>180 && mouseX<220 && mouseY <50 )  stroke(#E5ED16);}
    
    if (mousePressed) {if(mouseX>260 && mouseX<290 && mouseY <50 )  stroke(#16EDCE);}
    
        if (mousePressed) {if(mouseX>280 && mouseX<350 && mouseY <50 )  stroke(r,g,b);}

    if (mousePressed) {if (mouseX> 355 && mouseX<425 && mouseY <60) background(0);}
    
       
     
       
 
    
    
    
    line(mouseX,mouseY,pmouseX,pmouseY);
    
    }
    
