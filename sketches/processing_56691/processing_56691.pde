
//variables
int x = 60; // x coordinate
int y = 80; //y coordinate
int bw = 80; //body width
int bh = 50; //body height
int eh = 40; //ellipse width
int ew = 3; //ellipse height

float easing = 0.02;

void setup () {
size(400, 400);
smooth();
}

void draw () {
background(255);

int targetX = mouseX;
  x += (targetX - x) * easing;
  
//head
noStroke();
fill(252, 246, 34); //fill yellow
rect(x+10, y-50, bh+10, bw-40);
ellipseMode(CORNER);
fill(255);
stroke(0);
ellipse(x+20, y/2, eh/4, ew+7);
ellipse(x+50, y/2, eh/4, ew+7);
ellipseMode(CENTER);
fill(100);

//eyes
ellipse(x+55, y-35, eh/8, ew+2);
ellipse(x+25, y-35, eh/8, ew+2);
fill(255);

//ears
noStroke();
fill(234, 40, 40); //fill red
rect(x+5, y/2, bw/16, bh-30);
rect(x+70, y/2, bw/16, bh-30);
stroke(0);

//mouth 
noStroke();
     if (mousePressed) {
       fill(150);
       ellipse(x+40, y-20, 15, 15);
       fill(252, 246, 34);
     } else {
fill(150); }
rect(x+30, y-25, bw/4, bh/10);


//neck
stroke(1);
fill(0, 183, 194); //fill teal
ellipseMode(CORNER);
ellipse(x+20, y-10, eh, ew);
ellipse(x+20, y-7.5, eh, ew);
ellipse(x+20, y-5, eh, ew);
ellipse(x+20, y-2.5, eh, ew);

//left antenna
ellipse(x+20, y-51.5, eh/4, bh/25);
ellipse(x+20, y-53.5, eh/4, bh/25);
line(x+25, y-55, x+25, y-65);

//right antennae
ellipse(x+50, y-51.5, eh/4, bh/25);
ellipse(x+50, y-53.5, eh/4, ew/1.5);
line(x+55, y-55, x+55, y-65);
fill(255); //fill white

//arms
strokeWeight(4);  // Stroke weight to 4 pixels
line(x-5, y+10, x, y+10);
line(x+80, y+10, x+85, y+10);
strokeWeight(1); //Stroke weight back to 1 pixel
fill(252, 246, 34); //fill yellow
noStroke();
rect(x-15, bw, bw/8, bh);
rect(x+85, bw, bw/8, bh);
rect(x, y, bw, bh);
//inner rect and lines
fill(0, 183, 194); //fill teal
stroke(234, 40, 40);
rect(x+10, y+20, bw-20, bh-30);
line(x+10, y+25, x+15, y+25);
line(x+15, y+25, x+17.5, y+20);
line(x+17.5, y+20, x+20, y+35);
line(x+20, y+35, x+22.5, y+25);
line(x+22.5, y+25, x+25, y+30);
line(x+25, y+30, x+27.5, y+20);
line(x+27.5, y+20, x+30, y+35);
line(x+30, y+35, x+32.5, y+25);
line(x+32.5, y+25, x+35, y+40);
line(x+35, y+40, x+37.5, y+30);
line(x+37.5, y+30, x+40, y+30);
line(x+40, y+30, x+42.5, y+20);
line(x+42.5, y+20, x+45, y+35);
line(x+45, y+35, x+50, y+25);
line(x+50, y+25, x+52.5, y+40);
line(x+52.5, y+40, x+55, y+30);
line(x+55, y+30, x+57.5, y+25);
line(x+57.5, y+35, x+60, y+20);
line(x+60, y+20, x+62.5, y+30);
line(x+62.5, y+30, x+65, y+20);
line(x+65, y+20, x+67.5, y+25);
line(x+67.5, y+25, x+70, y+25);
stroke(0); //stroke black
//body

//left leg
fill(0, 183, 194); //fill teal
ellipse(x+10, y+50, eh/2, ew);
ellipse(x+10, y+52.5, eh/2, ew);
ellipse(x+10, y+55, eh/2, ew);
ellipse(x+10, y+57.5, eh/2, ew);
ellipse(x+10, y+60, eh/2, ew);
ellipse(x+10, y+62.5, eh/2, ew);
ellipse(x+10, y+65, eh/2, ew);
ellipse(x+10, y+67.5, eh/2, ew);
ellipse(x+10, y+70, eh/2, ew);
ellipse(x+10, y+72.5, eh/2, ew);
ellipse(x+10, y+75, eh/2, ew);
fill(0); //fill white
rect(x+5, y+77.5, bh-20, bw/8);

//right leg
fill(0, 183, 194); //fill teal
ellipse(x+50, y+50, eh/2, ew);
ellipse(x+50, y+52.5, eh/2, ew);
ellipse(x+50, y+55, eh/2, ew);
ellipse(x+50, y+57.5, eh/2, ew);
ellipse(x+50, y+60, eh/2, ew);
ellipse(x+50, y+62.5, eh/2, ew);
ellipse(x+50, y+65, eh/2, ew);
ellipse(x+50, y+67.5, eh/2, ew);
ellipse(x+50, y+70, eh/2, ew);
ellipse(x+50, y+72.5, eh/2, ew);
ellipse(x+50, y+75, eh/2, ew);
fill(0); //fill black
rect(x+45, y+77.5, bh-20, bw/8);

//wind up
noFill();
line(x+40, y-50, x+40, y-55);
ellipseMode(CORNER);
ellipse(x+35, y-60, eh/8, ew+3);
ellipse(x+40, y-60, eh/8, ew+3);

}

