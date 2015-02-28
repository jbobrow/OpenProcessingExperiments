
PImage a;  // Declare variable "a" of type PImage
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;

int ellipseSize = 1;

void setup() {
  size(displayWidth, displayHeight);
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
    rect(0, 0, width/4, 700);
  }
  else fill(255);
  
  if (mouseX>width/2 && mouseX<3*width/4) {
    fill (#BD2832);
    rect(width/2, 0, width/4, 700);
  }
  else fill(255);
  
  fill(255);
rect(0, 0, 2*width/2, 110);
//rect(0, 175, 760, 2);
//image(f, 230, 20, 280, 80);
  noCursor();
  //image(e, mouseX, mouseY);
  
    fill(#BD2832);
  noStroke();
  rect(width/4, 110, 4, 3*height/4); // red lines
  rect(width/2-1, 110, 4, 3*height/4);
  rect(3*width/4, 110, 4, 3*height/4);
  //triangle(30, 75, 58, 100, 86, 75);
  
   image(a, width/60-30, height/2, width/4+100, height/2); // campus images
  image(b, width/4, height/2, width/4+100, height/2);
  image(c, 2*width/4, height/2, width/4, height/2);
  image(d, 3*width/4-100, height/2, width/4+100, height/2);
    






  fill(255, 255, 255);
  textSize(20);
  text("MORNINGSIDE", 2*width/6-15, 150);
  text("MERCHISTON", width/13, 150);
  text("SIGHTHILL", 12*width/21+20, 150);
  text("CRAIGLOCKHART", 4*width/5+30, 150);
  textSize(10);
  text("No Workshops Available", 2*width/6, 200);//morningside
  text("Dissertation management", 12*width/21, 200);//sighthill
  text("24/01, 10:30 - 12:00, 2.D.12", 12*width/21, 215); 
  text("Evaluating & using Sources", 12*width/21, 235);
  text("31/01, 15:30 - 17:00, 2.D.03", 12*width/21, 250);
  text("Academic Writing", 12*width/21, 270);
  text("06/02, 14:00 - 16:00, 2.D.03", 12*width/21, 285);
  text("Structuring your essay 14/02", 12*width/21, 305);
  text("14/02, 15:00 - 17:00, 3.D.10", 12*width/21, 320);
  text("Writing scientific reports", 12*width/21, 340);
  text("21/02, 09:30 - 11:30, 2.D.03", 12*width/21, 355);
  text("Referencing & Plagiarism", 12*width/21, 375);
  text("28/02, 15:30 - 17:00, 2.D.03", 12*width/21, 390);
  text("Oral Presentations", 4*width/5+50, 200);//craiglockhart
  text("22/01, 15:00 - 17:00, 3/03", 4*width/5+50, 215);
  text("Dissertation Management", 4*width/5+50, 235);
  text("29/01, 09:00 - 10:30, 1/06", 4*width/5+50, 250);
  text("Evaluating & Using Sources", 4*width/5+50, 270);
  text("05/02, 09:30 - 11:00, 1/06", 4*width/5+50, 285);
  text("Academic Writing", 4*width/5+50, 305);
  text("18/02, 14:00 - 16:00, 3/03", 4*width/5+50, 320); 
  text("Referencing & Plagiarism", 4*width/5+50, 340);
  text("19/02, 09:30 - 11:00, 1/06", 4*width/5+50, 355);
  text("Writing Business Reports", 4*width/5+50, 375);
  text("27/02, 10:00 - 12:00, 1/10", 4*width/5+50, 390);
  text("Dissertation Management", width/13, 200);//merchiston
  text("23/01, 15:00 - 16:30, B32", width/13, 215);
  
  fill(0);
  textSize(40);
  text("Napier Student Hub", width/4+175, height/4-150);
  textSize(20);
  text("Academic Skills Workshops", width/4+225, height/4-115);
}


