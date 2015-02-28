

PImage a;  // Declare variable "a" of type PImage
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;

int ellipseSize = 1;

void setup() {
  size(760, 700);
  background(#FFFFFF);
  textFont(createFont("Arial", 24));

  a = loadImage("mer.png");  // Load the image into the program
  b = loadImage("mor.png");
  c = loadImage("sig.png");
  d = loadImage("cra.png");
  e = loadImage("ah.png");
  f = loadImage("ed.JPG");
  textFont(createFont("helvetica", 24));
}

void draw() {

  background(255, 255, 255);


  ellipse(mouseX, mouseY, ellipseSize, ellipseSize);


  //rect(width/2+190, 0, 192, 700);
  //rect(0, 0, 192, 700);
  //rect(width/4+190, 0, 192, 700);
 

  if (mouseX>width/4 && mouseX<width/2) {
    fill(#BD2832);
    rect(width/4, 0, width/4, height);
  }
  else fill(255);
  
  if (mouseX>3*width/4) {
    fill(#BD2832);
    rect(3*width/4, 0, width, height);
  }
  else fill(255);
  
  if (mouseX<width/4) {
    fill(#BD2832);
    rect(0, 0, 192, 700);
  }
  else fill(255);
  
  if (mouseX>width/2 && mouseX<3*width/4) {
    fill (#BD2832);
    rect(width/2, 0, width/4, 700);
  }
  else fill(255);
  
  fill(255);
rect(0, 0, 760, 110);
rect(0, 175, 760, 2);
//image(f, 230, 20, 280, 80);
  //noCursor();
  //image(e, mouseX, mouseY);
  
    fill(#BD2832);
  noStroke();
  rect(width/4, 110, 2, 510);
  rect(width/2, 110, 2, 510);
  rect(width/4+380, 110, 2, 510);
  //triangle(30, 75, 58, 100, 86, 75);
  
   image(a, -5, 500, 200, 200);
  image(b, 150, 500, 200, 200);
  image(c, 300, 500, 200, 200);
  image(d, 465, 500, 300, 200);
    






  fill(255, 255, 255);
  textSize(20);
  text("MORNINGSIDE", width/2-165, 150);
  text("MERCHISTON", width/4-160, 150);
  text("SIGHTHILL", width/4+235, 150);
  text("CRAIGLOCKHART", width/4+390, 150);
  textSize(10);
  text("No Workshops Available", width/2-150, 200);//morningside
  text("Dissertation management", width/4+220, 200);//sighthill
  text("24/01, 10:30 - 12:00, 2.D.12", width/4+220, 215); 
  text("Evaluating & using Sources", width/4+220, 235);
  text("31/01, 15:30 - 17:00, 2.D.03", width/4+220, 250);
  text("Academic Writing", width/4+220, 270);
  text("06/02, 14:00 - 16:00, 2.D.03", width/4+220, 285);
  text("Structuring your essay 14/02", width/4+220, 305);
  text("14/02, 15:00 - 17:00, 3.D.10", width/4+220, 320);
  text("Writing scientific reports", width/4+220, 340);
  text("21/02, 09:30 - 11:30, 2.D.03", width/4+220, 355);
  text("Referencing & Plagiarism", width/4+220, 375);
  text("28/02, 15:30 - 17:00, 2.D.03", width/4+220, 390);
  text("Oral Presentations", width/4+415, 200);//craiglockhart
  text("22/01, 15:00 - 17:00, 3/03", width/4+415, 215);
  text("Dissertation Management", width/4+415, 235);
  text("29/01, 09:00 - 10:30, 1/06", width/4+415, 250);
  text("Evaluating & Using Sources", width/4+415, 270);
  text("05/02, 09:30 - 11:00, 1/06", width/4+415, 285);
  text("Academic Writing", width/4+415, 305);
  text("18/02, 14:00 - 16:00, 3/03", width/4+415, 320); 
  text("Referencing & Plagiarism", width/4+415, 340);
  text("19/02, 09:30 - 11:00, 1/06", width/4+415, 355);
  text("Writing Business Reports", width/4+415, 375);
  text("27/02, 10:00 - 12:00, 1/10", width/4+415, 390);
  text("Dissertation Management", width/4-160, 200);//merchiston
  text("23/01, 15:00 - 16:30, B32", width/4-160, 215);
  
  fill(0);
  textSize(40);
  text("Napier Student Hub", width/4+20, height/4-120);
  textSize(20);
  text("Academic Skills Workshops", width/4+70, height/4-90);
}



