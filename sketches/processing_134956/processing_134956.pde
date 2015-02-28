
int whichColor = 0;
int rectPressed;
int value = 0;
int randomX;
int randomY;
int randomH;
int randomW;
int arcHeight = 50;
int arcWidth = 250;
int arcSize = 100;
int alpha;


void setup(){
 
size(400,600);
background(165,150,135);
noStroke();
println("Click anywhere to begin");
println("Hit any key on keyboard to reset");

  fill(88,85,78);
rect(0,0,220,300); //background layer, top left rect
   
  fill(179,136,58,60); //opacity 60%
rect(200,0,200,340); // background layer, bottom left corner
   
  fill(255,239,189); 
rect(260,280,150,320); //bottom right rect
    
  fill(132,128,119,50); //opacity 50%
rect(0,280,300,400); //bottom brown rect
 
 
//Layer 2  - Larger Quads
 
 
  fill(54,49,45);
quad(120,200,160,240,0,400,0,320); //middle bottom left quad
 
 fill(39,40,39);
quad(240,560,320,480,400,560,400,600); //bottom right quad
 
  fill(255,239,189);
quad(100,600,220,480,320,600,220,600); //bottom irght quad
 
  fill(163,147,114);
quad(300,580,320,600,400,600,340,540); //bottom right quad
 
  fill(179,136,58);
quad(0,400,120,280,220,380,0,600); //mid bottom left quad
 
  fill(70,70,78);
quad(0,440,20,420,100,500,0,600);
//mid bottom left quad, appears from corner


quad(0,160,20,140,40,180,0,220); //blue quad
 
//Layer 3
 
  fill(90,70,46);
quad(0,0,80,0,120,40,80,80);
 

quad(0,80,40,40,80,80,0,160);
 
 
 
//Layer 4
 
  fill(70,70,78);
rect(100,0,60,140); //Upper navy rectangle
 
  fill(255,239,189);
rect(100,120,40,60); //small bright yellow rectangle
   
  fill(90,70,46); //long rectangle
rect(220,0,60,260);
 
 
//Layer 5
  
  stroke(0);
line(240,80,240,220);
 
line(250,120,250,240);
 
line(260,100,260,240);
 
//Central Circle

  noStroke();
  fill(54,49,45);
ellipseMode(RADIUS);
ellipse(220,260,40,40);
 
 noFill();
ellipseMode(CENTER);
arc(arcHeight*2, arcWidth, arcSize*2, arcSize*2, radians(290), radians(420));
 
 
 
}
//Background Layer - Large Rectangles
void draw(){
}
 
  
void mouseClicked () {
float R = random(39,170);
float G = random(70,147);
float B = random(39,189);
    
    noStroke();
    rectMode(CENTER);

  //generate random size of rectangle (limit max 101)
  randomH = int(random(101));
  randomW = int(random(101));
    
  //generate random rectangle location
  randomX = int(random(400));
  randomY = int(random(600));
  
  //generate random alphas
  alpha = int(random(100,255));
    
  //generate random color of rectangle
  int r = int(random(175));
  int g = int(random(120));
  int b = int(random(98));
    
  stroke(r, g, b);
  fill (r, g, b);

if(whichColor == 0){
    noStroke();
    fill(132,128,119,alpha);
    rect(mouseX, mouseY,randomW,randomH);
  }
  else if(whichColor == 1) {
    noStroke();
    fill(39, 40, 39,alpha);
    rect(mouseX, mouseY,randomW,randomH);
  }
  else if(whichColor == 2) {
    noStroke();
    fill(179, 136, 58, alpha);
    rect(mouseX, mouseY,randomW,randomH);
  }
   
  else if(whichColor == 3) {
    noStroke();
    fill(70, 70, 78, alpha); //blue
    rect(mouseX, mouseY,randomW,randomH);
  }  
  
  else if(whichColor == 4) {
    noStroke();
    fill(163,147,114, alpha);
    rect(mouseX, mouseY,randomW,randomH);
  }   
 
   else if(whichColor == 5) {
    noStroke();
    fill(90,70,46,alpha);
    rect(mouseX, mouseY,randomW,randomH);
  } 
   else if(whichColor == 6) {
    noStroke();
    fill(255,239,189,alpha);
    rect(mouseX, mouseY,randomW,randomH);
  }  
    else if(whichColor == 7) {
    noStroke();
    fill(90,70,46,alpha); //
    rect(mouseX, mouseY,randomW,randomH);
  } 
  whichColor++;
  if(whichColor > 7) {
    whichColor = 0;
  }
}
   
 
   
//click any key and it is supposed to reset itself

void keyPressed() { 
    //if (keyCode == ENTER) {

//this is all the same background information found above.
background(165,150,135);
noStroke();
rectMode(CORNER);

  fill(88,85,78);
rect(0,0,220,300); //background layer, top left rect
   
  fill(179,136,58,60); //opacity 60%
rect(200,0,200,340); // background layer, bottom left corner
   
  fill(255,239,189);
rect(260,280,150,320); //bottom right rect
    
  fill(132,128,119,50); //opacity 50%
rect(0,280,300,400); //bottom brown rect
 
 
//Layer 2  - Larger Quads
 
 
  fill(54,49,45);
quad(120,200,160,240,0,400,0,320); //middle bottom left quad
 
 fill(39,40,39);
quad(240,560,320,480,400,560,400,600); //bottom right quad
 
  fill(255,239,189);
quad(100,600,220,480,320,600,220,600); //bottom right quad
 
  fill(163,147,114);
quad(300,580,320,600,400,600,340,540); //bottom right quad
 
  fill(179,136,58);
quad(0,400,120,280,220,380,0,600); //mid bottom left quad
 
  fill(70,70,78); //blue
quad(0,440,20,420,100,500,0,600);
//mid bottom left quad, appears from corner


quad(0,160,20,140,40,180,0,220); //blue quad
 
//Layer 3
 
  fill(90,70,46);
quad(0,0,80,0,120,40,80,80);
 

quad(0,80,40,40,80,80,0,160);
 
 
 
//Layer 4
 
  fill(70,70,78); //blue
rect(100,0,60,140); //Upper navy rectangle
 
  fill(255,239,189);
rect(100,120,40,60); //small bright yellow rectangle
   
  fill(90,70,46); //long rectangle
rect(220,0,60,260);
 
 
//Layer 5
  
  stroke(0);
line(240,80,240,220);
 
line(250,120,250,240);
 
line(260,100,260,240);
 
//Central Circle

  noStroke();
  fill(54,49,45);
ellipseMode(RADIUS);
ellipse(220,260,40,40);

   
  }

 
/* For my interactive piece, I wanted the user to be able to generate their own Braque inspired rectangles.  They generate random sizes and colors.  My hope then would have been that if the user clicked ENTER, the canvas would reset itself.  This works to an extent but it still shifts upwards for some reason.  Also the colors are a bit too random, I would like to place better limits on the colors that the code can generate. Overall though, this is what I wanted the piece to do so I am happy with it.*/


