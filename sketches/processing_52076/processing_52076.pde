




void setup(){

size(500, 500);
smooth();
background(255);

}


void draw(){
  
//left eye (lopez)
fill(255);

//black eye
float eyeleftx = map(mouseX, 0, width, 72 - 20, 216 + 20);
float eyelefty = map(mouseY, 0, height, 72 - 20, 288 +20); 
ellipse(width/2 - 107, 180, eyeleftx, eyelefty);

//ellipse(width/2 - 107, 180, 144, 216);
fill(1);

float pupilleftx = map(mouseX, 0, width, 105 + 25, 182 - 25);
float pupillefty = map(mouseY, 0, height, 184 + 25, 259 - 25);

ellipse(pupilleftx, pupillefty, 75, 75);

fill(255);

float mx = map(mouseX, 0, width, 105 + 6 , 182 - 6 );
float my = map(mouseY, 0, height, 184 + 6 , 259 - 6 );

//ellipse(121, 209, 17, 17);

ellipse(mx, my, 17, 17);



//right eye
fill(255);

//black eye
float eyerightx = map(mouseX, 0, width, 72 - 20, 216 + 20);
float eyerighty = map(mouseY, 0, height, 72 - 20, 288 + 20);
ellipse(width/2 + 107, 180, eyerightx, eyerighty);

//ellipse(width/2 + 107, 180, 144, 216);
fill(1);

float pupilrightx = map(mouseX, 0, width, 318 + 25, 394 - 25);
float pupilrighty = map(mouseY, 0, height, 184 + 25, 259 - 25);

ellipse(pupilrightx, pupilrighty, 75, 75);


fill(255);

float mxr = map(mouseX, 0, width, 318 + 6, 394 - 6);
float myr = map(mouseY, 0, height, 184 + 6, 259 - 6);

//ellipse(337, 209, 17, 17);

ellipse(mxr, myr, 17, 17);

//mouth
rectMode(CENTER);


rect(width/2, height - 68, 40, 2);

//nose
stroke(1);
strokeWeight(1);
arc(250, 330, 50, 50, radians(70), radians (110));

//println(mouseX);
//println(mouseY);
}




//saveFrame("comp1.png");


