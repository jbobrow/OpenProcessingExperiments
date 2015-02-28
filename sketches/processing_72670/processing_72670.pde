
// creature's local origin
int localX = 256;
int localY = 256;

color darkBlue1 = color (35,67,108);
color darkBlue2 = color (25,72,131);
color darkBlue3 = color (21,49,85);
color lightBlue1 = color (140,255,247);
color lightBlue2 = color (129,167,216);
//color medBlue1 = color (53,110,165);
float mBR1 = 53;
float mBG1 = 110;
float mBB1 = 165;

//replace
//fill(medBlueR,MedBlueG,medBlueB);

color medGrey1 = color (100);
color lightRed1 = color (224,18,73);
color lightRed2 = color (255,46,64);
color black1 = color (0);


void setup() {
  size( 512, 512 );        // size of the window
  smooth();                // antialiasing 
}


void draw() {
  background( 255 );       // white background



//Follow mouse on left click
if(mousePressed==true){
    localX = mouseX;
    localY = mouseY;
   // scale (.6);
    mBR1 = constrain (mBR1, 53,250);
    mBG1 = constrain (mBG1, 110,170);
    mBB1 = constrain (mBB1, 20,165); 
    mBR1 = mBR1 + 4;
    mBG1 = mBG1 +1;
    mBB1 = mBB1 -3;
    
} 

else if(mousePressed==false){
localX = localX;
localY = localY;
    mBR1 = constrain (mBR1, 53,250);
    mBG1 = constrain (mBG1, 110,170);
    mBB1 = constrain (mBB1, 20,165); 
    mBR1 = mBR1 -4;
    mBG1 = mBG1 -1;
    mBB1 = mBB1 +3;

}


smooth();
noStroke();
fill(darkBlue1);
//torso
ellipseMode(CORNERS);

ellipse(localX-30,localY-110,localX+30,localY-60);
fill(darkBlue2);

ellipse(localX-40,localY-170,localX+40,localY-90);
rectMode(CORNERS);
fill(lightBlue1);

rect(localX-40,localY-160,localX-60,localY-110);

rect(localX+40,localY-160,localX+60,localY-110);

fill(mBR1,mBG1,mBB1);

ellipse(localX-65,localY-170,localX-35,localY-140);

ellipse(localX+35,localY-170,localX+65,localY-140);

ellipse(localX-20,localY-220,localX+20,localY-160);

fill(lightBlue2);

triangle(localX-30,localY-220,localX,localY-190,localX+30,localY-220);
//hands
fill(medGrey1);
ellipse(localX-60,localY-30,localX-30,localY);
ellipse(localX+30,localY-30,localX+60,localY);
//legs and feet
stroke(black1);
strokeWeight(5);

line(localX-20,localY-30,localX-10,localY-5);

line(localX+20,localY-30,localX+10,localY-5);
noStroke();

ellipse(localX-20,localY-10, localX,localY);

ellipse(localX,localY-10,localX+20,localY);

//arms and hands
fill(darkBlue3);
triangle(localX-90,localY-120,localX-60,localY-110,localX-80,localY-70);
triangle(localX+65,localY-110,localX+90,localY-120,localX+80,localY-70);
fill(mBR1,mBG1,mBB1);
ellipse(localX-80,localY-130,localX-30,localY-10);
ellipse(localX+30,localY-130,localX+80,localY-10);

//moar legs
ellipse(localX-30,localY-80,localX-10,localY-20);
ellipse(localX+10,localY-80,localX+30,localY-20);

//eyes
strokeWeight(1);
fill(lightRed1);
stroke(lightRed2);

triangle(localX-15,localY-190,localX-5,localY-175,localX-5,localY-190);

triangle(localX+5,localY-190,localX+5,localY-175,localX+15,localY-190);

}
