
void setup() {  

  size(500, 500);  

  noStroke();  

  background(0);  

  fill(255);  

}
  
void draw() {  

  fill(0,0 , random(255));


 if (mousePressed) { 

  fill(255); 
float r = random(50);

  ellipse(mouseX,mouseY,r,r);}}
 

  

void keyPressed(){  

  switch(key) { 

    case 'd':  

    background(0);         

    break; 

    case 'r':    

    stroke(255,0,0);   

    break;     

    case 'b':  

    stroke(0,0,255);   

    break;   

    case 'g':    

    stroke(0,255,0);   

  }
}


