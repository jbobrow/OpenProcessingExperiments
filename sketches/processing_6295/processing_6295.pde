
//Made by Andrew Wong 3rd Period


float x= 50;
float y= 50;
float shaperandom = random(4); 
PFont font;
float d = dist(mouseX,pmouseX,mouseY,pmouseY);

void setup(){
  size(1000,900);
  smooth();
  background(226);
  font = loadFont("AmericanTypewriter-24.vlw");
  textFont(font);
  
  
  
}


void draw() {
    

  
  
  
  
   fill(226);
  rect(900,800,60,60);
 
  
  
  
  
  
  
      if ((mouseX >= x) && (mouseX <= x + 145) &&
      (mouseY >= y - 24) && (mouseY <= y))
      {
       background(226);
      }
      fill(255);
  text ("Clear Screen", x, y);
  
  
  
  
     
     if (mousePressed) {
       
       stroke(random(256),random(256),random(256));
     strokeWeight(random(15,35));
   
   
 } else {
  
   
   strokeWeight(random(3,10));
   
   
 }
     
     
line(mouseX+random(5), mouseY+random(5),
 mouseX-random(5), mouseY-random(5));







  fill(0,200,200);
  text ("The Magic Box", 800, 770);
     
     
     
     
 
  
     
     
     
     
     
     
     
     
     
     
}

