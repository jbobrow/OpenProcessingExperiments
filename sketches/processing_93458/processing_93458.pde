
//colour variables
float x;


void setup() {
 size(500,500); 
 

  smooth();
  background(255);
  
  
  
}


void draw() {
   
  stroke(random(80));
  line(mouseX,random(500),250,250);
  
    noStroke();
 fill(x+1);
  
triangle(mouseX+10,mouseY-10,300,270,200,270);



 x = int(random(80));
   

}

  
  


