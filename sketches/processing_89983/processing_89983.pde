
/**************************************************************************
*** International Exchange ************************************************
*** By Stuart Smith *******************************************************
*** Processing Sketch displaying information on International Exchanges ***
**************************************************************************/


PImage img;
PFont fontTitle;
PFont fontHead;
PFont fontBody;


void setup() {
  size(displayWidth, displayHeight, P3D);
  background(255);
  noCursor();
  
  fontTitle = loadFont("Helvetica-Bold-48.vlw");
  fontHead = loadFont("Helvetica-Bold-30.vlw");
  fontBody = loadFont("Helvetica-16.vlw");

  img = loadImage("atlas.jpg");
}

void draw() {
  println(mouseX + " " + mouseY);

  imageMode(CENTER); //positions image using corners mode
  image(img, displayWidth/2, displayHeight/2, displayWidth, displayHeight);  

  /************************
  *** Title **************
  ************************/
if (mouseX > 10 && mouseX < img.width - 500) {
    fill(169, 14, 50);
    textFont(fontTitle);
    text("International Exchanges", img.width/2 - 500, img.height/2 + 450, 480, 200);
  }
  else {
    fill(120, 14, 50);
  } //when cursor is between 10 and half the image width - 500, the title for the display will appear.
  
  
  /************************
  *** red triangles *******
  ************************/

  //Norway
  if (mouseX > img.width - 214 && mouseX < img.width - 179) {
    fill(169, 14, 50);
    rect(img.width/2, img.height/2, 500, 300);
  }
  else {
    fill(120, 14, 50);
  } //when hovering over triangle representing Norway, the colour will change and a box will appear

  triangle(img.width - 179, img.height - 615, img.width - 179, img.height - 562, img.width - 214, img.height - 562);

  //Holland
  if (mouseX > img.width - 343 &&  mouseX < img.width - 283) {
    fill(169, 14, 50);
    rect(img.width/2, img.height/2, 500, 300);
  }
  else {
    fill(120, 14, 50);
  } //when hovering over triangle representing Holland, the colour will change and a box will appear

  triangle(img.width - 283, img.height - 490, img.width - 323, img.height - 423, img.width - 343, img.height - 432);

  //Autralia
  if (mouseX > img.width + 458 &&  mouseX < img.width + 527) {
    fill(169, 14, 50);
    rect(img.width/2, img.height/2, 500, 300);
  }
  else {
    fill(120, 14, 50);
  } //when hovering over triangle representing Australia, the colour will change and a box will appear

  triangle(img.width + 527, img.height + 44, img.width + 458, img.height + 54, img.width + 509, img.height - 10);

  /*************************************************** 
  ***Information about Universities ******************
  ***************************************************/
  
  //Norway
  if (mouseX > img.width - 214 && mouseX < img.width - 179) {
    fill(255);
    textFont(fontHead);
    text("Oslo & Akershus University", img.width/2 + 10, img.height/2 + 50);
    textFont(fontBody);
    text("Oslo and Akershus University College of Applied Sciences (HiOA) is Norway's largest state university college, with a student body of approximately 16,000 students and 1,600 employees. HiOA has four faculties located at two campuses: Pilestredet and Kjeller.", img.width/2 +10, img.height/2 + 100, 480, 200);
  }
  else {
    fill(255);
  } //when hovering over triangle representing Norway, text will appear

  //Holland
  if (mouseX > img.width - 343 && mouseX < img.width - 283) {
    fill(255);
    textFont(fontHead);
    text("Windesheim University", img.width/2 + 10, img.height/2 + 50);
    textFont(fontBody);
    text("With 20,300 students, thousands of other study participants and more than 1,800 members of staff at sites in Zwolle, Lelystad and Almere, Windesheim is one of the biggest universities of applied sciences in the Netherlands. As well as providing study opportunities, Windesheim is an important research centre. The university has several thriving research institutes focusing on a variety of themes.", img.width/2 +10, img.height/2 + 100, 480, 200);
  }
  else {
    fill(255);
  } //when hovering over triangle representing Holland, text will appear


  //Australia
  if (mouseX > img.width + 458 &&  mouseX < img.width + 527) {
    fill(255);
    textFont(fontHead);
    text("University of South Australia", img.width/2 + 10, img.height/2 + 50);
    textFont(fontBody);
    text("UniSA is a globally-focused, locally-engaged institution established on the dual principles of equity and excellence. With more than 35,000 students, the university is South Australia’s largest and was ranked in the top three per cent of more than 10,000 universities worldwide – in the QS World University Rankings. We offer more than 400 degree programs across a wide range of subjects including business, law, education, arts and social sciences, health sciences, information technology, engineering and the environment.", img.width/2 +10, img.height/2 + 100, 480, 200);
  }
  else {
    fill(120, 14, 50);
  } //when hovering over triangle representing Australia, the colour will change and a box will appear
}



