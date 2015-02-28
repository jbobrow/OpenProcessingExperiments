

float x,y, s,t;
float angle =0;
float r = 400;
float diff = 1;

int card = 0; 
int textX = 130;
int textY = 100;
PFont f; 

void setup() {
  size(500, 200);
  f = loadFont("BrushScriptMT-30.vlw");
  textFont(f);
}

void draw() {

  
  
  if (card == 0) {
    background(229,109,147);
    
    fill(255);
    text("Kiss me", textX, textY);     
    cardOne(); 
     
     
  }  
  else if (card == 1) {  
    background(0);
    fill(255);
    text("My brother", 250, textY);
    cardTwo();
  } 
  else if (card  == 2) {  
    background(0);
    fill(255);
    text("My sister", 250, textY);
  cardTwo();
}
  else if (card  == 3) { 
    background(229,109,147);
    fill(255);
    text("Say you love me", textX + 40, textY);
    cardOne();
  
}
  else if (card  == 4) {  
    background(229,109,147);
    fill(255);
    text("Open your lips", textX + 50, textY);
    cardThree();
  } 
  else if (card  == 5) {  
    background(0);
    fill(255);
    text("Tell me is there any good in my heart", 70, textY);
    cardThree();
  } 
  else if (card  == 6) {  
    background(0);
    fill(255);
    text("Anything other than Jealousy", 110, textY);
    cardFour(); 
 } 
  else if (card == 7) {  
    background(0);
    fill(255);
    text("Please", textX, textY);
    cardFive();
  }
}


void mousePressed() {  

  if (card == 0) {  
    card = 2;
  } 
  else if (card == 1) {  
    card = 0;
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
    card = 7;
  }
  else if (card == 7) {
    card = 1;
  }
}

void cardOne() {

//background(255);
 x = r * cos(angle);
  y = r * sin(angle);
  
  translate(width/2, height/2);  


  rotate(r);  

  noStroke(); 

  fill(255,random(0, 255), random(0,255), 80); 

  ellipse(y/10, 0, y, y); 

angle = angle + 0.5;
r = r -diff;

  if ( r == 300 || r == 550) {  
    diff =  diff * -1; 
  }

}


void cardTwo() {
  /*   
   code here to draw something for the first page,  
   */
  
  float x = r * cos(angle);
  float y = r * sin(angle);
  fill(255);



  stroke(2);  


  strokeWeight(1); 


  line(200+x, 100+y, width/2 + y, height/2); 
  

  ellipse(200+y, 100, 5, 5); 



angle = angle + 300;
r = r -diff;
 if ( r == 0 || r == 300) { 
    diff =  diff * 0.5; 
  } 

}

void cardThree() {
 //float s = 400;
//  float t = r * sin(angle);
   x = r * cos(angle);
  
   noStroke();
   fill(random(0,255), random(0,255), 255);
   ellipse(width/2, height/2, x,x);
r = r + 1;
   if ( r > 0 || r <= 300) { 
    diff = diff + 0.5;
  }
  if (card == 4) {  
      fill(255);
      text("Open your lips", textX + 50, textY);
  } 
  else if (card == 5) {  
    fill(255);
    text("Tell me is there any good in my heart", 70, textY);
  }


  
}

void cardFour() {

  
   
   background(random(0,255), random(0,255), 255);

  fill(255);
  text("Anything other than Jealousy", 110, textY);
  
}

void cardFive() {
  background(0);
  
      fill(255);
    text("Please", textX, textY);
    
  float x = r * cos(angle);
  float y = r * sin(angle);
  fill(255);



  stroke(random(0,255));  


  strokeWeight(1); 


  line(200, 100, width/2-35, height/2); 
  

  ellipse(200, 100+x, 5, 5); 



angle = angle + 300;
r = r -diff;
 if ( r == 0 || r == 300) { 
    diff =  diff * -0.5; 
  } 

}


