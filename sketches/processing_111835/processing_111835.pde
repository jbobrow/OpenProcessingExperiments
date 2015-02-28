
float w = 15;          // weight /pull of the curve
int mouseStartX = 0;  // remember where the mouse is whenever it is pressed
int decay = 10;       // coefficient for decay, 0 = max at each frame, 255 = no decay
int quantity = 1;     // number of yin-yangs to draw per frame
int helpWidth = 175;  // width for the box behind the help text
int helpHeight = 140; // height for the box behind the help text
int bgColor1 = 0;     // red channel for bg
int bgColor2 = 0;     // green channel for bg
int bgColor3 = 0;     // blue channel for bg
boolean displayHelp;  // if true, display help
float adjustColor1=255;   // red channel for dragging the mouse
float adjustColor2=255;   // red channel for dragging the mouse
float adjustColor3=255;   // red channel for dragging the mouse


void setup() {
  size(500, 500);
  background(0, 0, 0, 255);
  displayHelp=true;
}

void draw() {
  fill(bgColor1, bgColor2, bgColor3, decay);
  rect(0, 0, width, height);
  float d = random(20, 80);
  for (int i = 0; i < quantity; i++)
  {
    yinyang(random(width), random(height), d);
  }
  fill(bgColor1,bgColor2,bgColor3);
  rect(0,0,helpWidth,helpHeight);
  fill(adjustColor1,adjustColor2,adjustColor3);
  text("Weight: " + w,2,13);
  fill(255);
  text("Weight: ",2,13);
  text("Decay: " + decay,2,26);
  text("Quantity: " + quantity,2,39);
  text("Background: " + bgColor1 + ", " + bgColor2 + ", " 
      + bgColor3,2,52);
  if(displayHelp == true){
    fill(255,200,200);
    text("left/right to change quantity",2,65);
    text("up/down to change decay",2,78);
    text("click & drag to change weight",2,91);
    text("x to reset all",2,104);
    text("b to randomize background",2,117);
    text("h toggles this help",2,130);
  }
}

void yinyang(float x, float y, float d) {
  int color1=int(random(255));
  int color2=int(random(255));
  int color3=int(random(255));
  
  //normal color half
  fill(color1,color2,color3);
  stroke(0,0);
  arc(x, y, d, d, HALF_PI, PI+HALF_PI); 
  
  //opposite color for half
  fill(255-color1,255-color2,255-color3);
  stroke(0,0);
  arc(x, y, d, d, -HALF_PI, HALF_PI);    
  
  //normal colored dot in reverse half
  fill(color1,color2,color3);
  stroke(color1,color2,color3);
  ellipse(x+d/5,y-d/5,d/4,d/4);  
  
  //normal colored dot in reverse half
  fill(255-color1,255-color2,255-color3);
  stroke(255-color1,255-color2,255-color3);
  ellipse(x-d/5,y+d/5,d/4,d/4);
  

  //bottom of yinyang S curve
  float dPercent = map(d, 0, 80, 0, 1);
  float x1=x,    y1=y;
  float x2=x,    y2=y+d/2;
  float cx1=x+w*dPercent, cy1=y1;
  float cx2=x+w*dPercent, cy2=y2;
  fill(color1,color2,color3);
  stroke(0,0);
  bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);

  //top of yinyang S curve
  //x1,y1,x2,cy1 left unchanged
  y2=y-d/2;
  cx1=x-(w*dPercent); 
  cx2=x-(w*dPercent); cy2=y2;
  fill(255-color1,255-color2,255-color3);
  stroke(0,0);
  bezier(x1, y1, cx1, cy1, cx2, cy2, x2, y2);
}

void mousePressed() {
  mouseStartX = mouseX;
}

void mouseReleased() {
  float adjustment = map(mouseX-mouseStartX, 0, width, 0, 10);
  if (adjustment+w>40){
    adjustment=40-w;
  }
  w += adjustment;
  if (w<0) w=0;  
  if(w>40) w=40;
  println("w set to: " + w);
  adjustColor1=255;
  adjustColor2=255;
  adjustColor3=255;
}

void mouseDragged() {
  float adjustment = map(mouseX-mouseStartX, 0, width, 0, 10);
  if (-adjustment>w){
    adjustment=-w;
  }
  if (adjustment+w>40){
    adjustment=40-w;
  }
  adjustColor1=random(255);
  adjustColor2=random(255);
  adjustColor3=random(255);
  fill(adjustColor1, adjustColor2, adjustColor3);
  text(w+adjustment, mouseX, mouseY-10);
  if(adjustment>0){
    text("+" + adjustment, mouseX, mouseY-23);
  }
  else{
    text(adjustment, mouseX, mouseY-23);
  }
}

void keyPressed() {
  if (key == 'x' || key == 'X'){
    background(0);
    w = 15;
    decay=10;
    quantity=1;
    textAlign(CENTER,CENTER);
    fill(255);
    displayHelp = true;
    helpWidth = 175;
    helpHeight = 140;
    bgColor1 = 0;
    bgColor2 = 0;
    bgColor3 = 0;
    text("CLEAR!",width/2,height/2);
    textAlign(CORNER,CORNER);
  }
  if (key == 'b' || key == 'B'){
    bgColor1=int(random(0,128));
    bgColor2=int(random(0,128));
    bgColor3=int(random(0,128));
  }
  if (key == 'h' || key == 'H'){
    if (displayHelp == false){
      helpWidth = 175;
      helpHeight = 140;
      //background(bgColor1, bgColor2, bgColor3);
      displayHelp = true;
    }
    else{
      helpWidth = 145;
      helpHeight = 58;
      //background(bgColor1, bgColor2, bgColor3);
      displayHelp = false;
    }

  }
  if (keyCode == UP) decay++;
  else if (keyCode == DOWN) decay--;
  if (decay<0) {
    decay=0;
  }
  if (decay>255){
    decay=255;
  }
  if (keyCode == RIGHT) {quantity++;}
  else if (keyCode == LEFT) {quantity--;}
  if (quantity<1){
    quantity=1;
  }
  println(displayHelp);
  println("decay:"  + decay);
  println("help box:"+helpWidth+","+helpHeight);
}




