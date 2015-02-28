
int x = 10; //xposition
int y = 0; //yposition
int d = 15; //diameter
int l = 10; //leglength

void setup () {
  size(400, 400);
  smooth();
  strokeWeight(2);
}

void draw () {
stroke(0);
background(100);

//left arm
fill(200); //light grey
triangle(x+145, y+187, x+148, y+205, x+100, y+250); //arm
quad(x+98, y+235, x+120, y+244, x+106, y+264, x+95, y+258); //hand

//legs
triangle(x+140, y+260, x+160+l, y+270, x+155, y+320+l); //left 
triangle(x+230-l, y+290, x+255, y+280, x+245, y+340+l); //right

//body
fill(200); //light grey
quad(x+144, y+187, x+229, y+190, x+240, y+300, x+135, y+275); //main
fill(80); //dark grey
quad(x+229, y+189, x+265, y+160, x+280, y+246, x+240, y+300); //side
quad(x+150, y+200, x+205, y+205, x+208, y+275, x+148, y+260); //door
fill(180); //lighter grey
ellipse(x+198, y+240, d+10, d+10); //door handle

//antenna
line(x+190, y+110, x+210, y+70); //longest
line(x+210, y+70, x+195, y+60); //middle
line(x+195, y+60, x+199, y+48); //shortest
fill(155); //light grey
ellipse(x+202, y+40, d+17, d+17); //tip

//robot head
fill(200); //light grey
quad(x+100, y+100, x+260, y+90, x+260, y+190, x+110, y+185); //main
fill(80); //dark grey
quad(x+260, y+90, x+300, y+120, x+300, y+160, x+260, y+190); //side

//right arm
fill(200); //light grey
triangle(x+240, y+195, x+260, y+190, x+300, y+260); //arm
quad(x+285, y+255, x+305, y+245, x+305, y+266, x+293, y+275); //hand

//mouth
fill(255); //white
quad(x+135, y+160, x+225, y+158, x+227, y+189, x+137, y+186);
line(x+170, y+160, x+172, y+187); //teeth 1st line
line(x+208, y+159, x+210, y+188); //teeth 2nd line

//eyes
noStroke();
fill(30); //dark grey
ellipse(x+145, y+132, d-50, d-50); //right
ellipse(x+220, y+136, d-28, d-28); //left
}

