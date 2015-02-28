
// Here is the background
void setup(){
  //set the window size
size(200,200);
smooth();
}

void draw() {
    //draw a pink background
background(250,150,200);

// draw starburst from center of screen
stroke(255);
strokeWeight(abs(mouseX-pmouseX));
line(100,7,mouseX,mouseY);
line(35,110,mouseX,mouseY);
line(150,50,mouseX,mouseY);
line(148,70,mouseX,mouseY);
line(180,100,mouseX,mouseY);
line(176,180,mouseX,mouseY);
line(120,178,mouseX,mouseY);
line(110,190,mouseX,mouseY);
line(56,180,mouseX,mouseY);
line(30,140,mouseX,mouseY);
line(20,44,mouseX,mouseY);
line(58,30,mouseX,mouseY);
line(74,10,mouseX,mouseY);
line(138,14,mouseX,mouseY);

// set CENTER mode
rectMode(CENTER);

// set rectangle tip fill
fill(255);
strokeWeight(1);

//Draw rectangle tips
rect(100,7,5,5);
rect(35,110,5,5);
rect(150,50,5,5);
rect(148,70,5,5);
rect(180,100,5,5);
rect(176,180,5,5);
rect(120,178,5,5);
rect(110,190,5,5);
rect(56,180,5,5);
rect(30,140,5,5);
rect(20,44,5,5);
rect(58,30,5,5);
rect(74,10,5,5);
rect(138,14,5,5);

// Draw center of starburst
fill(250,15,200);
ellipse(mouseX,mouseY,45,45);
fill(250,55,200);
ellipse(mouseX,mouseY,40,40);
fill(mouseX,25,mouseY);
ellipse(mouseX,mouseY,35,35);

println("What is your wish?");
}



