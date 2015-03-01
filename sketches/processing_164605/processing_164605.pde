
//Move mouse to make tiny rectangles
//create a 550x500px square and set as background
void setup(){
size(550,550);
//background color is light blue
background(0,0,0);
}
void draw(){
//set these rectangles as a group 1
noStroke();
fill(255,255,255);
rect(mouseX,0,70,70);
rect(0,mouseY,50,50);
//again group 2
noStroke();
fill(255,255,255);
rect(mouseX,100,70,70);
rect(100,mouseY,50,50);
// group 3
noStroke();
fill(255,255,255);
rect(mouseX,200,70,70);
rect(200,mouseY,50,50);
//group 4 
noStroke();
fill(255,255,255);
rect(mouseX,300,70,70);
rect(300,mouseY,50,50);
//group 5
noStroke();
fill(255,255,255);
rect(mouseX,400,70,70);
rect(400,mouseY,50,50);
//group 6
noStroke();
fill(255,255,255);
rect(mouseX,500,70,70);
rect(500,mouseY,50,50);
}



