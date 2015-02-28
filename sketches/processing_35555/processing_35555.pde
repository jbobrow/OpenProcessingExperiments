
void setup(){
size(300,300);

}

void draw(){
 
background(255,255,255);
    

fill(234,205,156);  
rect(0,0,300,150-mouseY);

rect(0,300,300,mouseY-150);

fill(0,mouseY, mouseY);
ellipse(150,150,200,mouseY); 
  
fill(0);
ellipse(150,150,150,mouseY); 

}

