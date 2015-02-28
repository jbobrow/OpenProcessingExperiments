
PImage bolt;
int w;
int h;

void setup()
{
  size(400,400);
  smooth();
  
  bolt = loadImage("cursor.png");
  
  w = width/2;
  h = height/2;
}

void draw()
{
  background(mouseX/1.6, 0, mouseY/1.6);
   
  strokeJoin(ROUND);
  
//  stroke(0);
//  line(pmouseX, pmouseY, mouseX, mouseY);
  
  //IMAGE
  imageMode(CENTER);
  
  //filter(BLUR, 1);
  
  //track mouse position on screen
  //println(mouseX + " " + mouseY);
  cursor(bolt, 0, 0);
  
  beginShape();
  
  //BACKGROUND*********************************************************
  noStroke();
  fill(255, 0,0);
  ellipse(w,h, 375, 375);
  fill(255, 75,0);
  ellipse(w,h, 300, 300);
  fill(255,255,0);
  ellipse(w,h, 225, 225);
  
  //EARS*********************************************************
  fill(0,0,0);
  ellipse(w-80, h-80, 90, 90); //L ear
  ellipse(w+80, h-80, 90, 90); //R ear
  
  //HEAD*********************************************************
  ellipse(w, h, 155, 150); //head
  
  //black outlines
  stroke(0);
  strokeWeight(6);
  curve(600, 200, w+10, h+90, w-25, h+20, 800, 400);
  curve(-400, 400, w+25, h+20, w-10, h+90, -200, 200);
  curve(100, 900, w, h, w-50, h+20, 350, 800);
  curve(100, 800, w+50, h+20, w, h, 350, 900);
  
  strokeWeight(2);
  ellipse(w, h+50, 70, 105);

  noStroke();
  //cheeks
  fill(255, 255, 255);
  ellipse(w, h+50, 65, 100);
  curve(600, 200, w+10, h+90, w-25, h+20, 800, 400);
  curve(-400, 400, w+25, h+20, w-10, h+90, -200, 200);
  
  //eyes
  ellipse(w, h, 100, 80);
  curve(100, 900, w, h, w-50, h+20, 350, 800);
  curve(100, 800, w+50, h+20, w, h, 350, 900);
  fill(255);
  
  //EYES*********************************************************
  stroke(0,0,0);
  strokeWeight(3);

  curve(400, 600, w-20, h+7, w-5, h+3, 200, 600);
  curve(50, 600, w+20, h+9, w+5, h+10, 200, 600);

  fill(0,0,0);
  curve(w+75, 400, w-15, h+5, w-10, h+5, w-25, 300);
  curve(w-25, 400, w+10, h+5, w+15, h+5, w-50, 300); 
  
  //NOSE*********************************************************

  //curve(cx1, cy1, px1, py1, px2, py2, cx2, cy2)
  fill(255);
  noStroke();
  arc(w+5, h+12, 55, 20, PI, TWO_PI); //fill in nose
  stroke(0);
  curve(w-50, h+50, w-20, h+7, w+23, h+5, w+50, h+50); //nose_curve
  
  fill(0);
  curve(w+25, h-100, w-25, h+25, w+25, h+25, w-25, h-50);
  curve(w+25, h+125, w-25, h+25, w+25, h+25, w-25, h+175);
  //curve(w, 400, 75, 200, 125, 200, 75, 400);
  noFill();
  stroke(255);
  curve(w-50, h+40, w-10, h+17, w+15, h+17, w+50, h+40);

  //MOUTH*********************************************************
  fill(0);
  stroke(0);
  curve(w-50, 0, w-25, h+60, w+25, h+60, w+50, 0); //opened mouth
  
  noStroke();
  fill(255);
  //curve(w+70, 400, w-5, h+90, w, h+75, w-50, 400);
  ellipse(w-2, h+80, 15, 23);
  ellipse(w+5, h+80, 15, 23);
  
  noFill();
  stroke(0);
  curve(w-50, 0, w-25, h+60, w+25, h+60, w+50, 0); //mouth outline
  
  stroke(0);  
  fill(255);
  arc(w, h+40, 100, 50, 0, PI); //top
  
  noFill();
  arc(w-45, h+48, 20, 20, PI, TWO_PI-PI/2); //L dimples
  arc(w+45, h+48, 20, 20, TWO_PI-PI/2, TWO_PI); //R dimples
  
  endShape();
  
  if(mousePressed == true)
  {
    filter(INVERT);
  }

}

