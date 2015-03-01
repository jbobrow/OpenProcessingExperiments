
void setup () {   background (0);   
  size(255,255); 
        background (0);  
}

void draw () {
         background (0); 
for (int i=0; i<height; i = i + 10) { 

    stroke(255,0,0); 
    line(0,i,mouseX, mouseY); 
    line(mouseX, mouseY, width, i); 
    line(i,0,mouseX, mouseY); 
    line(i,height,mouseX, mouseY); 

 } 
}


