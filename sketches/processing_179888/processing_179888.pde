
void setup() {  //setup function called initially, only once
size(300,300);
 
 }

void draw() {  //draw fonction loops 
   fill(225); 
ellipse(145,110,80,100);
rect(105,110,80,100);
fill(0);
ellipse(125+mouseX,95,15,15);
ellipse(145+mouseX/10,95,15,15);
}





