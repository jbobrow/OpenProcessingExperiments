
void setup(){
  size(450, 450);
  smooth();
  background(255); 
  noStroke();
  
  rectMode(CENTER);
  noCursor();
  frameRate(120);
}

//Wähle ein Gegensatzpaar aus der Liste 
//und interpretiere sie in einem sketch. 
//Benutze nur schwarz&wei;ß und arbeite mit der Mausinteraktion.
//laut - leise




void draw() {
 

  if(mousePressed){
    fill(0, 6);
 rect(random(0,500), random(0, 500), mouseY, mouseX);
  fill(255, 30);
     ellipse(mouseX-5, mouseY, random(100), random(50));
     ellipse(mouseX+5, mouseY, random(100), random(50));
     ellipse(mouseX, mouseY, 10, 15);
  }
     fill(255,10);
 rect(random(0,500), random(0, 500), mouseY, mouseX);

}
