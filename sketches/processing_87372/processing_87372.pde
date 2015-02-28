

int i=0,j=0;
void setup(){
  background(0,0,0);
  size(800,800);
  frameRate(100);
  noStroke();
}


void draw(){
  
  do{// Code from Oscar Martinez
    fill(random(100),0,0);
    rect(j,i,10,10);
    i+=20;
    if(i>height){
     j=j+20;
     i=0;
    }
    if(j>=width){
      i=0;
      j=0;
    }
   }while(0!=0);   /*bucle infinito*/ 
  
    
  
  ////background///
fill(0,0,255);
rect(0,0,400,200);

// 255 means 100% opacity.
fill(255,0,0,255);
rect(0,0,800,40);

// 75% opacity.
fill(255,0,0,191);
rect(0,50,800,40);

// 55% opacity.
fill(255,0,0,127);
rect(0,100,800,40);

// 25% opacity.
fill(255,0,0,63);
rect(0,150,800,40);

fill(23,227,222);
rect(0,400,400,200);

// 255 means 100% opacity.
fill(255,0,0,255);
rect(0,400,800,40);

// 75% opacity.
fill(255,0,0,191);
rect(0,450,800,40);

// 55% opacity.
fill(255,0,0,127);
rect(0,500,800,40);

// 25% opacity.
fill(255,0,0,63);
rect(0,550,800,40);


//////////////
  stroke(21,40,157);
  strokeWeight(20);
  fill(95,92,134);
  quad(200, 600, 450, 700, 620, 500, 300, 400);
  stroke(1);
  strokeWeight(0);
  fill(211,208,192);
  rect(315, 500, 180, 120, 7);
  fill(255,255,255);
  ellipse(400, 400, 300, 300);
  
  fill(21,40,157);
  rect(347, 655, 150, 300, 10);
////glasses////
stroke(77,86,165);
strokeWeight(3);
fill(255);
rect(315, 358, 70, 45, 10);
rect(415, 358, 70, 45, 10);
line(385, 380, 415, 380);
line(485, 380, 520, 350);
line(315, 380, 270, 355);

///Nose///
stroke(102,103,113);
line(400, 380, 430, 430);
line(400, 380, 380, 430);
ellipse(407, 430, 25, 25);

///mouth///
stroke(247,219,207);
line(450, 490, 350, 490);
line(430, 500, 370, 500);

///Hair////
stroke(46,49,157);
fill(46,49,157);
rect(300, 270, 200, 50, 5);
rect(260, 310, 50, 50, 5);
rect(495, 310, 50, 50, 5);
rect(485, 290, 50, 35, 5);
rect(275, 290, 50, 35, 5);
rect(328, 250, 151, 50, 5);

///Left Ear/////
stroke(34,131,129);
fill(34,51,131);
ellipse(280, 390, 50, 50);
///Right Ear/////
stroke(34,131,129);
fill(34,51,131);
ellipse(515, 390, 50, 50);

 /////left Eye??? 
strokeWeight(1);
ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
fill(255);  // Set fill to white
ellipse(350, 380, 15, 15); // Draw white ellipse using RADIUS mode

ellipseMode(CENTER);  // Set ellipseMode to CENTER
fill(37,39,62);  // Set fill to gray
ellipse(350, 380, 15, 15);  // Draw gray ellipse using CENTER mode

/////right Eye////
ellipseMode(RADIUS);  // Set ellipseMode to RADIUS
fill(255);  // Set fill to white
ellipse(450, 380, 15, 15); // Draw white ellipse using RADIUS mode

ellipseMode(CENTER);  // Set ellipseMode to CENTER
fill(37,39,62);  // Set fill to gray
ellipse(450, 380, 15, 15);  // Draw gray ellipse using CENTER mode
  
}


