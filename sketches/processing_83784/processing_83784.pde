
color rectColor, baseColor;
color rectHighlight;
color currentColor;
boolean rectOver = false;
PImage decadelabels;
PImage title;
PImage title2;
PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;

void setup() {
  size(900,600);
  rectColor = color(0);
  rectHighlight = color(51);
  baseColor = color(255);
  currentColor = baseColor;
  decadelabels = loadImage ("buttonlabels.gif");
  title = loadImage ("title.gif");
  title2 = loadImage ("title2.gif");
  img1 = loadImage ("1980.gif");
  img2 = loadImage ("1985.gif");
  img3 = loadImage ("1990.gif");
  img4 = loadImage ("1995.gif");
  img5 = loadImage ("2000.gif");
  img6 = loadImage ("2005.gif");
}

void draw() {
  smooth();
  background(currentColor);
  
  
  
  //title
    if(mouseX>300){
      image(title2,1,1);
    }
 
 //1980
  //HIGHLIGHTS
  if(mouseX>28&&mouseX<262&&mouseY>27&&mouseY<84) { // if the mouse is over the rectangle
    fill(rectHighlight);
   image(img1,1,1); // show a highlight
  } else { // BUT if it is not
    fill(rectColor); // keep the rectangle the original color
  }
  
  
  //BUTTON
  stroke(0);
  rect(28 , 27, 234, 56); // x, y, w, h




 //1985
  //HIGHLIGHTS
  if(mouseX>28&&mouseX<262&&mouseY>113&&mouseY<169) { // if the mouse is over the rectangle
    fill(rectHighlight); // show a highlight
    image(img2,1,1);
  } else { // BUT if it is not
    fill(rectColor); // keep the rectangle the original color
  }
  
  
  //BUTTON
  stroke(0);
  rect(28 , 113, 234, 56); // x, y, w, h




 //1990
  //HIGHLIGHTS
  if(mouseX>28&&mouseX<262&&mouseY>198&&mouseY<255) { // if the mouse is over the rectangle
    fill(rectHighlight);
   image(img3,1,1); // show a highlight
  } else { // BUT if it is not
    fill(rectColor); // keep the rectangle the original color
  }
  
  
  
  //BUTTON
  stroke(0);
  rect(28 , 198, 234, 56); // x, y, w, h



 //1995
  //HIGHLIGHTS
  if(mouseX>28&&mouseX<262&&mouseY>281&&mouseY<338) { // if the mouse is over the rectangle
    fill(rectHighlight);
   image(img4,1,1); // show a highlight
  } else { // BUT if it is not
    fill(rectColor); // keep the rectangle the original color
  }
 
  
  
  //BUTTON
  stroke(0);
  rect(28 , 281, 234, 56); // x, y, w, h



 //2000
  //HIGHLIGHTS
  if(mouseX>28&&mouseX<262&&mouseY>364&&mouseY<422) { // if the mouse is over the rectangle
    fill(rectHighlight);
   image(img5,1,1); // show a highlight
  } else { // BUT if it is not
    fill(rectColor); // keep the rectangle the original color
  }
  
  
  
  //BUTTON
  stroke(0);
  rect(28 , 364, 234, 56); // x, y, w, h



 //2005
  //HIGHLIGHTS
  if(mouseX>28&&mouseX<262&&mouseY>449&&mouseY<507) { // if the mouse is over the rectangle
    fill(rectHighlight);
   image(img6,1,1); // show a highlight
  } else { // BUT if it is not
    fill(rectColor); // keep the rectangle the original color
  }
  
  
  //BUTTON
  stroke(0);
  rect(28 , 449, 234, 56); // x, y, w, h
  
  
  
  //BUTTON_LABELS
  image(decadelabels,15,1);
  image(title,1,1);
}




























void mousePressed() {
  if(rectOver) {
    currentColor = rectColor;
  }
}


