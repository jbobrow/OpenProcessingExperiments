
void setup(){
size(600,600);
frameRate(40);
background(255);
}

color strokeVal = color(61);

void draw(){
//background(255);

ellipseMode(CORNERS);
rectMode(CORNERS);

if(mousePressed==true){
fill(0, 0, 0, 20);
rect(0, 0, width, height);
strokeVal = color(255,mouseY-170,0);
}

if(mousePressed==false){
fill(255, 255, 255,150);
rect(0, 0, width, height);
strokeVal = 61;
}

noStroke();
smooth();
pushMatrix();
translate(-170,-180);


// Ears
fill(247,120,0);
triangle(pmouseX+160,pmouseY+20,mouseX+140,mouseY+80,mouseX+160,mouseY+80);
triangle(pmouseX+180,pmouseY+20,mouseX+180,mouseY+80,mouseX+200,mouseY+80);

// Body
fill(86);
ellipse (mouseX+140,mouseY+120,mouseX+200,mouseY+180);
ellipse (mouseX+140,mouseY+180,mouseX+200,mouseY+240);
fill(111);
ellipse (mouseX+150,mouseY+150,mouseX+190,mouseY+210);

// Upper Arms
fill(228,110,37);
rect(mouseX+60,mouseY+110,mouseX+140,mouseY+130);
rect(mouseX+200,mouseY+110,mouseX+280,mouseY+130);

// Shoulders
fill(61);
ellipse(mouseX+120,mouseY+100,mouseX+160,mouseY+140);
ellipse(mouseX+180,mouseY+100,mouseX+220,mouseY+140);

// Head
fill(247,148,30);
ellipse(mouseX+139,mouseY+59,mouseX+201,mouseY+121);
triangle(mouseX+140,mouseY+100,mouseX+200,mouseY+100,mouseX+170,mouseY+135);

// Eyes
stroke(255,mouseY-170,0);
strokeWeight(3.5);
line(mouseX+143,mouseY+90,mouseX+160,mouseY+100);
line(mouseX+180,mouseY+100,mouseX+197,mouseY+90);
noStroke();

// Lower Arms
fill(247,148,30);
ellipse(mouseX+20,mouseY+100,mouseX+80,mouseY+220);
ellipse(mouseX+260,mouseY+100,mouseX+320,mouseY+220);

// Claws
stroke(strokeVal);
strokeCap(SQUARE);
strokeWeight(4.0);
// Outer
line(mouseX+40,mouseY+210,pmouseX+43,pmouseY+235);
line(mouseX+298,mouseY+210,pmouseX+295,pmouseY+235);
// Middle
line(mouseX+50,mouseY+210,pmouseX+53,pmouseY+235);
line(mouseX+288,mouseY+210,pmouseX+285,pmouseY+235);
// Inner
line(mouseX+60,mouseY+210,pmouseX+63,pmouseY+235);
line(mouseX+278,mouseY+210,pmouseX+275,pmouseY+235);
noStroke();

// Mid Legs
fill(228,110,37);
rect(mouseX+100,mouseY+260,mouseX+120,mouseY+300);
rect(mouseX+240,mouseY+260,mouseX+220,mouseY+300);

// Feet
fill(247,148,30);
triangle(mouseX+120,mouseY+280,mouseX+140,mouseY+280,pmouseX+100,pmouseY+360);
triangle(mouseX+200,mouseY+280,mouseX+220,mouseY+280,pmouseX+240,pmouseY+360);

// Upper Legs
fill(61);
ellipse(mouseX+90,mouseY+200,mouseX+150,mouseY+280);
ellipse(mouseX+190,mouseY+200,mouseX+250,mouseY+280);

popMatrix();

}
