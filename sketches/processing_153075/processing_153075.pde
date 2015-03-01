

float xLast;  
float yLast;  

void setup() {  
  size(600, 600);  

  smooth();  

  background(255, 255, 255);  

}  
 

void draw() {  

      noStroke();  

    fill(#7CBCFF, 20);  

    ellipse(mouseX, mouseY,80, 80);  

     title();  

    xLast = pmouseX;  

    yLast = pmouseY;  
  
  
  
  noStroke();
  
  noFill();
  
  stroke(#FFFFFF, 29);

  ellipse(mouseX, mouseY, 120,120);
  
  
  title();  

    xLast = pmouseX;  

    yLast = pmouseY;  
    
    
      
  noStroke();
  
  noFill();
  
  stroke(#0C7DF2,20);

  ellipse(mouseX, mouseY, 80, 80);
  
  
  title();  

    xLast = pmouseX;  

    yLast = pmouseY;  
    
    
  }  
  



void title() {  


  fill(255);  

  textAlign(RIGHT);  

  text("SHIN seo i, interactive Drawing with mouse, Dynamic Media, 2014", width-50, height-20);  


}  

