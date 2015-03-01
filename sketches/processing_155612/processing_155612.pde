
void setup () {
size(500, 500);
background(255,108,145);
}

void draw() {
background(255,108,145);
fill(255,255,255);
ellipse(100,46,76,87);// eyeball 1
ellipse(187,46,76,87); // eyeball 2
ellipse(332,158,76,87); // eyeball 3
ellipse(250,158,76,87); // eyeball 4
fill(250,145,34);
ellipse(332,256,76,84);// eyeball 5
ellipse(245,256,76,84);// eyeball 6
fill(200,254,129);
fill(0,0,0);
ellipse(100+((mouseX-250)/12),49+((mouseY-250)/12),23,34); //pupil 1
ellipse(187+((mouseX-250)/12),49+((mouseY-250)/12),23,34); //pupil 2
ellipse(345+((mouseX-250)/12),158+((mouseY-250)/12),23,34);// pupil 3
ellipse(257+((mouseX-250)/12),158+((mouseY-250)/12),23,34); // pupil 4
ellipse(325+((mouseX-250)/12),256+((mouseY-250)/12),23,34); // pupil 5
ellipse(235+((mouseX-250)/12),256+((mouseY-250)/12),23,34); // pupil 6

}

