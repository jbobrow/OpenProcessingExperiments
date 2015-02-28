
void setup() {
  size(500, 500);
  smooth();
  rectMode(CENTER);
  background(0, 185, 160);

  noStroke();
  noCursor();
} 
void draw() {

  frameRate(10);
  fill(255, 255, 255, 20);
  ellipse(  0, 0, random(150), random(150));
  ellipse(500, 0, random(150), random(150));
  ellipse(  0, 500, random(150), random(150));
  ellipse(500, 500, random(150), random(150));


  if (mousePressed)
  {

    //weiße Kreise
    frameRate(80);
    fill(255, 255, 255, 20);

    //p
    ellipse(50, 260, 5, 5);
    ellipse(50, 240, 5, 5);
    ellipse(50, 220, 5, 5);
    ellipse(50, 200, 5, 5);
    ellipse(50, 180, 5, 5);

    ellipse(70, 180, 5, 5);
    ellipse(90, 190, 5, 5);  
    ellipse(90, 210, 5, 5);  
    ellipse(70, 220, 5, 5);


    //e
    ellipse(140, 260, 5, 5);
    ellipse(140, 240, 5, 5);
    ellipse(140, 220, 5, 5);
    ellipse(140, 200, 5, 5);
    ellipse(140, 180, 5, 5);

    ellipse(160, 260, 5, 5);
    ellipse(160, 220, 5, 5);
    ellipse(160, 180, 5, 5);  

    ellipse(180, 260, 5, 5);
    ellipse(180, 220, 5, 5);
    ellipse(180, 180, 5, 5);  


    //n
    ellipse(230, 260, 5, 5);
    ellipse(230, 240, 5, 5);
    ellipse(230, 220, 5, 5);
    ellipse(230, 200, 5, 5);
    ellipse(230, 180, 5, 5);

    ellipse(265, 240, 5, 5);
    ellipse(255, 220, 5, 5);
    ellipse(245, 200, 5, 5);

    ellipse(280, 260, 5, 5);
    ellipse(280, 240, 5, 5);
    ellipse(280, 220, 5, 5);
    ellipse(280, 200, 5, 5);
    ellipse(280, 180, 5, 5);


    //g
    ellipse(330, 260, 5, 5);
    ellipse(330, 240, 5, 5);
    ellipse(330, 220, 5, 5);
    ellipse(330, 200, 5, 5);
    ellipse(330, 180, 5, 5);
    
    ellipse(350, 180, 5, 5);
    ellipse(350, 260, 5, 5);

    ellipse(370, 260, 5, 5);
    ellipse(370, 240, 5, 5);
    ellipse(360, 220, 5, 5);

    ellipse(370, 220, 5, 5);
    ellipse(370, 180, 5, 5);
    
    
//!
    ellipse(420, 260, 5, 5);
    ellipse(420, 250, 5, 5);
    ellipse(420, 230, 5, 5);
    ellipse(420, 220, 5, 5);
    ellipse(420, 210, 5, 5);
    ellipse(420, 200, 5, 5);
    ellipse(420, 190, 5, 5);
    ellipse(420, 180, 5, 5);
    
    
    ellipse(430, 260, 5, 5);
    ellipse(430, 250, 5, 5);
    ellipse(430, 230, 5, 5);
    ellipse(430, 220, 5, 5);
    ellipse(430, 210, 5, 5);
    ellipse(430, 200, 5, 5);
    ellipse(430, 190, 5, 5);
    ellipse(430, 180, 5, 5);
    
    
    
  }

  else {

    //schwarze Kreise
    noStroke();
    fill(20, 20, 20, 20);
    ellipse(mouseX, mouseY, 350, 350);
  }
}
