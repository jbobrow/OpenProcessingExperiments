
void setup(){
size(300,300);
background(0,0,0);
frameRate(50);
smooth();
}

void draw(){
  
  noStroke();
 rectMode(CORNERS);
  fill(100,50);
  rect(0,0,300,300);

  stroke(150,150-mouseX);
line(0,0,mouseX,mouseY);
stroke(150,mouseX-150);
line(150,0,mouseX,mouseY);


  stroke(150,150-mouseX);
line(150,0,mouseX,mouseY);
stroke(150,mouseX-150);
line(300,0,mouseX,mouseY);

  stroke(150,150-mouseX);
line(150,300,mouseX,mouseY);
  stroke(150,mouseX-150);
line(150,300,mouseX,mouseY);

 stroke(150,150-mouseX);
line(0,300,mouseX,mouseY);
 stroke(150,mouseX-150);
line(300,300,mouseX,mouseY);
}


void mouseDragged(){
  
//sun
fill(255,255,0,150-mouseX);
ellipse(75,mouseX,(mouseY-100)/2,(mouseY-100)/2);

//leftwalls
fill(100,150-mouseX);
triangle(150,300,mouseX,mouseY,150,0);
noStroke();
fill(150,150-mouseX);
triangle(0,0,mouseX,mouseY,0,300);
//leftfloor
fill(225,150-mouseX);
triangle(0,300,mouseX,mouseY,150,300);
//leftsky
fill(150,240,240,150-mouseX);
triangle(150,0,mouseX,mouseY,0,0);


//moon
stroke(150,150-mouseX);
fill(255,255,255,mouseX-150);
ellipse(225,mouseX/5,(mouseY-100)/4,(mouseY-100)/4);

//rightwalls
noStroke();
fill(100,mouseX-150);
triangle(150,300,mouseX,mouseY,150,0);
fill(50,mouseX-150);
triangle(300,300,mouseX,mouseY,300,0);
//rightfloor
fill(125,mouseX-150);
triangle(150,300,mouseX,mouseY,300,300);
//rightsky
fill(70,100,100,mouseX-150);
triangle(300,0,mouseX,mouseY,150,0);
  
}

