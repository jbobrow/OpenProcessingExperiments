
int mode=1;

void setup(){
  size(1000,800);
  background(#C4C4C4);
  textSize(32);
  fill(0, 102, 153);
  text("Press G to get a green stroke.", 10, 30); 
  text("Press R to get a red stroke.", 10, 60);
  text("Press B to get a blue stroke.", 10, 90);
  text("Press A to get a random stroke.", 10, 120);  
  text("Click the mouse to clear the screen.", 10, 150); 
  text("Press C to get 2 strokes that are orange and blue.", 10, 180); 
}

void draw(){
if (mode==2){    //Green Stroke
  noStroke();
  fill(0,255,0);  
  frameRate(200);
  ellipse(mouseX,mouseY,30,30);
}
if (mode==3){    //Red Stroke
  noStroke();
  fill(255,0,0);
  frameRate(200);
  ellipse(mouseX,mouseY,30,30);   
}
if (mode==4){    //Blue Stroke
  noStroke();
  fill(0,0,255);
  frameRate(200);
  ellipse(mouseX,mouseY,30,30); 
}
if (mode==5){    //Random Color Stroke
  noStroke();
  fill(random(255),random(255),random(255));
  frameRate(200);
  ellipse(mouseX,mouseY,30,30); 
}
if (mode==6){    //Clear Screen
  background(#C4C4C4);
  textSize(32);
  fill(0, 102, 153);
  text("Press G to get a green stroke.", 10, 30); 
  text("Press R to get a red stroke.", 10, 60);
  text("Press B to get a blue stroke.", 10, 90);
  text("Press A to get a random stroke.", 10, 120);  
  text("Click the mouse to clear the screen.", 10, 150); 
  text("Press C to get 2 strokes that are orange and blue.", 10, 180); 
}
if (mode==7){   //Makes 2 lines of circles that are orange and blue
 noStroke();
 fill(#FF7300);
 frameRate(200);
 ellipse(mouseX,mouseY,30,30);
 fill(0,0,255);
 ellipse(mouseY,mouseX,30,30);
}
}
void keyTyped() {
  if(key== 'g') {  //This will make the lines green
    mode = 2;
    background(255,0,0);
  }
  if(key== 'r') {  //This will make the lines red
    mode = 3;
    background(0,255,0);
  }
  if(key== 'b') {  //This will make the lines blue
    mode = 4;
    background(#FF7300);
  }
  if(key== 'a') {  //This will make the lines random colors
    mode = 5;
    background(random(255),random(255),random(255));
  }
  if(key=='c') {  //This will make the background gray and 2 circles that are orange and blue
    mode = 7;
     background(#C4C4C4);
  }
  
}
void mousePressed() {
  if(mousePressed== true) {  //This will reset the screen
    mode = 6;
  }
}
