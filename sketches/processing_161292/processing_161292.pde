
float flip = 1;
float bgcolor = 120;
float kcolor = 0;
float rcolor = 0;
float gcolor = 0;
float bcolor = 0;
float infoflip = 0;
float color1 = 0;
float color2 = 0;
float color3 = 0;
float bgflip = 0;
float newbg1 = 0;
float newbg2 = 0;
float newbg3 = 0;


void setup() {
  size(600,600);
  textSize(32);
}

void draw() {
  if (bgflip == 0){
  background(bgcolor);
  }
  else if (bgflip == 1){
    background(newbg1,newbg2,newbg3);
  }
  noStroke();
 
 
 if (flip == 0){ 
   fill(255,255,255);
   textSize(32);
   text("Subtractive", 20,35);
   //text(color1-kcolor, 20, 60);
   //text(color2-kcolor, 20, 90);
   //text(color3-kcolor, 20, 120);
  // text (kcolor, 20, 150);
  
   rcolor = ((255-(300-mouseY))-abs(300-mouseX));
   gcolor = (255-(((mouseY-300)+(300-mouseX))/2));
   bcolor = (255-(((mouseX-300)+(mouseY-300))/2));
    if (rcolor < 256){
     if (rcolor > 0){
      color1 = rcolor;
     }
     else{
       color1 = 0;
     }
   }
   else{
     color1 = 255;
   }
   if (gcolor < 256){
     if (gcolor>0){
     color2 = gcolor;
     }
     else{
       color2 = 0;
     }
   }
   else{
     color2 = 255;
   }
   if (bcolor < 256){
     if (bcolor >0){
     color3 = bcolor;
     }
     else{
       color3 = 0;
     }
   }
   else{
     color3 = 255;
   }
  fill(color1-kcolor,color2-kcolor,color3-kcolor);
  
 }
 else{
   fill(255,255,255);
   textSize(32);
   text("Additive", 20,35);
   rcolor = (((300-mouseY))+abs(300-mouseX));
   gcolor = ((((mouseY-300)+(300-mouseX))/2));
   bcolor = ((((mouseX-300)+(mouseY-300))/2));
   if (rcolor < 256){
     if (rcolor > 0){
      color1 = rcolor;
     }
     else{
       color1 = 0;
     }
   }
   else{
     color1 = 255;
   }
   if (gcolor < 256){
     if (gcolor>0){
     color2 = gcolor;
     }
     else{
       color2 = 0;
     }
   }
   else{
     color2 = 255;
   }
   if (bcolor < 256){
     if (bcolor >0){
     color3 = bcolor;
     }
     else{
       color3 = 0;
     }
   }
   else{
     color3 = 255;
   }
  fill(color1+kcolor, color2+kcolor, color3+kcolor);
 }
  ellipse(300,300,150,150);
  if (infoflip==0){
    textSize(15);
    fill(255,255,255);
    text("Press i for more information", 380,20);
  }
  else if (infoflip==1){
    textSize(15);
    fill(255,255,255);
    text("Move the mouse from the center to the top, bottom left, and bottom right to",10,430);
    text("manipulate the color of the circle.", 50, 450);
    text("Click to switch between additive and subtractive colors.",10,470);
    text("Press the up and down arrow keys to change the gray value of the background.",10,490);
    text("Press the spacebar to change the background to the current color of the circle.",10,510);
    text("Press the spacebar again to return the background to grayscale.",10,530);
    text("Press the left and right arrow keys to change the darkness of the circle's color.",10,550);
    text("Press enter to reset the circle's darkness value.",10,570);
    text("Press i to hide this information.",10,590);
  }
}

void mousePressed(){
  if (flip == 0){
    flip = 1;
  }
  else{
    flip = 0;
  }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      bgcolor = bgcolor + 10;
    }
    else if (keyCode == DOWN) {
      bgcolor = bgcolor - 10;
    }
    else if (keyCode == LEFT) {
      if (kcolor>10){
      kcolor = kcolor - 10;
    }
    }
    else if (keyCode == RIGHT) {
      if (kcolor<245){
      kcolor = kcolor + 10;
    }
    }
    
  }
  if (keyCode == ENTER) {
      kcolor = 0;
    }
    if (key == ' ') {
      if (bgflip == 1){
     
      bgflip = 0;
    }
    else {
       if (flip == 0){
        newbg1 = color1-kcolor;
        newbg2 = color2-kcolor;
        newbg3 = color3-kcolor;
        
      }
      else if (flip == 1){
        newbg1 = color1+kcolor;
        newbg2 = color2+kcolor;
        newbg3 = color3+kcolor;
        
      }
      bgflip = 1;
    }
    }
  if (key == 'i') {
      if (infoflip == 0){
        infoflip = 1;
      }
      else if (infoflip == 1){
        infoflip = 0;
      }
    }
}


