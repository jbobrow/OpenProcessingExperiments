

int xPos=80;
int yPos=120;
int s=30;




void setup() { 
  
  size(800, 600);
  background(70,0,31);
  fill(255,204,204);
  rect(200, 0, 600, 600);
  fill(255);
  rect(225, 20, 555, 555);



 PFont font;

font = loadFont("Dialog-48.vlw");
textFont(font, 25);
text("COLORS", 50, 110);


  //button1
  fill(255, 0, 0);
  rect(xPos, yPos, s, s);
  //2
  fill(255, 128, 0);
  rect(xPos, yPos+s, s, s);
  //3
  fill(255, 255, 0);
  rect(xPos, yPos +s+s, s, s);
  //4
  fill(128,255,0);
  rect(xPos, yPos +s+s+s, s, s);
  //5
  fill(0,255, 0);
  rect(xPos, yPos +s+s+s+s, s, s);
  //6
  fill(0,255,128);
  rect(xPos, yPos +s+s+s+s+s, s, s);
  //7
  fill(0,255,255);
  rect(xPos, yPos +s+s+s+s+s+s, s, s);
  //8
  fill(0,128,255);
  rect(xPos, yPos +s+s+s+s+s+s+s, s, s);
  //9
  fill(0,0,255);
  rect(xPos, yPos +s+s+s+s+s+s+s+s, s, s);
  //10
  fill(127,0,255);
  rect(xPos, yPos +s+s+s+s+s+s+s+s+s, s, s);
  //11
  fill(255,0,255);
  rect(xPos, yPos +s+s+s+s+s+s+s+s+s+s, s, s);
  //12
  fill(255,0,127);
  rect(xPos, yPos +s+s+s+s+s+s+s+s+s+s+s, s, s);
  //13
  fill(128);
  rect(xPos, yPos +s+s+s+s+s+s+s+s+s+s+s+s, s, s);
  
  
  
}



void draw() {


  if (mousePressed) {



    if (mouseX >220  && mouseX<780  && mouseY> 20 && mouseY < 580) {
      line( pmouseX, pmouseY, mouseX, mouseY);
    }
    //1
    if ( mouseX> xPos && mouseX < xPos + s  && mouseY > yPos && mouseY < yPos + s  ) {
      stroke(255, 0, 0);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }


    //2
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s && mouseY < yPos + s+s  ) {
      stroke(255, 128, 0);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }


    //3
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s && mouseY < yPos + s+s+s  ) {
      stroke(255, 255, 0);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }

    //4 
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s+s && mouseY < yPos + s+s+s+s  ) {
      stroke(128,255,0);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }

    //5 
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s+s+s && mouseY < yPos + s+s+s+s+s  ) {
      stroke(0,255, 0);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }


    //6 
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s+s+s+s && mouseY < yPos + s+s+s+s+s+s  ) {
      stroke(0,255,128);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }

    //7 
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s+s+s+s+s && mouseY < yPos + s+s+s+s+s+s+s  ) {      
      stroke(0,255,255);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }

    //8 
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s+s+s+s+s+s && mouseY < yPos + s+s+s+s+s+s+s+s  ) {
      stroke(0,128,255);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }
    
    //9 
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s+s+s+s+s+s+s && mouseY < yPos + s+s+s+s+s+s+s+s+s  ) {
      stroke(0,0,255);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }
    
    //10
   if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s+s+s+s+s+s+s+s && mouseY < yPos + s+s+s+s+s+s+s+s+s+s  ) {
      stroke(127,0,255);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }
    
    //11
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s+s+s+s+s+s+s+s+s && mouseY < yPos + s+s+s+s+s+s+s+s+s+s+s  ) {
      stroke(255,0,255);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }
    
    //12
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s+s+s+s+s+s+s+s+s+s && mouseY < yPos + s+s+s+s+s+s+s+s+s+s+s+s  ) {
      stroke(255,0,127);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }
    
    //13
    if ( mouseX > xPos && mouseX < xPos + s  && mouseY> yPos+s+s+s+s+s+s+s+s+s+s+s+s && mouseY < yPos + s+s+s+s+s+s+s+s+s+s+s+s+s  ) {
      stroke(128);
      strokeWeight(3);
      line( pmouseX, pmouseY, mouseX, mouseY);
    }
  }
}

