
color paintColor = color(0,0,0);
int paintWidth = 1;
float paintSize = 40;

void setup () {
  size(500,500);
  background (255);
  stroke (0,0,0);
}

void draw () {
  strokeWeight (1);
  stroke (0);
  //red
  fill (255,0,0);
  rect (0,0,20,20); 
    fill (0,0,0);
    textSize (8);
    text ("red", 0,20,40,40); 
  //black
  fill (0,0,0);
  rect (25,0,20,20);
    fill (0,0,0);
    textSize (8);
    text ("black",22,20,40,40); 
  //blue
  fill (0,10,255);
  rect (50,0,20,20);
    fill (0,0,0);
    textSize (8);
    text ("blue",50,20,40,40); 
  //green
  fill (11,175,0);
  rect (75,0,20,20);
    fill (0,0,0);
    textSize (8);
    text ("green",70,20,40,40); 
  //yellow
  fill (255,243,3);
  rect (100,0,20,20);
    fill (0,0,0);
    textSize (8);
    text ("yellow",96,20,40,40); 
  //orange
  fill (255,159,3);
  rect (125,0,20,20);
    fill (0,0,0);
    textSize (8);
    text ("orange",122,20,40,40);
  //purple
  fill (125,0,175);
  rect (150,0,20,20);
    fill (0,0,0);
    textSize (8);
    text ("purple",150,20,40,40);
  //eraser
  fill (255,255,255);
  rect (175,0,20,20);
    fill (0,0,0);
    textSize (8);
    text ("eraser",175,20,40,40);
  //fat line
  strokeWeight (10);
  line (205,5,205,20);
  strokeWeight (2);
  triangle (200, 5, 205, 0, 210, 5);
  //thin line
  strokeWeight (1);
  line (220,0,220,20);
  triangle (215, 20, 220, 25, 225, 20);
  //spray
  fill (128);
  rect (230,0,20,20);
    fill (0);
    textSize (8);
    text ("spray", 225,20,40,40);
  //clear bg
  fill (255);
  rect (250,0,20,20);
    fill (0,0,0);
    textSize (8);
    text ("clear all",250,20,40,40);
  
 if(mousePressed == true) {
     //red
     if (mouseX < 20 && mouseX > 0 && mouseY < 20 && mouseY > 0) { 
      paintColor = color(255,0,0);
     }
     //black
    if (mouseX < 45 && mouseX > 25 && mouseY < 20 && mouseY > 0) {
     paintColor = color(0,0,0);
    } 
    //blue
    if (mouseX < 75 && mouseX > 50 && mouseY < 20 && mouseY > 0) {
      paintColor = color(0,10,255);
    }
    //green
    if (mouseX <100 && mouseX > 75 && mouseY < 20 && mouseY > 0) {
      paintColor = color(11,175,0);
    }
    //yellow
    if (mouseX < 125 && mouseX > 100 && mouseY < 20 && mouseY > 0) {
    paintColor = color(255,243,3);
    }
    //orange
    if (mouseX < 150 && mouseX > 125 && mouseY < 20 && mouseY > 0) {
    paintColor = color(255,159,3);
    }
    //purple
    if (mouseX < 175 && mouseX > 150 && mouseY < 20 && mouseY > 0) {
    paintColor = color(125,0,175);
    }
    //eraser
    if (mouseX < 200 && mouseX > 175 && mouseY < 20 && mouseY > 0) {
     paintColor = color (255,255,255);
     }
     //fat line
     if (mouseX < 220 && mouseX > 200 && mouseY < 20 && mouseY > 0 && paintWidth < 20) {
      paintWidth++;
     }
     //thin line
   if (mouseX < 230 && mouseX > 220 && mouseY < 20 && mouseY > 0 && paintWidth > 1) {
      paintWidth --;
     }
     //spray
     if (mouseX < 250 && mouseX > 230 && mouseY < 20 && mouseY > 0) { 
       paintSize = random(40);
      fill(paintColor);
      noStroke ();
      ellipse(mouseX+random(-500, 500), mouseY+random(-500, 500), paintSize, paintSize);
            }
        else {
        fill(paintColor);   
        }
     if (mouseX <  275 && mouseY > 250 && mouseY < 20 && mouseY > 0) {
      background (255,255,255);
     } 
   strokeWeight (paintWidth);
   stroke (paintColor);
  if (mouseY > 30) line (pmouseX, pmouseY, mouseX, mouseY);
 }
}
