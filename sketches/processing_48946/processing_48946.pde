
float x = 100;
float y = 100;
float w = 60;
float h = 60;
float eyeSize = 16;


void setup() {
size(640,480);
background (0);
  colorMode(RGB, 100);
noStroke();
 smooth();
 frameRate(30);
}


void draw(){

//modes
ellipseMode(CENTER);
rectMode(CENTER);

//ears
fill(29,82,69);
triangle(330, 220, 350, 240, 350, 215);
triangle(330, 220, 290, 240, 290, 215);
//inside ear pinks
fill(80,16,48);
triangle(330, 220, 347, 235, 347, 220);
triangle(330, 220, 293, 235, 293, 220);

//arms
fill(29,82,69);
rect(305, 270, 7,5);
rect(335, 270, 7,5);

//body
arc(320,268,30,30,PI/2,PI);
arc(320,268,30,30,0,PI/2);

//feet
ellipse(310,282,10,8);
ellipse(330,282,10,8);

//head
fill(29,82,69);
ellipse(320,240,60,60); 

//eyes whites
fill(100);
ellipse(300,240,25,25); 
ellipse(340,240,25,25);

//eye blue rings
fill(mouseX,0,mouseY);
ellipse(300,240,20,20);
ellipse(340,240,20,20);

//mouth
fill(0);
ellipse(320,255,10,7);

//eye black
ellipse(300,240,13,13);
ellipse(340,240,13,13);

//white glimmer in eyes
fill(100);
ellipse(305,238,7,5);
ellipse(345,238,7,5);

//nose
fill(80,16,48);
triangle(315,247,325,247,320,250);


//CLAWSSS
fill(100);
//left hand
ellipse(302,268,3,3);
ellipse(302,272,3,3);
//right hand
ellipse(338,268,3,3);
ellipse(338,272,3,3);
//left foot
ellipse(305,285,3,3);
ellipse(308,287,3,3);
ellipse(311,287,3,3);
//right foot
ellipse(329,287,3,3);
ellipse(332,287,3,3);
ellipse(335,285,3,3);


}

void mousePressed(){
  println("You're getting very sleepy...");
  
}



