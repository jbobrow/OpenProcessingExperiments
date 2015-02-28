
//variable declaration
PImage l,knob,knobright,credits,arrows;
PFont font,font2;
color fontColor = #cbd62d;
color fontColor2 =#d68d2d;
color fontColor3 =#2dcbd6;
int cursorTopX = 640; 
int cursorTopY = 309;
int cursorWidth = 2;
int cursorLength = 2;
String mode = "move";
boolean[] keyDown = new boolean[4];
float rot=0,rot2=0;
PImage back;
int m=0;
color allColors[] = new color[25];
int currentColorNumber = 1;
int speed = 1,j;
int screenCount = 1;
int d1,d2,d3,d4,d5,d6;
String date;
String settings = "Px size";
int getOut = 0;

//setup function
void setup () {
  //selecting our color pallete
  allColors[1] = color(0,0,0) ; allColors[2] = color(255,255,255); allColors[3] = color(128,64,64); allColors[4] = color(136,0,21);
  allColors[5] = color(237,28,36); allColors[6] = color(255,127,39); allColors[7] = color(183,73,0); allColors[8] = color(255,242,0); 
  allColors[9] = color(254,156,193); allColors[10] = color(255,94,174); allColors[11] = color(163,73,164); allColors[12] = color(112,50,135); 
  allColors[13] = color(128,106,213); allColors[14] = color(0,131,187); allColors[15] = color(0,0,160); allColors[16] = color(0,147,147); 
  allColors[17] = color(23,121,53); allColors[18] = color(12,58,26); allColors[19] = color(127,127,127); allColors[20] = color(63,63,63); 

  //croping the date and time into one String  
  d1 = day();
  d2 = month();
  d3 = year();
  d4 = hour();
  d5 = minute();
  d6 = second();
  date = d1+"."+d2+"."+d3+" - "+d4+";"+d5+";"+d6;
  
  //set resolution of program
  size (1280, 768);  
  
  //loading images and fonts
  l = loadImage("Logo.jpg") ; 
  knob = loadImage("Knob.jpeg");
  arrows = loadImage("arrow.jpg");
  credits = loadImage("credits.jpg");
  knobright = loadImage("Knob.jpeg");
  font = loadFont("RetroFont.vlw");
  font2 = loadFont("RetroFont2.vlw");
  
  noStroke();
  
  //drawing our etch-a-sketch frame
  drawFrame();
}


void draw () {
   
  if (m==0) {back = get(70,70,cursorLength,cursorWidth); m=m+1;}
  if (getOut == 1) { 
    delay(3000);
    exit();
  }
  
  //setting up all the text on the frame
  textFont(font2);
  fill(fontColor);
  text("Mode", 355, 590); 
  text("Settings", 760,590);
  text("Clear :", 100, 40); 
  text("Save :", 950,40);
  text ("Exit :", 550, 40);
  image (arrows,-20,600,arrows.width/2.13, arrows.height/2);
  image (arrows,1142,600,arrows.width/2.13, arrows.height/2);
  
  if (settings == "Px size") {
    textFont(font); 
    fill(fontColor2);
    text("PX size: "+cursorLength, 790, 680); }
  else
    if (settings == "Color") {
      textFont(font); 
      fill(fontColor2);
      text("Color: "+currentColorNumber, 800, 680);
    }
    else
      if (settings == "Speed") {
        textFont(font); 
        fill(fontColor2);
        text("Speed: "+speed, 800, 680);
      }
      
  textFont(font);
  fill(fontColor3);
  text ("'DELETE'",245, 40);
  text ("'ENTER'",1080, 40);
  text ("'ESC'", 675, 40);
  text (" 'm' " , 375, 620);
  text ("'SPACE'", 800, 620);
  text("'+' '-'", 815, 710);
  text("'a'    'd'", 10, 740);
  text(" '<='  '=>'", 1160, 740);
  
  if (mode == "draw") { 
    textFont(font); 
    fill(fontColor2); 
    text ("Draw",370,680);
  }
  else { 
    textFont(font); 
    fill(fontColor2); 
    text ("Move", 370, 680);
  }

  //test canvas area
  /*
  color c = color(0,0,255);
  set (50,50,c);
  set (1230,50,c);
  set (50,568,c);
  set (1230,568,c);
  */
  
  //adding the cursor to the screen
  color cursorColor = allColors[currentColorNumber];
  fill (cursorColor);
  translate(0,0);
  rect (cursorTopX, cursorTopY, cursorLength, cursorWidth);
  
  //Going right
  if (keyDown[0]==true && keyDown[1]==false && keyDown[2]==false && keyDown[3]==false )
    for (j=1; j<=speed; j++) { 
      if (cursorTopX-2<50) break; 
      if (mode == "move" ) image(back,cursorTopX,cursorTopY,back.width, back.height);
      back = get(cursorTopX-2,cursorTopY,cursorLength,cursorWidth);
      if (mode == "draw") 
        rect(cursorTopX,cursorTopY,cursorLength,cursorWidth);
      cursorTopX = cursorTopX-2; 
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth);  
      turnLeftKnobToLeft();  
    }
  
  //Going left  
  if (keyDown[1]==true && keyDown[0]==false && keyDown[2]==false && keyDown[3]==false )
    for (j=1; j<=speed; j++) {  
      if (cursorTopX+2>1220) break; 
      if (mode == "move" ) image(back,cursorTopX,cursorTopY,back.width, back.height); 
      back = get(cursorTopX+2,cursorTopY,cursorLength,cursorWidth); 
      if (mode == "draw") 
        rect(cursorTopX,cursorTopY,cursorLength,cursorWidth); 
      cursorTopX = cursorTopX+2; 
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth);    
      turnLeftKnobToRight(); 
    }
  
  //Going up  
  if (keyDown[2]==true && keyDown[1]==false && keyDown[0]==false && keyDown[3]==false) 
    for (j=1; j<=speed; j++) {
      if (cursorTopY-2<48) break;
      if (mode == "move" ) image(back,cursorTopX,cursorTopY,back.width, back.height); 
      back = get(cursorTopX,cursorTopY-2,cursorLength,cursorWidth); 
      if (mode == "draw") 
        rect(cursorTopX,cursorTopY,cursorLength,cursorWidth); 
      cursorTopY = cursorTopY-2; 
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth);   
      turnRightKnobToRight(); 
    }
   
  //Going down  
  if (keyDown[3]==true && keyDown[1]==false && keyDown[2]==false && keyDown[0]==false) 
    for (j=1; j<=speed; j++) {
      if (cursorTopY+2>520) break;
      if (mode == "move") image(back,cursorTopX,cursorTopY,back.width, back.height); 
      back = get(cursorTopX,cursorTopY+2,cursorLength,cursorWidth); 
      if (mode == "draw") 
        rect(cursorTopX,cursorTopY,cursorLength,cursorWidth); 
      cursorTopY = cursorTopY+2; 
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth);    
      turnRightKnobToLeft(); 
    }
  
  //Going NE
  if (keyDown[0]==true && keyDown[1]==false && keyDown[2]==true && keyDown[3]==false)  
    for (j=1; j<=speed; j++) { 
      if (cursorTopX-2<50 || cursorTopY-2<50) break;
      if (mode == "move") image(back,cursorTopX,cursorTopY,back.width, back.height);
      back = get(cursorTopX-2,cursorTopY-2,cursorLength,cursorWidth);
      if (mode == "draw") 
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth);
      cursorTopX = cursorTopX-2;
      cursorTopY = cursorTopY-2; 
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth); 
      turnLeftKnobToLeft();
      turnRightKnobToRight();
   }
  
  //Going NW 
  if (keyDown[1]==true && keyDown[0]==false && keyDown[2]==true && keyDown[3]==false)  
    for (j=1; j<=speed; j++) {
      if (cursorTopX>1216 || cursorTopY-2<50) break;
      if (mode == "move") image(back,cursorTopX,cursorTopY,back.width, back.height); 
      back = get(cursorTopX+2,cursorTopY-2,cursorLength,cursorWidth);
      if (mode == "draw") 
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth);
      cursorTopX = cursorTopX+2;
      cursorTopY = cursorTopY-2; 
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth); 
      turnLeftKnobToRight();
      turnRightKnobToRight();
   }
   
  //Going SE 
  if (keyDown[0]==true && keyDown[1]==false && keyDown[3]==true && keyDown[2]==false) 
    for (j=1; j<=speed; j++) {
      if (cursorTopX-2<50 || cursorTopY-2>516) break;
      if (mode == "move") image(back,cursorTopX,cursorTopY,back.width, back.height); 
      back = get(cursorTopX-2,cursorTopY+2,cursorLength,cursorWidth); 
      if (mode == "draw") 
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth);
      cursorTopX = cursorTopX-2;
      cursorTopY = cursorTopY+2;
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth); 
      turnLeftKnobToLeft();
      turnRightKnobToLeft();
   }
  
  //Going SW 
  if (keyDown[1]==true && keyDown[0]==false && keyDown[3]==true && keyDown[2]==false) 
    for (j=1; j<=speed; j++) {
      if (cursorTopX-2>1216 || cursorTopY-2>516) break; 
      if (mode == "move") image(back,cursorTopX,cursorTopY,back.width, back.height);
      back = get(cursorTopX+2,cursorTopY+2,cursorLength,cursorWidth);  
      if (mode == "draw") 
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth);
      cursorTopX = cursorTopX+2;
      cursorTopY = cursorTopY+2;
      rect(cursorTopX,cursorTopY,cursorLength,cursorWidth); 
      turnLeftKnobToRight();
      turnRightKnobToLeft();
   }
  
}

void keyPressed() {
  
  //tricking the program into thinking ESCAPE doesn't automatically close our application
  if (key == 27 ) key = 0; 
  
  //if ESC is pressed go to our quit function
  if (key == 0) quit();
  
  //when a movement key is pressed, the knob turning sound plays
  if (key == 'a') { 
    keyDown[0]=true; 
  }   
  if (key == 'd') { 
    keyDown[1]=true; }
  if (key == CODED) {
    if (keyCode == LEFT) {
      keyDown[3]=true;
    } 
    else 
      if (keyCode == RIGHT) {
        keyDown[2]=true; 
      }
  } 
}

void keyReleased() {
  
  if (key == 'a') keyDown[0]=false;
  if (key == 'd') keyDown[1]=false;
  if (key == CODED) {
    if (keyCode == LEFT) {
      keyDown[3]=false;
    } 
    else 
      if (keyCode == RIGHT) {
        keyDown[2]=false;
      }
  }
  
  //Saving the sketch
  if (key == 10 ) {
     if (screenCount<10) saveFrame("AllSketches/sketches("+date+")/sketch00"+screenCount+".jpg");
     if (screenCount>=10 && screenCount<100) saveFrame("AllSketches/sketches("+date+")/sketch0"+screenCount+".jpg");
     if (screenCount>=100) saveFrame("AllSketches/sketches("+date+")/sketch"+screenCount+".jpg");
     screenCount++;
   }  
  
  //Changing mode
  if (key == 'm') { 
    if (mode == "move") mode="draw";
    else { mode="move";}
    fill (#d6382d);
    rect (350,630,130,200);
  }
  
  //Clearing screen  
  if (key == 127) {
    background (162,181,205) ; 
    drawFrame();
  }
  
  //Toogling the settings
  if (key == 61) {
    if (settings == "Px size" && cursorLength<9) { cursorLength+=2; cursorWidth+=2; m=0; fill (#d6382d); rect(900,620,50,100); }
    if (settings == "Color" && currentColorNumber<20) { currentColorNumber+=1; fill (#d6382d); rect(880,620,50,70); }
    if (settings == "Speed" && speed<5) { speed=speed+1; fill (#d6382d); rect(880,620,50,70); }
  }      
  if (key == 45) { 
    if (settings == "Px size" && cursorLength>3) { cursorLength-=2; cursorWidth-=2; fill (#d6382d); rect(900,620,50,100); }
    if (settings == "Color" && currentColorNumber>1) { currentColorNumber-=1; fill (#d6382d); rect(880,620,50,70); }  
    if (settings == "Speed" && speed>1) { speed=speed-1; fill (#d6382d); rect(880,620,50,70); }     
  }  
 
 //Switching settings
 if (key == 32) {  
  if (settings == "Px size") settings = "Color";
  else
   if (settings == "Color") settings = "Speed";  
   else settings="Px size"; 
    fill(#d6382d); 
  rect(750,650,200,40); }
 } 

//turning knobs animation 
void turnLeftKnobToRight() {
   pushMatrix();  
   translate (230, 663); 
   rot+=PI/100; 
   rotate(rot); 
   image (knob,-93, -94, knob.width, knob.height); 
   popMatrix();
}

void turnRightKnobToRight() {
   pushMatrix();
   translate(1050,663); 
   rot2+=PI/100;; 
   rotate(rot2); 
   image (knobright,-93, -94, knobright.width, knobright.height); 
   popMatrix();
}  

void turnLeftKnobToLeft() {
   pushMatrix();  
   translate (230, 663); 
   rot-=PI/100; 
   rotate(rot); 
   image (knob,-93, -94, knob.width, knob.height); 
   popMatrix();
}

void turnRightKnobToLeft() {
   pushMatrix();
   translate(1050,663); 
   rot2-=PI/100;; 
   rotate(rot2); 
   image (knobright,-93, -94, knobright.width, knobright.height); 
   popMatrix();
} 

//drawing knobs
void drawKnobLeft() {
   pushMatrix();  
   translate (230, 663);  
   rotate(rot); 
   image (knob,-93, -94, knob.width, knob.height); 
   popMatrix();
}

void drawKnobRight() {
   pushMatrix();
   translate(1050,663);  
   rotate(rot2); 
   image (knobright,-93, -94, knobright.width, knobright.height); 
   popMatrix();
} 

//the function that draws the frame
void drawFrame() {
  background (162,181,205) ; 
  fill(#d6382d);
  rect (0 , 0 , 50 , 768) ; //seting up left rectangle for frame
  rect (0 , 529 , 1280, 250); // setting for lower rectangle
  rect (1229 , 0 , 150, 768); // right rectangle
  rect (0 , 0 , 1280, 49); // top rectangle

  //image(l,540, 585, l.width/2, l.height/2) ; //display logo
  image(l,438, 530, l.width/1.1, l.height/1.1) ;
  drawKnobLeft();
  drawKnobRight();
  
}

//quit function
void quit() {
    image(credits,50, 50, credits.width, credits.height/1.07);
    getOut = 1;
}

