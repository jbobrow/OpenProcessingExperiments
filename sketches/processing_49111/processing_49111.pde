
PFont f;

void setup() {
  size(640,480);
  smooth();
  noCursor();
  frameRate(30);
   // Step 3: Load Font
  f = loadFont( "AkzidenzGroteskBE-Md-48.vlw" ); 
   
}
 
void draw() {
  background(0);
  rectMode(CENTER);
   
  // mooninite body
  strokeWeight(2);
  stroke(120);
  fill(20,250,80);
beginShape();
vertex(mouseX-60,mouseY);
vertex(mouseX-60,mouseY-40);
vertex(mouseX-48,mouseY-40);
vertex(mouseX-48,mouseY-75);
vertex(mouseX-54,mouseY-75);
vertex(mouseX-54,mouseY-102);
vertex(mouseX-36,mouseY-102);
vertex(mouseX-36,mouseY-123);
vertex(mouseX-18,mouseY-123);
vertex(mouseX-18,mouseY-116);
vertex(mouseX-9,mouseY-116);
vertex(mouseX-9,mouseY-100);
vertex(mouseX,mouseY-100);
vertex(mouseX,mouseY-106);
vertex(mouseX+24,mouseY-106);
vertex(mouseX+24,mouseY-123);
vertex(mouseX+51,mouseY-123);
vertex(mouseX+51,mouseY-46);
vertex(mouseX+60,mouseY-46);
vertex(mouseX+60,mouseY);
vertex(mouseX-60,mouseY);
endShape();


//mooninites mouth small
noStroke();
fill(43,11,154);
rect(mouseX,mouseY-36,20,5);

//mooninites eyes
fill(43,11,154);
rect(mouseX-16,mouseY-62,13,5);
rect(mouseX+16,mouseY-62,13,5);

//mooninite eyebrowes
fill(43,11,154);
rect(mouseX-37,mouseY-65,7,7);
rect(mouseX-30,mouseY-72,7,7);
rect(mouseX-23,mouseY-78,7,7);
rect(mouseX-16,mouseY-84,7,7);
//right eye
rect(mouseX+37,mouseY-65,7,7);
rect(mouseX+30,mouseY-72,7,7);
rect(mouseX+23,mouseY-78,7,7);
rect(mouseX+16,mouseY-84,7,7);

//left leg
fill(43,11,155);
rect(mouseX-15,mouseY+10,8,20);
rect(mouseX-25,mouseY+17,30,8);

//right leg
rect(mouseX+15,mouseY+10,8,20);
rect(mouseX+25,mouseY+17,30,8);

//left arm
rect(mouseX-64,mouseY-36,9,9);
rect(mouseX-71,mouseY-29,9,9);
rect(mouseX-77,mouseY-18,9,18);

//right arm
rect(mouseX+64,mouseY-41,9,9);
rect(mouseX+71,mouseY-34,9,9);
rect(mouseX+77,mouseY-18,9,27);


}
   
void mousePressed() {
  
   //action mouse click
  //mooninites mouth big
  frameRate(1);
  noStroke();
  // mouth
  fill(43,11,154);
  rect(mouseX,mouseY-36,40,7);  
 
 //arm cover
 fill(0);
rect(mouseX+64,mouseY-41,9,9);
rect(mouseX+71,mouseY-34,9,9);
rect(mouseX+77,mouseY-18,9,27);

//new right arm
fill(43,11,154);
rect(mouseX+74,mouseY-41,30,10);
rect(mouseX+89,mouseY-56,10,40);
rect(mouseX+89,mouseY-76,25,9);
rect(mouseX+89,mouseY-84,5,20); 

//text load
  textFont(f,25); 
  fill(255); 
textMode(CENTER);  
  
  // Step 6: Display Text
  text ( "You and your.... third dimension." ,mouseX-200,mouseY+75); 
  
}




   
void mouseReleased() {
   //action mouse click
  //mooninites mouth big
  frameRate(30);
  noStroke();
 
}

