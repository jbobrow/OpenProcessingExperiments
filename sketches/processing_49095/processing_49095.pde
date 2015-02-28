
void setup() {
size(640,480); //this is doc size//
smooth (); //enables "anti-aliasing"//
frameRate (30);
}
void draw() {
  background(255); // draw a white background//

//set ellipses and rects to CENTER mode//
ellipseMode(CENTER); //tells ellipse to start in center//
rectMode(CENTER); //tells rect dimensions to start from center//

/*
//100 pixel limit zone//
noFill();
stroke(0);
ellipse(mouseX, mouseY -30, 100, 100); 
*/

//spide web lines//
strokeWeight(1);
stroke(0); //identifies black stroke//
fill (255);
line(0, 240, 680, 240);
line(320, 480, 320, 0);
line(640, 0, 0, 480);
line(0, 0, 640, 480);
line(0, 120, 640, 360);
line(0, 360, 640, 120);
line(160, 480, 480, 0);
line(480, 480, 160, 0);


//spider legs//
strokeWeight(3);
//left legs//
line(mouseX-7, mouseY-50, pmouseX-5, pmouseY+2);//left leg 1//
line(mouseX-14, mouseY-50, pmouseX-15, pmouseY+3);//left leg 2//
line(mouseX-21, mouseY-50, pmouseX-25, pmouseY+2);//left leg 3//
line(mouseX-28, mouseY-50, pmouseX-35, pmouseY+1);//left leg 4//
//rt legs//
line(mouseX+7, mouseY-50, pmouseX+5, pmouseY+4); //rt leg 1//
line(mouseX+14, mouseY-50, pmouseX+15, pmouseY+3);//rt leg 2//
line(mouseX+21, mouseY-50, pmouseX+25, pmouseY+2);//rt leg 3//
line(mouseX+28, mouseY-50, pmouseX+35, pmouseY+1);//rt leg 4//


//spider body//
fill(0); // black body fill //
ellipse(mouseX, mouseY -50, 50, 50); //body shape//


//spider head//
fill(0); //identifies a white fill//
stroke (255);
strokeWeight(2);
ellipse(mouseX, mouseY -40, 40, 40); //identifies head//


//spider eyes//
fill(255);//white of eye color//
ellipse(mouseX-10, mouseY-40, 15,15); //left eye shape//
ellipse(mouseX+10, mouseY-40, 15,15); //rt eye shape//
fill (0);//pupil color//
ellipse(mouseX-10, mouseY-40, 8,8); //left eye pupil//
ellipse(mouseX+10, mouseY-40, 8,8); //rt eye pupil//
fill (23, 12, 13);//eye lid color//
arc(mouseX-10, mouseY-40, 16, 16, radians(180),radians(360));//rt eye lid//
arc(mouseX+10, mouseY-40, 16, 16, radians(180),radians(360));//rt eye lid//

}

void mousePressed () {
  println("I want to suck your blood!");
}

