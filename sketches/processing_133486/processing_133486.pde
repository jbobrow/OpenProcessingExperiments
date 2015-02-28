
void setup() {
  size(400,400);  //Set the size at 400x400 pixels, the limit for the static
  smooth(); //Enablle anti-aliasing
  background(#5CCB63); //Makes a green-ish color background
}

void keyPressed(){
  background(random(256),random(256),random(256));
  //changes background through a keyboard press
}

void mousePressed(){
  background(random(256),random(256),random(256),random(256));
  //changes background through a left mouse click
}

void draw() {
 fill(#B542D8); //Makes a light purple-ish fill
 strokeWeight(3); //Outlines the following desks
 rect(30,180,130,50,20);
 rect(30,300,130,50,20);
 rect(210,180,130,50,20);
 rect(210,300,130,50,20); //Creates the 4 desks
 strokeWeight(6); //Increases the outline to something more pronounced
 fill(#030202); //
 arc(70,238,30,25,0,PI);
 arc(115,238,30,25,0,PI);
 arc(250,238,30,25,0,PI);
 arc(295,238,30,25,0,PI); //Chairs of the first row
 
 arc(70,358,30,25,0,PI);
 arc(115,358,30,25,0,PI);
 arc(250,358,30,25,0,PI);
 arc(295,358,30,25,0,PI); //Chairs of the second row
 
 fill(255);
 strokeWeight(5);
 rect(80,50,230,70); //Creates a smartboard
 
  if (mousePressed && (mouseButton == RIGHT)) {
    
  }
}


