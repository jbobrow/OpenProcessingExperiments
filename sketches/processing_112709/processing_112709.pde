
size(600, 600);
background(119, 142, 217);

//white vertical line
int positionX = 0;
int positionY = 0;
int lineHeight = 600;
int lineSpacing= 70;
stroke(255); //line colour
strokeWeight(3); //line thickness

for (int i=0; i<lineHeight; i++){
  line (positionX, positionY, positionX, positionY + lineHeight);
  positionX = positionX + 70;
}

//black vertical line

int positionA = 0;
int positionB = 0;
int lineLength = 600;
int lineSpace= 60;
stroke(0); //line colour
strokeWeight(4); //line thickness 


for (int i=0; i<lineLength; i++){
  line (positionA, positionB, positionA, positionB + lineLength);
  positionA = positionA + 60;
}

//tortoise horizontal line

strokeWeight(5); //thickness 
stroke(61, 243, 255); //colour


for (int i = 0; i < 600; i = i+50) {
  line(0, i, 600, i);
}

//white horizontal line

strokeWeight(8); //thickness  
stroke(255); //colour


for (int i = 0; i < 600; i = i+30) {
  line(0, i, 600, i);
}


//body
strokeWeight(3); //white outline
fill(112,47,47); //ear colour
ellipse(300, 600, 400, 170); //ear shape and size
fill(250, 148, 141); //inside ear colour
ellipse(120, 120, 110, 110); //inside ear shape and size

//left side arm 
strokeWeight(3); //white outline
fill(112,47,47); //ear colour
ellipse(100, 550, 200, 120); //ear shape and size
fill(250, 148, 141); //inside ear colour
ellipse(120, 120, 110, 110); //inside ear shape and size

//right side arm 
strokeWeight(3); //white outline
fill(112,47,47); //ear colour
ellipse(500, 550, 200, 120); //ear shape and size
fill(250, 148, 141); //inside ear colour
ellipse(120, 120, 110, 110); //inside ear shape and size

//left ear
strokeWeight(3); //white outline
fill(112,47,47); //ear colour
ellipse(120, 120, 170, 170); //ear shape and size
fill(250, 148, 141); //inside ear colour
ellipse(120, 120, 110, 110); //inside ear shape and size

//right ear
strokeWeight(3); //white outline
fill(112,47,47); //ear colour
ellipse(480, 120, 170, 170); //ear shape and size
fill(250, 148, 141); //inside ear colour
ellipse(480, 120, 110, 110); //inside ear shape and size

//head
stroke(255);
strokeWeight(3); //white outline
fill(112,47,47); //head colour
ellipse(300, 300, 495, 495); //head shape and size

//mouth
stroke(186, 175, 131); {
strokeWeight(3);
fill(186, 175, 131); //fur colour
ellipse(300, 350, 300, 300); //fur around mouth shape and size
fill(0); //mouth colour
ellipse(302, 440, 40, 40); //mouth shape and size
}

//left eye
stroke(255);
strokeWeight(3);
fill(255);{ 
ellipse(200, 250, 150, 150); //eye size
fill(0, 171, 255); //blue iris
ellipse(210, 250, 90, 90); //irus size and position
fill(0); //pupil colour
ellipse(220, 250, 30, 30); //pupil size
}


//right eye 
fill(255); { 
ellipse(400, 250, 150, 150); //eye size
fill(0, 171, 255); //blue iris
ellipse(390, 250, 90, 90); //irus size and position
fill(0); //pupil colour
ellipse(380, 250, 30, 30); //pupil size and position
}

//nose
stroke(0);
strokeWeight(0);
rect(255, 270, 90, 100, 20); //nose shape
fill(255); //nostril colour
ellipse(285, 300, 20, 20); //nostril sizes
ellipse(315, 300, 20, 20);









