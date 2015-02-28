
//Everything else by Sherin Kwan (YSDN Interactivity 1006)
//Original Rain Code by James Davidson at http://openprocessing.org/sketch/17476

void setup(){
  size (400, 250);
  noStroke();
  noCursor();
  background(25);
  fill(25);
  smooth();
  rectMode(CORNERS);
}


void draw(){
  
  fill(40);
  rect(0,0,width,height);

  // Edited Rain code from James Davidson (used integers to simplify and condense many lines of code)
 
  noStroke();
  for (int x = 4;x<900; x += 1) {
  fill(random(100, 255));
  ellipse(x,random(900), 4, 6);
  }
 
  noStroke();
  fill(40);
  rect(mouseX+75,mouseY+600,mouseX-75,mouseY-120);          // rectangle behind umbrella to block out snow underneath
 // fill(40, 200);
  //rect(mouseX+105,mouseY+610,mouseX-105,mouseY-130);  
  // umbrella cane below 
  stroke(255);
  strokeWeight(5);  
  line(mouseX, mouseY, pmouseX, mouseY-140);               // centre pole
  line(mouseX, mouseY, mouseX-10, mouseY+10);              // handle part number 1
  line(mouseX-10, mouseY+10, mouseX-20, mouseY+10);        // handle part number 2
  line(mouseX-20, mouseY+10, mouseX-30, mouseY+5);         // handle part number 3
  line(mouseX-30, mouseY+5, mouseX-30,mouseY-5);           // handle part number 4
  
  // umbrella spokes below
  strokeWeight(3);
  line(pmouseX, mouseY-131, pmouseX-50, mouseY-120);       //left
  line(pmouseX, mouseY-131, pmouseX-25, mouseY-110);       //left centre
  line(pmouseX, mouseY-131, pmouseX+50, mouseY-120);       //right
  line(pmouseX, mouseY-131, pmouseX+25, mouseY-110);       //right centre
  
  strokeWeight(3);
  line(pmouseX-50, mouseY-120, pmouseX-75, mouseY-90);    //left
  line(pmouseX-25, mouseY-110, pmouseX-45, mouseY-75);    // left centre
  line(pmouseX+50, mouseY-120, pmouseX+75, mouseY-90);    //right
  line(pmouseX+25, mouseY-110, pmouseX+45, mouseY-75);    // right centre
  
  //colours assigned to keys below
  strokeWeight(0.3);
  stroke(40);
  //noStroke();
   if (key == 'a' || key == 'A') {
        fill(206, 60, 55, 125); 
    } else if (key == 's' || key == 'S') {
        fill(255, 165, 30, 125);
    } else if (key == 'd' || key == 'D') {
        fill(255, 235, 0, 125);
    } else if (key == 'f' || key == 'F') {
        fill(128, 250, 75, 125);
    } else if (key == 'g' || key == 'G') {
        fill(28, 116, 229, 125);
    } else if (key == 'h' || key == 'H') {
        fill(160, 67, 255, 125);
    } else if (key == 'j' || key == 'J') {
        fill(255, 67, 150, 125);
    } else if (key == 'k' || key == 'K') {
        fill(0, 125);
    } else {
        fill(255, 150);                          // default black, 125 alpha
    } 
    
  //center triangles below
  triangle(pmouseX, mouseY-75, pmouseX-25, mouseY-110, pmouseX+25, mouseY-110);    //middle triangle
  triangle(pmouseX, mouseY-75, pmouseX+45, mouseY-75, pmouseX+25, mouseY-110);     //middle right side
  triangle(pmouseX, mouseY-75, pmouseX-25, mouseY-110, pmouseX-45, mouseY-75);     //middle left side 
  triangle(pmouseX, mouseY-131, pmouseX-25, mouseY-110, pmouseX+25, mouseY-110);   //top triangle
  
  //right side triangles below
  triangle(pmouseX+50, mouseY-120, pmouseX+45, mouseY-75, pmouseX+25, mouseY-110); //middle
  triangle(pmouseX+50, mouseY-120, pmouseX+45, mouseY-75, pmouseX+75, mouseY-90);  //right
  triangle(pmouseX+50, mouseY-120, pmouseX, mouseY-131, pmouseX+25, mouseY-110);   //left
  
  //left side triangles
  triangle(pmouseX-50, mouseY-120, pmouseX-45, mouseY-75, pmouseX-25, mouseY-110); //middle
  triangle(pmouseX-50, mouseY-120, pmouseX-45, mouseY-75, pmouseX-75, mouseY-90);  //left
  triangle(pmouseX-50, mouseY-120, pmouseX, mouseY-131, pmouseX-25, mouseY-110);   //right
  
  fill(255);
  noStroke();
  rect(0,225, 900, 600);
}

