
void setup(){
size(700,400); // sketch window
rectMode(CENTER); //rect will be in the center
mouseX = width/2; // shapes will start in the middle
mouseY = height/3;// shapes will start in the middle
}

void draw(){
  
  background(mouseX,mouseY,255);// white background
  
  if (mouseY-23 <= height*0){ // my guy will not go out of the barrier at the top bottom of the screen
  mouseY=23;}
  
  if (mouseY+110 >=height) {// my guy will not go out of the barrier at the bottom of the screen
    mouseY=280;}
  
  if (mouseX-50 <=width*0) { //my guy will not go out of the barrier left of the screen
    mouseX=30;}
    
  if (mouseX+50 >=width) {//my guy will not go out of the barrier left of the screen
     mouseX=668;}
  
//drawing the antana
stroke(0);
fill(193); //light gray interior
rect(mouseX,mouseY-3,3,30); // antanna gets attached to the head         // will move with mouse
fill(255,0,0); // colour red
ellipse(mouseX,mouseY-20,6,6); // circle gets attached to top of rect    //will move with mouse


// drawing the Head
stroke(0); //black outline
fill(193); // light gray head
rect(mouseX,mouseY+40,60,60); //head will be in the center    // will move with mouse

//drawing the legs
stroke(0);
fill(108); // gray
rect(mouseX,mouseY+77,25,13); // Part of the legs gets attached to head // will move with mouse
rect(mouseX,mouseY+90,15,13); // another part of the legs are attached //will move with mouse
rect(mouseX,mouseY+103,6,13); // another part is attached             //will move with mouse
fill(mouseX,0,mouseY); // changes colour when moved about screen
ellipse(mouseX,mouseY+110,16,16); // last part of the legs are attached   // will move with mouse

//drawing the face
stroke(0);
fill(255); //black interior
ellipse(mouseX-16,mouseY+27,16,16); //circuler eyes  // will move with mouse
ellipse(mouseX+16,mouseY+27,16,16); //circuler eye   // will move with mouse

stroke(0);
fill(0); // colour black
ellipse(mouseX-16,mouseY+27,5,5); //black pupils   // will move with mouse
ellipse(mouseX+16,mouseY+27,5,5); //black pupils    // will move with mouse
stroke(255);
fill(0); // colour black
rect(mouseX-5,mouseY+45,5,5); //nose  // will move with mouse
rect(mouseX+5,mouseY+45,5,5); //nose  // will move with mouse
rect(mouseX-0,mouseY+55,5,10); //mouth  // will move with mouse
}
void keyPressed() { // will appear when a key is pressed 
  frameRate(25);
  //drawing the left arm
stroke(0); // black
line(mouseX-30,mouseY+40,pmouseX-50,pmouseY+70); //line of the arm // will move with mouse
rect(mouseX-50,mouseY+70,8,8); //joint of the arm                  // will move with mouse
line(mouseX-50,mouseY+70,pmouseX-50,pmouseY+100); //rest of the arm // will move with mouse
rect(mouseX-50,mouseY+90,8,8); // hand // will move with mouse
line(mouseX-50,mouseY+105,pmouseX-50,pmouseY+100); // finger 1// will move with mouse
line(mouseX-50,mouseY+90,pmouseX-55,pmouseY+105); //finger 2// will move with mouse
line(mouseX-45,mouseY+105,pmouseX-50,pmouseY+90); //finger 3// will move with mouse

//drawing the right arm
stroke(0); // black
line(mouseX+30,mouseY+40,pmouseX+50,pmouseY+70); //line of the arm// will move with mouse
rect(mouseX+50,mouseY+70,8,8); //joint of the arm// will move with mouse
line(mouseX+50,mouseY+70,pmouseX+50,pmouseY+100); //rest of the arm// will move with mouse
rect(mouseX+50,mouseY+90,8,8); // hand// will move with mouse
line(mouseX+50,mouseY+105,pmouseX+50,pmouseY+100); // finger 1// will move with mouse
line(mouseX+50,mouseY+90,pmouseX+55,pmouseY+105); //finger 2// will move with mouse
line(mouseX+45,mouseY+105,pmouseX+50,pmouseY+90); //finger 3// will move with mouse
}
void mousePressed(){
  frameRate(1);
  stroke(0);
fill(255,0,0); //red 
ellipse(mouseX-16,mouseY+27,5,5); //red pupils// will move with mouse
ellipse(mouseX+16,mouseY+27,5,5); //red pupils// will move with mouse
fill(255,150,25);// yellow
ellipse(mouseX,mouseY-20,6,6); //changes yellow
}


