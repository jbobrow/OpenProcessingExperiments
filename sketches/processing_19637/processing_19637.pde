
class Giraffe {
  color bodyC;
  color limbsC;
  int xPos;
  int yPos;
  boolean female;  // true is female, false is male
  String name;
  PFont font;
  
  
  Giraffe(int tempXPos, int tempYPos, boolean tempGender, String tempName) {
    xPos = tempXPos;
    yPos = tempYPos;
    female = tempGender;
    name = tempName;
    
    if(female) {
      bodyC = color(234,159,38);
      limbsC = color(152,114,8);
    }
    else if(!female) {
      bodyC = color(232,123,40);
      limbsC = color(137,80,10);
    }
  }
  
  void drawGiraffe() {
    font = loadFont("Archer-ThinItalic-48.vlw");
    smooth();
    fill(bodyC);
    rect(xPos,yPos,30,100);
    rect((xPos)-30,(yPos)+35,80,30);
    
    // draw legs  
    strokeWeight(5);
    stroke(limbsC);
    line((xPos)-65,(yPos)+50,(xPos)-65,(yPos)+80);
    line((xPos)-55,(yPos)+50,(xPos)-55,(yPos)+70);
    line((xPos),(yPos)+50,(xPos),(yPos)+80);
    line((xPos)+10,(yPos)+50,(xPos)+10,(yPos)+70);
  
    // draw Giraffe's tail
    line((xPos)-70,(yPos)+20,(xPos)-80,(yPos)+40);
     
     // draw one ear to be behind head
    noStroke();
    fill(limbsC);
    triangle(xPos+20,yPos-70,xPos+40,yPos-70,xPos+30,yPos-85);
  
    // draw Giraffe's head and name
    fill(0);
    textFont(font,16);
    text(name,(xPos+20)-(textWidth(name)/2),yPos-100);
    fill(bodyC);
    ellipse(xPos+20,yPos-50,80,50);
    ellipse(xPos+50,yPos-35,35,25);
    // draw one ear to be in front of head
    
    
    // draw bow if female or tie if male
    if(female) {
      fill(252,25,94);
      triangle(xPos-5,yPos-65,xPos-5,yPos-85,xPos+15,yPos-75);
      ellipse(xPos+15,yPos-75,10,10);
      triangle(xPos+15,yPos-75,xPos+35,yPos-85,xPos+35,yPos-65);
    }
    else if(!female) {
      fill(25,61,252);
      quad(xPos+15,yPos-20,xPos+25,yPos-10,xPos+15,yPos,xPos+5,yPos-10);
      triangle(xPos+15,yPos-10,xPos+25,yPos+40,xPos+5,yPos+40);
    }
    fill(limbsC);
    triangle(xPos-5,yPos-65,xPos+15,yPos-65,xPos+5,yPos-80);
      
    // draw Giraffe's eyes
    fill(255);
    ellipse((xPos)+18,(yPos)-55,20,20);
    ellipse((xPos)+33,(yPos)-60,20,20);
    fill(0);
    ellipse((xPos)+18,(yPos)-50,10,10);
    ellipse((xPos)+33,(yPos)-55,10,10);
    
    // draw Giraffe's nostrils
    fill(limbsC);
    ellipse((xPos)+50,(yPos)-27,10,5);
    ellipse((xPos)+60,(yPos)-35,5,10);
    
    // draw spots
    // variables when key S is pressed
    int numBodySpots = 0;  // number of body spots
    int numNeckSpots = 0;  // number of neck spots
    int spotX;             // spot's X coordinate
    int spotY;             // spot's Y coordinate
    int r;                 // RGB's RED value
    int g;                 // RGB's GREEN value
    int b;                 // RGB's BLUE value
    
    while(numNeckSpots < 5) {
      // initialize variables
      r = int(random(0,255));
      g = int(random(0,255));
      b = int(random(0,255));
      spotX = int(random(xPos-10, xPos+10));
      spotY = int(random(yPos-35,yPos+10));
       
      // run loop to draw neck spots 
      fill(r,g,b);
      ellipse(spotX,spotY,10,10);
      numNeckSpots++;
    }
    
    while(numBodySpots < 10) {
      // initialize variables
      r = int(random(0,255));
      g = int(random(0,255));
      b = int(random(0,255));
      spotX = int(random(xPos-65,xPos+5));
      spotY = int(random(yPos+25, yPos+45));
      
      // run loop to draw body spots
      fill(r,g,b);
      ellipse(spotX, spotY, 10,10);
      numBodySpots++;
    }
  }
  
  
  // makes Giraffe move off the screen
  void scare() {
    xPos += 10;
  }
  
  // makes Giraffe move back on the screen
  void soothe() {
    xPos -= 10;
  }
  
  // returns the x position of the Giraffe
  int tellXPos() {
    return xPos;
  }
  
}
  



