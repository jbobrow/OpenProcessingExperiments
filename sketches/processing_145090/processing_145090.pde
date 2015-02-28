
PImage canvas; //Canvas for 2nd page- drawing
PImage startPage; //StartPage before 2nd page
PImage colorPalette; //color picker
int currentPage = 0; 
boolean drawCanvas = true;
boolean mouseDragged = true;
color c; 
int brushsize; 
int px = 0; 
int py = 0;

void setup (){
  size (600, 800);
  noStroke ();
  smooth ();
  canvas = loadImage ("Canvas.png"); 
  startPage = loadImage ("StartPage.png");
  colorPalette = loadImage ("ColorPicker.png");

}

void draw(){
if(currentPage == 0){
     drawStartButton();
  }
  else if(currentPage == 1){ //Canvas page!! :D
     drawLevelOne();
  }
  loadPixels();
  updatePixels();
  
  if(currentPage == 1){
     clearAll (); //attempt to make clear all work
  }
  if(currentPage == 0 && mouseX > 255 && mouseX < 405 && mouseY > 500 && mouseY < 550) { //Cursor to select "LET'S START!" Button. It looks cool. LOL :D
    cursor(HAND); //It looks cool :D
  } else {
    cursor(CROSS); //Default drawing :D
  }
} 

void clearAll () { 
  noStroke (); 
  fill (108, 206, 217); //color for button
  rect (20, 20, 75, 50); //drawing the button
  fill (255); //color for button text
  text ("Clear All", 32, 50); //Clear All Text
}

void drawStartButton () {
  image(startPage, 0, 0); //
  fill (108, 206, 217); //color for the button
  rect (225, 500, 150, 50); //Drawing the button
  fill (255); //color for the button text 
  text ("Let's Start!", 270, 530); //Text on the button
}

void drawLevelOne(){ //Not really the level, just the 'page' number 
  if (drawCanvas == true){
    image (canvas, 0, 0); //Canvas
    drawCanvas = false;
  }
  image (colorPalette, 0, 690); //Color Picker
}

void mousePressed (){
  px = mouseX;
  py = mouseY; 
  if(currentPage == 0 && mouseX > 200 && mouseX < 405 && mouseY > 500 && mouseY < 550){ //Switch over to page 1
      currentPage = 1; 
  }
  if(mouseX > 544 && mouseX < 600 && mouseY > 0 && mouseY < 256){
     fill(14, 149, 132);
     text("Draw whatever your heart desires! Select different colors by clcking on the palette down below!", 40, 300); //Infobutton text
     text("Now clear all and start!", 240, 320);
  }
  if (currentPage == 1 && mouseX>0 && mouseX<600 && mouseY>690 && mouseY<799){ 
    c= pixels[mouseY*width + mouseX]; //And attempt to test color checker in here
  }
  if(mouseX > 20 && mouseX < 95 && mouseY > 20 && mouseY < 70){ //clear all
      image (canvas, 0, 0); 
      image (colorPalette, 0, 690);
      clearAll ();
  }
}

void mouseDragged () {
  if (currentPage == 1) { 
    //fill (c);
    stroke (c); 
    strokeWeight (brushsize); 
    //ellipse (mouseX, mouseY, brushsize, brushsize); 
    line(mouseX, mouseY, pmouseX, pmouseY); 
  }
}

//Different Stroke Sizes

void keyPressed () {
  if (key == '1') {
    brushsize = 10; 
  }
  if (key == '2') {
    brushsize = 20; 
  }
  if (key == '3') {
    brushsize = 30; 
  }
  if (key == '4') {
    brushsize = 40; 
  } 
  if (key == '5') {
    brushsize = 50;  //More sizes JUST FOR FUN!~ :D
  }
  if (key == '6') {
    brushsize = 60;
  }
  if (key == '7') {
    brushsize = 70;
  }
  if (key == '8') {
    brushsize = 80;
  }
  if (key == '9') {
    brushsize = 90;
  }
}
















































