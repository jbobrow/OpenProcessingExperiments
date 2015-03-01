
// This clock tells time with accumulating cat hair. 

PFont myFont;

void setup() {
  
  size(600, 600);  
  stroke(69,49,50);
  strokeWeight(2);
  fill(89,61,49);
  
  // floorboards    
  rect(0, 0, width/5, height/2);
  rect(0, height/2, width/5, height/2);
  
  rect(120, 0, width/4, height/3);
  rect(120, height/3, width/4, 533);

  rect(240, 0, width/4, height/2);
  rect(240, height/2, width/4, height/2);  
  
  rect(360, 0, width/4, 533);
  rect(360, 533, width/4, 267);  
  
  rect(480, 0, width/4, height/4);
  rect(480, height/4, width/4, 600);
  
  // paw shadow
  fill(0, 10);
  noStroke();
  rect(470, 410, 100, 300, 50, 50, 0, 0);  
  
  frameRate(1);

  String[] fontList = PFont.list();
  println(fontList);
  
  // set font
  myFont = createFont("FrutigerLT-Bold", 15);
  textFont(myFont);
  
  // show second indicator

  fill(255,50);
  smooth();
  text("0", 5, 20);
  text("10", 90, 20);    
  text("20", 190, 20);
  text("30", 290, 20);
  text("40", 390, 20);
  text("50", 490, 20);
  text("60", 580, 20);
  
  text("10", 5, 100);    
  text("20", 5, 200);
  text("30", 5, 300);
  text("40", 5, 400);
  text("50", 5, 500);
  text("60", 5, 595);  
}

void draw() { 
  

  // cat hair trail to show minutes and seconds

  stroke(random(255),10);
  strokeWeight(1);
  noFill();
  float x1 = map(second(), 0, 59, 0, width);
  float y1 = map(minute(), 0, 59, 0, height);

    if (x1 < width/2) {
  bezier(x1, y1, random(x1-50,x1+50), random(y1-50,y1+50), random(x1-50,x1+50), random(y1-50,y1+50), random(x1-50,x1+50), random(y1-50,y1+50));
  }  
    if (x1 > width/2) {
  bezier(x1, y1, random(x1-50,x1+50), random(y1-50,y1+50), random(x1-50,x1+50), random(y1-50,y1+50), random(x1-50,x1+50), random(y1-50,y1+50));
  }
 
 // cat paw to show hour
 noStroke();
 smooth();
 
 // arm outline
 fill(135, 104, 60);
 rect(450, 450, 100, 300);

 // shadow
 fill(0,10);
 rect(530, 450, 20, 300);
 rect(450, 450, 10, 300);
 
 // paw outline
 fill(255);
 ellipse(500, 445, 100, 100);
 rect(450, 450, 100, 50);
 arc(500, 500, 100, 25, 0, PI);
 
 // pads
 fill(237, 187, 201);
 ellipse(500, 470, 50, 30);
 arc(500, 470, 50, 60, PI, TWO_PI);
 ellipse(470, 440, 20, 20);
 ellipse(485, 420, 20, 20);
 ellipse(515, 420, 20, 20);
 ellipse(530, 440, 20, 20); 
 
 // show hour
 fill(255);
 text(hour(), 492, 470);
}




