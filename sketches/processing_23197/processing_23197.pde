
//Character based on Radiohead bear
//Blinking and mouth opening animation by Jason Wall

void setup(){
  size(600,600);
  frameRate(10);
  smooth();
}

void draw(){
  background(0);
   stroke(255,0,0);
strokeWeight(5);
fill(255);


ellipse(mouseX-80,mouseY-85,100,100); //left ear
ellipse(mouseX+80,mouseY-85,100,100); //right ear

ellipse(mouseX-80,mouseY-85,60,60); //left inner ear
ellipse(mouseX+80,mouseY-85,60,60); //right inner ear

ellipse(mouseX,mouseY,200,200); //head

ellipse(mouseX-50,mouseY-10,100,100); //left eye
ellipse(mouseX+50,mouseY-10,100,100); //right eye

fill(255,0,0);
ellipse(mouseX-50,mouseY-10,20,100); //left inner eye
ellipse(mouseX+50,mouseY-10,20,100); //right inner eye

line(mouseX-90,mouseY+40,mouseX+90,mouseY+40); //upper lip
line(mouseX-25,mouseY+40,mouseX,mouseY+100); //toothline left of centre
line(mouseX+25,mouseY+40,mouseX,mouseY+100); //toothline right of centre
line(mouseX-50,mouseY+85,mouseX-25,mouseY+40); //toothline 2nd left of centre
line(mouseX+50,mouseY+85,mouseX+25,mouseY+40); //toothline 2nd right of centre
line(mouseX-75,mouseY+40,mouseX-50,mouseY+85); //toothline 3rd left of centre
line(mouseX+75,mouseY+40,mouseX+50,mouseY+85); //toothline 3rd right of centre
line(mouseX-75,mouseY+40,mouseX-80,mouseY+55); //toothline 4th left of centre
line(mouseX+75,mouseY+40,mouseX+80,mouseY+55); //toothline 4th right of centre
}

void mousePressed(){
  stroke(255,0,0);
strokeWeight(5);
fill(255);

ellipse(mouseX-80,mouseY-85,100,100); //left ear
ellipse(mouseX+80,mouseY-85,100,100); //right ear

ellipse(mouseX-80,mouseY-85,60,60); //left inner ear
ellipse(mouseX+80,mouseY-85,60,60); //right inner ear

ellipse(mouseX,mouseY,200,200); //head

ellipse(mouseX-50,mouseY-10,100,20); //left eye *BLINKS!!!*
ellipse(mouseX+50,mouseY-10,100,100); //right eye

fill(255,0,0);
ellipse(mouseX-50,mouseY-10,20,20); //left inner eye
ellipse(mouseX+50,mouseY-10,20,100); //right inner eye

line(mouseX-90,mouseY+40,mouseX+90,mouseY+40); //upper lip
line(mouseX-25,mouseY+40,mouseX,mouseY+100); //toothline left of centre
line(mouseX+25,mouseY+40,mouseX,mouseY+100); //toothline right of centre
line(mouseX-50,mouseY+85,mouseX-25,mouseY+40); //toothline 2nd left of centre
line(mouseX+50,mouseY+85,mouseX+25,mouseY+40); //toothline 2nd right of centre
line(mouseX-75,mouseY+40,mouseX-50,mouseY+85); //toothline 3rd left of centre
line(mouseX+75,mouseY+40,mouseX+50,mouseY+85); //toothline 3rd right of centre
line(mouseX-75,mouseY+40,mouseX-80,mouseY+55); //toothline 4th left of centre
line(mouseX+75,mouseY+40,mouseX+80,mouseY+55); //toothline 4th right of centre
}

void keyPressed(){
    stroke(255,0,0);
strokeWeight(5);
fill(255);
background(0);

// *MOUTH OPENS!!!*

ellipse(mouseX-80,mouseY-85+25,100,100); //left ear
ellipse(mouseX+80,mouseY-85+25,100,100); //right ear

ellipse(mouseX-80,mouseY-85+25,60,60); //left inner ear
ellipse(mouseX+80,mouseY-85+25,60,60); //right inner ear

ellipse(mouseX,mouseY+25,200,200); //head

ellipse(mouseX-50,mouseY-10,100,100); //left eye
ellipse(mouseX+50,mouseY-10,100,100); //right eye

fill(255,0,0);
ellipse(mouseX-50,mouseY-10,20,100); //left inner eye
ellipse(mouseX+50,mouseY-10,20,100); //right inner eye

line(mouseX-95,mouseY+40,mouseX+95,mouseY+40); //upper lip WIDENS
line(mouseX-25,mouseY+40,mouseX,mouseY+100); //toothline left of centre
line(mouseX+25,mouseY+40,mouseX,mouseY+100); //toothline right of centre
line(mouseX-50,mouseY+85,mouseX-25,mouseY+40); //toothline 2nd left of centre
line(mouseX+50,mouseY+85,mouseX+25,mouseY+40); //toothline 2nd right of centre
line(mouseX-75,mouseY+40,mouseX-50,mouseY+85); //toothline 3rd left of centre
line(mouseX+75,mouseY+40,mouseX+50,mouseY+85); //toothline 3rd right of centre
line(mouseX-75,mouseY+40,mouseX-80,mouseY+55); //toothline 4th left of centre
line(mouseX+75,mouseY+40,mouseX+80,mouseY+55); //toothline 4th right of centre


line(mouseX-25,mouseY+40+25,mouseX,mouseY+100+25); //toothline left of centre GOES DOWN
line(mouseX+25,mouseY+40+25,mouseX,mouseY+100+25); //toothline right of centre GOES DOWN
line(mouseX-50,mouseY+85+25,mouseX-25,mouseY+40+25); //toothline 2nd left of centre GD
line(mouseX+50,mouseY+85+25,mouseX+25,mouseY+40+25); //toothline 2nd right of centre GD
line(mouseX-75,mouseY+40+25,mouseX-50,mouseY+85+25); //toothline 3rd left of centre GD
line(mouseX+75,mouseY+40+25,mouseX+50,mouseY+85+25); //toothline 3rd right of centre GD
line(mouseX-75,mouseY+40+25,mouseX-80,mouseY+55+25); //toothline 4th left of centre GD
line(mouseX+75,mouseY+40+25,mouseX+80,mouseY+55+25); //toothline 4th right of centre GD

line(mouseX-95,mouseY+40,mouseX-80,mouseY+55); //toothline 5th left of centre APPEARS
line(mouseX+95,mouseY+40,mouseX+80,mouseY+55); //toothline 5th right of centre APPEARS
}
 
 
      

