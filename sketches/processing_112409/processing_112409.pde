


//SETUP BY JOANNA

size(600,600);
smooth();
background(242,229,36);

//END OF SETUP

// CHEESE BACKGROUND BY JOANNA

int z = 10;
while(z<600)
{
int x=10;
while (x<630)
{
  noStroke();
  fill(255,255,255);
  ellipse(x + 17, z + 17, 23, 23);
  fill(201,191,42);
  ellipse(x + 5, z + 5, 10, 10);
     fill(227,191,45);
ellipse(x + 20, z + 20, 25, 25);
x=x+110;

}
z=z+110;
}

// END OF CHEESE BACKGROUND

// Text Box by Joshua

smooth();
noStroke();
fill(#3FFA72);
ellipse(300, 445, 200, 100);
triangle(300, 360, 280, 495, 320, 495);

textSize(32);
fill(#080708);
textAlign(CENTER, BOTTOM);
text("I'm a Mouse!", 300, 465);



//BODY BY ANDREW


fill(#DEDEDE); //EVERYTHING LIGHT GREY
strokeWeight(5);
stroke(0);
ellipse(300,200,200,200);

stroke(#7c7c7c);
arc(300, 200, 200, 310, 0, PI, OPEN);

stroke(#000000);
arc(300, 200, 200, 300, 0, PI, OPEN);

noFill();
arc(260, 100, 100, 70, -PI, 0);
arc(175, 95, 70, 90, 0, PI);

// END OF BODY

//EARS BY JAMIE
smooth();
strokeWeight(5);
fill(#7c7c7c);
arc(220,220,85,85,1.80,radians(360)); // Right Ear
arc(380,220,85,85,-3.2,radians(75)); // Left Ear

//END OF EARS

//WHISKERS BY JAMIE

strokeWeight(4); 

//Whiskers Right

line(320,325, 350,300); //TOP
line(320,325, 348,325); //MIDDLE
line(320,325, 350,350); //BOTTOM

//Whiskers Left

line(280,325, 255, 300); //TOP
line(280,325, 253, 325); //MIDDLE
line(280,325, 255, 350); //BOTTOM

//END OF WHISKERS

//EYES AND NOSE BY ANDREW

fill(#000000); //EVERYTHING AFTER BLACK
//left eye
ellipse(270,280,20,30);
//right eye
ellipse(330,280,20,30);
//nose
ellipse(300,325,20,10);

fill(#FFFFFF); //EVERYTHING AFTER WHITE
strokeWeight(1);
ellipse(272,278,5,8);
ellipse(328,278,5,8);

//END OF EYES AND NOSE


// FLOWERS BY JAMIE


strokeWeight(10);
stroke(random(120,255), random(255), random(255)); // create random colors
translate(90,500); // Relocate to position

// Petals

for(int i=0; i<10; i++){
  line(0,0,30,0);
  rotate(TWO_PI / 10);
} // rotate line 36 degrees - repeat 10 times

// Dot

strokeWeight(0);
fill(color(255,255,0));
ellipse(0,0,15,15); 


//END OF FLOWERS





