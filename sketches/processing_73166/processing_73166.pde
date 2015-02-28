
madCat madCat1;
madCat madCat2;


PFont font;

//----------------------------------------------------------

void setup() {
  size( 512, 512 );        // size of the window
  smooth();                // antialiasing 
  madCat1 = new madCat (1,1);
  madCat2 = new madCat (100,100);
   PFont font = createFont("Arial", 12);
}

//-----------------------------------------------------------

void draw() {
background( 255 );       // white background

//float factor = constrain(mouseX/10,0,5);
madCat1.jiggle(2);
madCat1.draw();
madCat1.unhide_spikes (2.5);
madCat1.colour_change (mouseX,mouseY);
//madCat2.draw();
madCat2.colour_change (mouseX+100,mouseY+100);

}

//-------------------------------------------------------------


//-------------------------------------------------------------

class madCat {
  
// madCat's Variables--------------
float localX = 256;
float localY = 256;

//color darkBlue1 = color (35,67,108);
//color darkBlue2 = color (25,72,131);
//color darkBlue3 = color (21,49,85);
//color lightBlue1 = color (140,255,247);
//color lightBlue2 = color (129,167,216);
color medGrey1 = color (100);
color lightRed1 = color (224,18,73);
color lightRed2 = color (255,46,64);
color black1 = color (0);

//Colour_change variables
  //medblue
float mBR1 = 53;
float mBG1 = 110;
float mBB1 = 165;
 //darkblue1
float dBR1 = 35;
float dBG1 = 67;
float dBB1 = 108;
  //darkblue2
float dBR2 = 25;
float dBG2 = 72;
float dBB2 = 131;
  //darkBlue3
float dBR3 = 21;
float dBG3 = 49;
float dBB3 = 85;
  //lightblue
float lBR1 = 140;
float lBG1 = 255;
float lBB1 = 247;
//lightblue2
float lBR2 = 129;
float lBG2 = 167;
float lBB2 = 216;

//Unhide_spikes variables
float spikeL = (80);
float spikeR = (80);

float spikeL2 = (80);
float spikeR2 = (80);

//---------------------------------

// Constructor --------------------

madCat (float localX, float localY){
  this.localX=localX;
  this.localY=localY;
}
//---------------------------------


// Jiggle madCat
  void jiggle(float speed) {
    // Change the location of madCat randomly
    if (mousePressed == true){
    localX = localX + random(-1,1)*speed;
    localY = localY + random(-1,1)*speed;
    // Constrain Zoog to window
    localX = constrain(localX,0,width);
    localY = constrain(localY,0,height);
    }  
}
  
//---------------------------------
  
void draw () {  

smooth();
noStroke();
ellipseMode(CORNERS);
rectMode(CORNERS);

//torso
//waist
fill(dBR1, dBG1, dBB1);
ellipse(localX-30,localY-110,localX+30,localY-60);
//chest
fill(dBR2,dBG2,dBB2);
ellipse(localX-40,localY-170,localX+40,localY-90);
//head
fill(mBR1,mBG1,mBB1);
ellipse(localX-20,localY-220,localX+20,localY-160);
fill(lBR2,lBG2, lBB2);
triangle(localX-30,localY-220,localX,localY-190,localX+30,localY-220);


//legs and feet
fill(medGrey1);
stroke(black1);
strokeWeight(5);
line(localX-20,localY-30,localX-10,localY-5);
line(localX+20,localY-30,localX+10,localY-5);
noStroke();
ellipse(localX-20,localY-10, localX,localY);
ellipse(localX,localY-10,localX+20,localY);
//moar legs
fill(mBR1,mBG1,mBB1);
ellipse(localX-30,localY-80,localX-10,localY-20);
ellipse(localX+10,localY-80,localX+30,localY-20);
//arms and hands

//bicep
fill(lBR1,lBG1,lBB1);
rect(localX-40,localY-160,localX-60,localY-110);
rect(localX+40,localY-160,localX+60,localY-110);
//shoulders
fill(mBR1,mBG1,mBB1);
ellipse(localX-65,localY-170,localX-35,localY-140);
ellipse(localX+35,localY-170,localX+65,localY-140);
//hands
fill(medGrey1);
ellipse(localX-60,localY-30,localX-30,localY);
ellipse(localX+30,localY-30,localX+60,localY);
//spikes
fill(dBR3,dBG3,dBB3);
triangle(localX-90,localY-120,localX-60,localY-110,localX-80,localY-70);
triangle(localX+65,localY-110,localX+90,localY-120,localX+80,localY-70);
      //Hidden Spikes
      fill(dBR3,dBG3,dBB3);
      triangle(localX-spikeL,localY-70,localX-60,localY-50,localX-60,localY-30);
      triangle(localX+spikeR,localY-70,localX+60,localY-50,localX+60,localY-30);
      //second set of spikes (that are hidden)
      triangle(localX-spikeL2,localY-40,localX-60,localY-40,localX-60,localY-20);
      triangle(localX+spikeR2,localY-40,localX+60,localY-40,localX+60,localY-20);
//forearms
fill(mBR1,mBG1,mBB1);
ellipse(localX-80,localY-130,localX-30,localY-10);
ellipse(localX+30,localY-130,localX+80,localY-10);
//end arms and hands



//eyes
strokeWeight(1);
fill(lightRed1);
stroke(lightRed2);
triangle(localX-15,localY-190,localX-5,localY-175,localX-5,localY-190);
triangle(localX+5,localY-190,localX+5,localY-175,localX+15,localY-190);

} // end draw


//---------------------------------

void colour_change (float localX, float localY) {
  
  this.localX=localX;
  this.localY=localY;
  
//Follow mouse on left click
if(mousePressed==true){
    localX = mouseX;
    localY = mouseY;
   
    mBR1 = constrain (mBR1, 53, 250);
    mBG1 = constrain (mBG1, 110, 170);
    mBB1 = constrain (mBB1, 20, 165); 
    mBR1 = mBR1 + 4;
    mBG1 = mBG1 +1;
    mBB1 = mBB1 -3;
        
    dBR1 = constrain (dBR1, 35, 142);
    dBG1 = constrain (dBG1, 67, 93);
    dBB1 = constrain (dBB1, 108, 14);
    dBR1 = dBR1 + 3;
    dBG1 = dBG1 + 1;
    dBB1 = dBB1 - 3;
    
    
    
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
    
    dBR1 = constrain (dBR1, 35, 142);
    dBG1 = constrain (dBG1, 67, 93);
    dBB1 = constrain (dBB1, 108, 14); 
    dBR1 = dBR1 -4;
    dBG1 = dBG1 -1;
    dBB1 = dBB1 +3;
    }
} //end colour_change

//---------------------------------


void unhide_spikes (float spikeGrow) {
  if (mousePressed==true) {
  spikeL = spikeGrow + spikeL;
  spikeR = spikeGrow + spikeR;
      spikeL = constrain (spikeL, 20,165); 
      spikeR = constrain (spikeR, 20,165); 
  } // end mousepressed
  
  else if (mousePressed==false) {
    spikeL = spikeL-spikeGrow  ;
    spikeR = spikeR-spikeGrow  ;
      spikeL = constrain (spikeL, 50,165); 
      spikeR = constrain (spikeR, 50,165); 
  } // end if mousepressed==false
  
  
  //--------sequential spike movement - not working-------
  
  if (spikeL == 120 || spikeL > 120){
    spikeL2 = spikeL2+spikeGrow ;
    spikeR2 = spikeR2+spikeGrow ;
    spikeL2 = constrain (spikeL2, 50,120);
    spikeR2 = constrain (spikeR2, 50,120);
  }
  
  else if (mousePressed==false) {
    spikeL2 = spikeL2-spikeGrow  ;
    spikeR2 = spikeR2-spikeGrow  ;
      spikeL2 = constrain (spikeL2, 50,120); 
      spikeR2 = constrain (spikeR2, 50,120); 
  } 
} //end unhide_spikes

} //end class madCat



//---------------------------------

//Dis how you jiggle
