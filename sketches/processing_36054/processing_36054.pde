
//Colour variable
float c = random(255);

void setup(){
  
 size(700,400);
// background(255);
 smooth();
 //noCursor();
 frameRate(30);

}

void draw(){
  
  //background(0);
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  
   if (mouseButton == RIGHT)
    {
    fill(c);
    ellipse(random(mouseX,pmouseX),random(mouseY-20,pmouseY+20),10,10);
    } 
    
     else if(mouseButton == LEFT)
     {
     stroke(255);
     strokeWeight(abs(mouseX - pmouseX));
     line(mouseX,mouseY,pmouseX,pmouseY);
     }
}



