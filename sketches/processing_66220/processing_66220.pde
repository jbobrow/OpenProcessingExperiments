

int page = 1;

PImage background1;
PImage logo;
//text
PFont font;



int radii;
float speed = 1;



///////////////////////VOID SETUP\\\\\\\\\\\\\\\\\\\\\\\\\\\\
void setup () {
  size (800, 480);
  font = loadFont ("Lane-Narrow-60.vlw");
  textFont (font);
  smooth();
  noStroke ();
  textAlign (CENTER);
  ellipseMode (RADIUS);
  rectMode (CENTER);
  background1 = loadImage ("background.png");
  logo = loadImage("logo.png");
}

////////////////////////VOID DRAW\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
void draw () {

  if (page == 1) {
    pageOne();

  }
  else if (page == 2) {
    pageTwo(); 
  }
  else if(page ==3) {
    pageThree();
  }
  else if(page==5){
      textSize (32);
    text ("YOU LOSE", 400, 240);
  }
  else if (page==6){
     textSize(32);
    text("YOU WIN", 400, 240);
  }

}

//////////////////////////PAGE CHANGES\\\\\\\\\\\\\\\\\\\\\\\\\\
void mousePressed() {


}

//page one
void pageOne (){
  image (background1, 0, 0);
  image(logo, 400, 240);

  if(mousePressed){
    page = 2; 
  }
}


//////////////////////////////////////////page two
void pageTwo (){

image(background1, 0, 0);
   

 ellipseMode(RADIUS);
  smooth();
  noFill();
  stroke(244);
  strokeWeight(5);
ellipse(400, 240, 50, 50);

reverb();

  if(radii>80) {
    page=3;
}

}

////////////////////////////////////
void pageThree (){

image(background1, 0, 0);

   

 ellipseMode(RADIUS);
  smooth();
  noFill();
  stroke(244);
  strokeWeight(4);
ellipse(400, 240, 90, 90);
reverb();
if((key==' ')&&(radii<91)) {
    page=6;
}
else{
  page=5;}
  

}



