
//Eyes following mouse 

float mx;
float my;
float nx;
float ny;
float easing = 0.05;
int radius = 25;

void setup () {
  size (400,500);
  ellipseMode(CORNER);
  rectMode(CORNERS);
  smooth();
}

void draw() {
  background (255);
  
 //FACE
 
  fill(90);
    rect (100, 100, 300,300);
    strokeWeight(3);
    
 //antena 

if ( 125 < mouseX && mouseX < 275 && 25 < mouseY  && mouseY < 60 ) {
  strokeWeight (5);
  stroke (250, 204, 0);
} else {
  strokeWeight (2);
 stroke (0); 
}
 
    line (155,100,125,25); 
    line (125,25,165,50);
    line (165,50,185,35);
    line (185,35,200,50);
    line (200,50,220,30);
    line (220,30,240,60);
    line (240,60,275,25);
    line (275,25,245,100);
    
stroke(0);
strokeWeight (2);

 //ears
    fill (50);
    rect (100,250,70,150);
    rect (300,250,330,150);
    
 // mouth
  //  line (180, 245, 185, 260);
  //  line (220, 245, 215, 260);
  fill (90);
    bezier (180,245,185,260, 215,260,220,245);
  
 //nose 
    fill (50);
    ellipse (185, 225, 30,20);
 
 //BLINK 
 
 if (mousePressed) {
  fill(90);
  rect(125,175,175,225);
  rect(225,175,275,225);
  
  }else {   
    
  //acceleration of eye
  if (abs(mouseX-mx)>0.1){
    mx = mx + (mouseX - mx ) * easing;
  }
  if (abs(mouseY - my)>0.1){
    my = my + (mouseY - my)* easing;
  }
  
  mx = constrain (mx, 125, 150);
  my = constrain (my, 175, 200);
  fill (0);
  rect (125,175,175,225);
  fill (255);
  ellipse (mx, my, radius, radius);
  
    if (abs(mouseX-mx)>0.1){
    nx = nx + (mouseX - nx ) * easing;
  }
  if (abs(mouseY - ny)>0.1){
    ny = ny + (mouseY - ny)* easing;
  }
  
  nx = constrain (nx, 225, 250);
  ny = constrain (ny, 175, 200);
  fill (0);
  rect (225,175,275,225);
  fill (255);
  ellipse (nx, ny, radius, radius);
  

  }
}


