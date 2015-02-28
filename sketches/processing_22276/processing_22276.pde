
void setup() { 
 size(300,410);
 background(29);
}

void draw() { 
 
 
 fill(255,255);
 ellipse(mouseX,mouseY,50,50);

 noStroke();
 fill(  random(255)  ,0,0,100);
 triangle(mouseX,mouseY,59,67,250,250);
}

                
                
