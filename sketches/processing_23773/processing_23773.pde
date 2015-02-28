
void setup (){
// Set the size of the window
size(300,300);
}

void draw () {
// Draw a white background
background (255);

// draw Albert's head/body
rectMode(CENTER);
rect(150,70,100,40);
rect(150,130,150,80);

//Draw Albert's eyes/ eyeball's
ellipseMode (CENTER);
ellipse (110,50,30,50);
ellipse (190,50,30,60);
stroke (0);
fill (0);
ellipse (190, 50,20,10);
ellipse (110,50,10,40);

//Draw Albert's mouth/ teeth
rectMode (CENTER);
rect(150,110,80,40);
rect(150,130,30,10);
stroke (0);
fill (255);
rect (130,100,10,20);
rect (170,100,10,20);

//Draw Albert's arms/ legs
line (110,170,110,210);
line (190,170,190,210);
line (75,90,30,120);
line (225,90,250,140);

//draw Albert's shoes
stroke (0);
fill (240,0,0);
ellipseMode (CENTER);
ellipse (200,210,20,10);
fill(mouseX,mouseY,100);
ellipse (mouseX, mouseY,20,10);

}



