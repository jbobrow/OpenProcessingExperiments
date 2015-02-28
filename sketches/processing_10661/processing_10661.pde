
void setup(){
  
  size(500,500);

  ellipseMode(CENTER);
 
  
  
  
}


void draw (){
    //background(255,150,150);
    fill(mouseX,abs(mouseX -pmouseX),mouseY);
  smooth();
  strokeWeight(2);
  ellipse(mouseX,mouseY,abs (mouseX -pmouseX),abs (mouseX -pmouseX));
 // rect (mouseX,mouseY, 50,50);
  
  
  
  
}


void keyPressed(){
  
  
  fill(0);
  ellipse(mouseX,mouseY,mouseX+30, mouseY+30);
  
  
}

 void mousePressed(){
 
 
 background (255);
 
 }

