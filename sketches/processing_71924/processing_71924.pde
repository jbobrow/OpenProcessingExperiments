
//Dynamic Alien Experiment

void setup(){
size(500,500);   //Set the size of the window
smooth();
frameRate(30);
}
void draw(){
  
background(255);  //Draw a white background
strokeWeight(1);  //1 pixel outline


rectMode(CENTER);   //Sets center mode
ellipseMode(CENTER);

stroke(0);        //Black Outline
fill(150);
rect(mouseX,mouseY,45,60);  //Body

stroke(0);
fill(200);
ellipse(mouseX,mouseY-50,60,70);  //Head

stroke(0);
fill(0,mouseX,mouseY);
ellipse(mouseX-15,mouseY-60,20,15);    //Right Eye
ellipse(mouseX+15,mouseY-60,20,15);   //Left Eye

stroke(0);
fill(0);
ellipse(mouseX-15,mouseY+27,30,10);  //Right Foot
ellipse(mouseX+15,mouseY+27,30,10);  //Left Foot

strokeWeight(10);
stroke(150);
line(mouseX-27,mouseY-20,pmouseX-50,pmouseY); //Right Arm
line(mouseX+27,mouseY-20,pmouseX+50,pmouseY);  //Left Arm
}



