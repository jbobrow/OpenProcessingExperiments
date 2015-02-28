


void setup () {

size ( 400, 350) ;

smooth();

}


void draw () {

background (155, 200, 255);

//head
strokeWeight (2);
fill (255);
ellipse (200, 150, 270, 150);
strokeWeight (1);

//left eye
fill (255);
ellipse (150, 130, 80, 40);

//left pupil
fill (0);
if(mousePressed==true) {
  line (145, 130, 175, 130);
}
else {
ellipse ( 160, 130, 35, 15);
}
//right eye
fill (255);
ellipse (240, 135, 40, 70);

//right pupil
fill (0);
if (mousePressed==true) {
  line (230, 145, 250, 145);
}
else{
ellipse (240, 145, 15, 30);
}
//mouth
strokeWeight(2);
line (120, 180, 140, 200);

line (140, 200, 160, 180);

line (160, 180, 180, 200);

line (180, 200, 200, 180);

line (200, 180, 220, 200);

line (220, 200, 240, 180);

line (240, 180, 260, 200);

line (260, 200, 280, 180);

strokeWeight(1);

//propellor

line ( 200, 75, 200, 50);
fill (255);

triangle (200, 50, 220, 40, 220, 60);
triangle (200, 50, 180, 40, 180, 60);


//hair

//ears



//body
strokeWeight (2.5);
line ( 200, 225, 200, 280);
//right arm
line (200, 250, 220, 260);
if (mousePressed==true){
  line (220, 260, 230, 240);
}
else {
line (220, 260, 240, 250);
}
//left arm
line (200, 250, 180, 260);
line (180, 260, 160, 250);
//right leg
line (200, 280, 220, 295);
line (220, 295, 220, 320);
line (220, 320, 240, 320);
//left leg
line (200, 280, 180, 295);
line (180, 295, 180, 320);
line (180, 320, 160, 320);
strokeWeight(1);

}

