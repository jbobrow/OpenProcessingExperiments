
PImage img1;
PFont f; 

int card = 0; 
int textX = 50;
int textY = 60;
int textZ = 110;

void setup() {
  size(600,600);
  smooth();
  noCursor();
  f = loadFont("CurlzMT-35.vlw");
  textFont(f);
  img1 = loadImage("Robot.png"); 
}

void draw() {

  if (card == 0) {
    background(250,244,227);
    fill(0);
    text("Hi, my name is ' Black Can '.",50, 60);
    text("i live in.............what the...?? F l y?!! .",50, 110);
    image (img1, 200, 200, 200,280);
    
    strokeWeight(5);
    line(0,480,600,480);
   
    /*  Fly  */
    ellipse(340,200,10,10);
    fill(255);
    strokeWeight(2);
    ellipse(333,190,8,8);
    ellipse(350,207,8,8);
    
    strokeWeight(4);
    line(348,182,358,190);
    strokeWeight(3);
    line(357,174,364,182);
    strokeWeight(2);
    line(366,170,369,175);
    strokeWeight(1);
    line(374,168,375,171);
           
  }  
  else if (card == 1) {  
    background(250,244,227);
    
    image (img1, 200, 200, 200,280);
    
    strokeWeight(5);
    line(0,480,600,480);
   
    /*  Fly  */
    ellipse(250,150,10,10);
    fill(255);
    strokeWeight(2);
    ellipse(260,145,8,8);
    ellipse(245,160,8,8);
    
    strokeWeight(4);
    line(270,160,265,168);
    strokeWeight(3);
    line(277,165,272,173);
    strokeWeight(2);
    line(283,170,280,177);
    strokeWeight(1);
    line(290,175,288,181);
    
    fill(0);
    text("Oh...I really hate 'Flies'.", textX, textY);
    text("I can't endure that fly is in here...",textX,textZ);
    cardTwo();
  } 
  else if (card  == 2) {  
    background(250,244,227);
    
    image (img1, 200, 200, 200,280);
    
    strokeWeight(5);
    line(0,480,600,480);
   
    /*  Fly  */
    ellipse(350,130,10,10);
    fill(255);
    strokeWeight(2);
    ellipse(341,123,8,8);
    ellipse(350,140,8,8);
    
    strokeWeight(4);
    line(325,135,330,144);
    strokeWeight(3);
    line(315,140,319,149);
    strokeWeight(2);
    line(307,145,309,153);
    strokeWeight(1);
    line(299,149,300,156);
    
    /*  stick  */
    stroke(0);
    strokeWeight(4);
    line(210,200,215,260);
    fill(70);
    ellipse(209,182,30,30);
    
    fill(0);
    text("Sorry, but I'll kill you...kk.", textX, textY);
    
  }
  else if (card  == 3) { 
    background(250,244,227);
    
    image (img1, 200, 200, 200,280);
    
    strokeWeight(5);
    line(0,480,600,480);
   
    translate(-120,-60);
    /*  Fly  */
    ellipse(250,150,10,10);
    fill(255);
    strokeWeight(2);
    ellipse(260,145,8,8);
    ellipse(245,160,8,8);
    strokeWeight(4);
    line(270,160,265,168);
    strokeWeight(3);
    line(277,165,272,173);
    strokeWeight(2);
    line(283,170,280,177);
    strokeWeight(1);
    line(290,175,288,181);
    
    translate(120,60);
     /*  stick  */
    stroke(0);
    strokeWeight(4);
    line(210,200,215,260);
    fill(70);
    ellipse(209,182,30,30);
    
    strokeWeight(4);
    line(340,450,340,470);
    strokeWeight(3);
    line(350,455,350,465);
    strokeWeight(2);
    line(360,457,360,462);
    strokeWeight(1);
    line(370,459,370,461);
    
    /*  Fuel  */
    fill(255);
    rect(320,340,20,40);
    fill(255,5,43);
    rect(322,345,16,33);
    
    fill(0);
    text("Come on! come on!!.", textX, textY);
    
  }
  else if (card  == 4) {  
    background(250,244,227);
    
    translate(0,-30);
    image (img1, 200, 200, 200,280);
    
     /*  stick  */
    stroke(0);
    strokeWeight(4);
    line(210,200,215,260);
    fill(70);
    ellipse(209,182,30,30);
        
    /*  Fuel  */
    strokeWeight(0);
    fill(255);
    rect(320,320,20,40);
    fill(255,5,43);
    rect(322,342,16,15);
    translate(0,30);
        
    strokeWeight(5);
    line(0,480,600,480);
   
    translate(-30,-20);
    /*  Fly  */
    fill(0);
    ellipse(350,130,10,10);
    fill(255);
    strokeWeight(2);
    ellipse(341,123,8,8);
    ellipse(350,140,8,8);
    
    strokeWeight(4);
    line(325,135,330,144);
    strokeWeight(3);
    line(315,140,319,149);
    strokeWeight(2);
    line(307,145,309,153);
    strokeWeight(1);
    line(299,149,300,156);
    translate(30,20);
    
    strokeWeight(3);
    line(300,455,320,455);
    strokeWeight(2);
    line(305,462,315,462);
    strokeWeight(1);
    line(307,467,312,467);
    
    fill(0);
    text("Uh~!!! Die! die !!!", textX, textY);
  } 
  else if (card  == 5) {  
    background(250,244,227);
    
    pushMatrix();
    rotate(radians(90));
    translate(150,-670);
    image (img1, 200, 200, 200,280);
    
     /*  stick  */
    stroke(0);
    strokeWeight(4);
    line(350,180,345,220);
    fill(70);
    ellipse(350,165,30,30);
        
    /*  Fuel  */
    strokeWeight(0);
    fill(255);
    rect(320,320,20,40);
    fill(255,5,43);
    rect(322,355,16,2);
    popMatrix();
    translate(0,30);
        
    strokeWeight(5);
    line(0,480,600,480);
   
    translate(-30,-20);
    /*  Fly  */
    fill(0);
    ellipse(350,130,10,10);
    fill(255);
    strokeWeight(2);
    ellipse(341,123,8,8);
    ellipse(350,140,8,8);
    
    strokeWeight(4);
    line(325,135,330,144);
    strokeWeight(3);
    line(315,140,319,149);
    strokeWeight(2);
    line(307,145,309,153);
    strokeWeight(1);
    line(299,149,300,156);
    translate(30,20);
    
    strokeWeight(3);
    line(300,455,320,455);
    strokeWeight(2);
    line(305,462,315,462);
    strokeWeight(1);
    line(307,467,312,467);
    
    fill(0);
    text("Oh...low battery......", textX, textY);
    text("Fly says...' zzzzzZZZ...'.", textX, textZ);
  } 
  
  else if (card  == 6) {  
    background(250,244,227);
    fill(0);
    text("End..",width/2, height/2);
  } 
}


void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 0;
  }
}

void cardOne() {
  /*   
   code here to draw something for the first page,  
   */
}


void cardTwo() {
  /*   
   code here to draw something for the first page,  
   */
}

