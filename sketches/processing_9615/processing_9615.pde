
void setup(){
//Size of window
size(400,400);
frameRate(30);
}

void draw() {
//Color of background, and line stroke specifications
background(0); //Black
stroke(255);
smooth();
strokeWeight(3); //A little thicker

//Head
fill(225,0,0); //Red
triangle(mouseX+20,mouseY-40,mouseX+50,mouseY,mouseX-10,mouseY);

//Body
fill(0,200,200); //Light cyan
rect(mouseX,mouseY,40,110);
fill(mouseX,77,mouseY); //Blue
ellipseMode(CORNERS);ellipse(mouseX+10,mouseY+20,mouseX+30,mouseY+40); //Window
line(mouseX+10,mouseY+60,mouseX+10,mouseY+100); //Racing stripes, maybe a ladder
line(mouseX+30,mouseY+60,mouseX+30,mouseY+100);
line(mouseX+10,mouseY+70,mouseX+30,mouseY+70);
line(mouseX+10,mouseY+80,mouseX+30,mouseY+80);
line(mouseX+10,mouseY+90,mouseX+30,mouseY+90);

//Wings
fill(225,0,0); //Red
triangle(mouseX,mouseY+70,mouseX,mouseY+100,mouseX-20,mouseY+100);
triangle(mouseX+40,mouseY+70,mouseX+40,mouseY+100,mouseX+60,mouseY+100);

//Fire!
fill(240,116,22);
triangle(mouseX+10,mouseY+110,mouseX+30,mouseY+110,pmouseX+20,pmouseY+140);
}

void mousePressed() {
//Blast Off!
println("To Infinity...AND BEYOND!");
}

