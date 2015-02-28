
void setup() {
  size(600, 600);
}

void draw() {

  background(0);

  //constrain means constrain the object to a certain limit
  float xpos = constrain (mouseX, 175, 225);
  float ypos = constrain (mouseY, 175, 225);

  float xpos2 = constrain (mouseX, 375, 425);
  float ypos2 = constrain (mouseY, 175, 225);
  
  float xpos3 = constrain (mouseX, 125, 175);
  float ypos3 = constrain (mouseY, 295, 345);
  
  float xpos4 = constrain (mouseX, 275, 325);
  float ypos4 = constrain (mouseY, 295, 345);
  
  float xpos5 = constrain (mouseX, 425, 475);
  float ypos5 = constrain (mouseY, 295, 345);
  
  

//arms 
stroke(0,255,0);

fill(100);

line (200,550, 100, 500);
line (400,550, 500, 500);


  rectMode(CENTER);
//neck
noStroke ();
fill(0,150,0);
rect(300,750,200,700);

//antenae

rect(280,55,10,50);
ellipse(280,30, 20,15);

rect(320,55,10,50);
ellipse(320,30, 20,15);


  //face
  fill(0,255,0);
  ellipse (300, 300, 450, 450);

  //eyes 
  fill(255);

  rect (200, 200, 100, 100);
  rect (400, 200, 100, 100);
    rect (300, 320, 100, 100);
        rect (150, 320, 100, 100);
            rect (450, 320, 100, 100);
  
   //iriss
 fill(0,50,0);
 rect (xpos, ypos, 50,50);
   rect(xpos2, ypos2, 50, 50);
   rect(xpos3, ypos3, 50, 50);
      rect(xpos4, ypos4, 50, 50);
         rect(xpos5, ypos5, 50, 50);
         
  //toungue
  noStroke();
  fill(20);
  bezier(200, 435, 210, 470, 410,470, 400, 435);
  
  
  
  //pupils
  fill(0);
  noStroke();
  ellipse(xpos, ypos, 20, 20);
    ellipse(xpos2, ypos2, 20, 20);
  ellipse(xpos3, ypos3, 20, 20);
  ellipse(xpos4, ypos4, 20, 20);
  ellipse(xpos5, ypos5, 20, 20);


fill(50);
  if (mousePressed) {
     

    //iris chaning colour
    fill (0);
    noStroke ();
       rect(xpos2, ypos2, 50, 50);
        rect (xpos, ypos, 50,50);
          rect (xpos3, ypos3, 50,50);
            rect (xpos4, ypos4, 50,50);
        rect (xpos5, ypos5, 50,50);
        
        fill(255);
        if (mousePressed)
        backround fill(253, 15, 15):
        else 
        backround fill(0);

//pupil changing colour
       fill (255,0,0);
         ellipse(xpos, ypos, 20, 20);
        ellipse (xpos2, ypos2, 20,20);
        ellipse (xpos3, ypos3, 20,20);
