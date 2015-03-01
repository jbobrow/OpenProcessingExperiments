
//Vitality: The ink painting: Vitality

boolean lp = true;  //to controle the draw loop for apuse/resume
boolean mousep = false;  //mouse clicke
float px = 15;  //the original postion of lines
float py = 600 - 2;
//PImage [] btflys = new PImage[5];
PImage [] btflys; //butterfly images
int pi = 0;  //to control display of butterflies
int frame = 1;
PFont myFont;

void setup() { 
  btflys = new PImage[16];
  size(800, 610); 
  background(255);
  smooth(); 
  myFont = loadFont("AlTarikh-48.vlw");
  textFont(myFont);

//Loading 16 butterflies
  for (int i = 0; i <= 15; i ++){
     btflys[i]= loadImage(str(i+1) + ".png");
 //         btflys[i].resize(64, 64);
  }
} 

void draw() { 
    textSize(16);
    text("Click mouse to add butterfly(s); Press any key or move mouse downwards to the bottom line to pause.", 4, 15);
    text("Press any key or move mouse upwards to the top line to resume painting.", 4, 35);
    text("Press key 'r' or 'R' or move mouse leftwards to the left line to reset.", 4, 55);
    
    noFill();         //frame for the paingting
    stroke(#FAB430);
    strokeWeight(2);
    rect(0, 60, 797, 547);
    
    //next position of the drawing line
    float tx = random(px + random(-4,3), px+ random(-4,3));
    float ty = random(py - random(4,7), py - random(7, 11));
   
    float a=random(10, 100);       //the display ration of dots
    
    strokeWeight(random(1, 8));    //for branch line
    stroke(70); 
    if (lp) line(px, py, tx, ty);
    
    int rd=int(random(0, 14));     //for dots' color
    if (rd<2) { 
      fill(215, 50, 50, random(120, 255)); 
    } 
      else if (rd==3) { 
        fill(255, 255, 0, random(200, 255)); 
      } 
         else { 
          fill(0, random(120, 255)); 
        } 
    
    float r=random(2, 40);       //dots' size
    noStroke(); 
    
    // add butterfly when mouse clicked
    if (mousep ){
      image(btflys[pi], mouseX-32, mouseY-32);
      mousep = false;
      if (pi < 15) pi ++;  //next butterfly
       else pi = 0;
    }
    
    //dots, or leaves
      if (lp) ellipse(px+random(3-a, a-3), py-random(-3-a, a-3), r-a/3, r-a/3); 
     
    
    //controle drawing height
    if (lp){
      if (py > random(0, height/3)){
        px = tx;
        py = ty;
      }else {
        px = px +random(50,100);
        py = height -2;
       }
     
     //control drawing width
       if (px > 1.01*width) {
         if (frame > 0){
           px = 10;
           py = height -2; 
           frame --;
         }
         else lp = false;
        } 
    }
   }


void mouseClicked(){
 mousep = true; 
}

//reset when key 'r' pressed, pause/resume when other key pressed
void keyPressed(){
 if (key == 'r' || key == 'R') {
   background(255);
   px = 10;
   py = height -2; 
   
//pause/resume when any key other than 'r' pressed
 } else {
    if (lp) {
     //noLoop();
     lp = false;
    }
   else {
     //loop();
     lp = true;
   }
 }
}


void mouseMoved(){
  if ((mouseX < pmouseX)&& mouseX <10) {
    background(255);
    px = 10;
   py = height - 2;
 
  } else {
    if (lp && (mouseY > pmouseY)&&mouseY >580 ) { 
     lp = false;
    }
    if (!lp && (pmouseY > mouseY)&&mouseY < 50){
     lp = true;
   }
  }
}



