
class Bug {

// fields

boolean button = false;

int locX;
int locY;
int spots;

int bugHead;
int bugBody;

int fillR;
int fillG;
int fillB;

int yellowR = 255;
int yellowG = 247;
int yellowB = 7;

int grass = 200;
int grassW = 6;

//constructor

Bug(int tempLocX, int tempLocY, int tempBugHead, int tempBugBody, int tempSpots, int tempFillR, int tempFillG, int tempFillB) {
locX      = tempLocX;
locY      = tempLocY;
bugHead   = tempBugHead;
bugBody   = tempBugBody;
spots     = tempSpots;
fillR  =  tempFillR;
fillG  =  tempFillG;
fillB  =  tempFillB;

}

// methods

void display() {
  
  colorMode(RGB,255);
  noStroke();
  
 //moon
   fill(255,255,255,220);
   ellipse(50,50,50,50);
   fill(0);
   ellipse(70,50,50,50);
  
 //grass
 fill(87,130,90);
    ellipse(grass-25,grass-25,grassW-4,grass-5);
    ellipse(grass-23,grass-25,grassW-5,grass-66);
    ellipse(grass-30,grass-25,grassW-4,grass-24);
    ellipse(grass-32,grass-25,grassW-2,grass-40);
    
    ellipse(grass-76,grass-33,grassW-5,grass-45);
    ellipse(grass-77,grass-44,grassW-3,grass-49);
    ellipse(grass-73,grass-55,grassW-3,grass-55);
    ellipse(grass-88,grass-77,grassW-3,grass-54);
    
    ellipse(grass-76,grass-33,grassW-5,grass-45);
    ellipse(grass-77,grass-44,grassW-3,grass-49);
    ellipse(grass-73,grass-55,grassW-3,grass-55);
    ellipse(grass-88,grass-77,grassW-3,grass-54);
    
    ellipse(grass-76,grass-90,grassW-5,grass-45);
    ellipse(grass-77,grass-70,grassW-3,grass-49);
    ellipse(grass-73,grass-81,grassW-3,grass-55);
    ellipse(grass-88,grass-44,grassW-3,grass-54);
    
    ellipse(grass-76,grass-150,grassW-5,grass-45);
    ellipse(grass-77,grass-100,grassW-3,grass-49);
    ellipse(grass-73,grass-122,grassW-3,grass-55);
    ellipse(grass-88,grass-88,grassW-3,grass-54);
    
    ellipse(grass-155,grass-71,grassW-3,grass-45);
    ellipse(grass-129,grass-88,grassW-3,grass-66);
    ellipse(grass-188,grass-99,grassW-4,grass-22);
    ellipse(grass-100,grass-95,grassW-3,grass-49);
    
    ellipse(grass-75,grass-88,grassW-3,grass-45);
    ellipse(grass-87,grass-84,grassW-3,grass-52);
    ellipse(grass-33,grass-52,grassW-4,grass-55);
    ellipse(grass-54,grass-33,grassW-3,grass-50);
    
    ellipse(grass-10,grass-88,grassW-4,grass-45);
    ellipse(grass-9,grass-84,grassW-2,grass-52);
    ellipse(grass-4,grass-52,grassW-4,grass-55);
    ellipse(grass-5,grass-33,grassW-5,grass-50);
      
    ellipse(grass+80,grass+39,grassW-2,grass+10);
    ellipse(grass+180,grass+35,grassW-3,grass+5);
    ellipse(grass+90,grass+80,grassW-5,grass+10);
    ellipse(grass+50,grass+39,grassW-2,grass+100);
    ellipse(grass+30,grass+35,grassW-3,grass+50);
    ellipse(grass+20,grass+80,grassW-5,grass+10);
    
    ellipse(grass-30,grass-88,grassW-3,grass-145);
    ellipse(grass-90,grass-84,grassW-3,grass-152);
    ellipse(grass-110,grass-52,grassW-4,grass-155);
    ellipse(grass-196,grass-33,grassW-3,grass-150);
 
 //head
  fill(40);
  ellipse(mouseX,mouseY-55,bugHead,bugHead);
  
  //antenna
  stroke(40);
  strokeWeight(1);
  line(mouseX-10,mouseY-70,pmouseX -27 ,pmouseY -80 );
  line(mouseX+10,mouseY-70,pmouseX +27,pmouseY -80);

 
  //body
  stroke(40);
  strokeWeight(3);
  fill(fillR,fillG,fillB);
  ellipse(mouseX,mouseY,bugBody,bugBody+10);
  
  //stripe
  line(mouseX,mouseY-55,mouseX,mouseY+54);
  
  //spots
  noStroke();
  fill(40);
    //middle spots
  ellipse(mouseX+15,mouseY+5,spots,spots);
  ellipse(mouseX-15,mouseY+5,spots,spots);
    //top layer spots
  ellipse(mouseX+35,mouseY-25,spots,spots);
  ellipse(mouseX-35,mouseY-25,spots,spots);
    //bottom layer spots
  ellipse(mouseX+30,mouseY+35,spots,spots);
  ellipse(mouseX-30,mouseY+35,spots,spots);
  
  if ( keyPressed ) {
    button = true;
  } else { 
    button = false;
  }
  
  
  if (button) {
    
    noStroke();
    fill(yellowR,yellowG,yellowB);
    //body
    ellipse(mouseX,mouseY,bugBody,bugBody+10);
    
    //stripe
    stroke(0);
    line(mouseX,mouseY-55,mouseX,mouseY+54);
      //middle spots
    fill(0);
    ellipse(mouseX+15,mouseY+5,spots,spots);
    ellipse(mouseX-15,mouseY+5,spots,spots);
      //top layer spots
    ellipse(mouseX+35,mouseY-25,spots,spots);
    ellipse(mouseX-35,mouseY-25,spots,spots);
      //bottom layer spots
    ellipse(mouseX+30,mouseY+35,spots,spots);
    ellipse(mouseX-30,mouseY+35,spots,spots);

  }

  
}
}



