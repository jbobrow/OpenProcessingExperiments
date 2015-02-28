
void setup () {
  println("setup has run");
  size(500, 400);
  
  smooth();
  frameRate(60);

}

void draw () {
  background(200, 0, 0);
  println(mouseX + "," + mouseY);
  // float mx = constrain(mouseX, 10, 20);
  // float my = constrain(mouseY, 10, 20);


  //head
  fill(0);
  quad(150, 70, 350, 70, 300, 300, 200, 300);

  //eyes
  fill(200, 50, 200);
  rect(190, 100, 40, 40);
  ellipse(290, 120, 40, 50);
  fill(255, 220, 100);
  //eyemove left
  /*
  if ((mouseX < 200) && (mouseY < 100)) {
    ellipse(200,110,10,30);
    ellipse(280,110,10,30);
  } 
  else if ((mouseX < 200) && (mouseY < 140)) {
    ellipse(200,120,10,30);
    ellipse(280,120,10,30);
  } 
  else if ((mouseX < 200) && (mouseY > 140)) {
    ellipse(200,130,10,30);
    ellipse(280,130,10,30);
  } 
  //eyemove middle
  else if ((mouseX > 200) && (mouseX < 220) && (mouseY < 100)) {
    ellipse(210,110,10,30);
    ellipse(290,110,10,30);
  }
  else if ((mouseX > 200) && (mouseX < 220) && (mouseY < 140)) {
    ellipse(210,120,10,30);
    ellipse(290,120,10,30);
  } 
  else if ((mouseX > 200) && (mouseX < 220) && (mouseY > 140)) {
    ellipse(210,130,10,30);
    ellipse(290,130,10,30);
  } 
  //eyemove right
  else if ((mouseX > 220) && (mouseY < 100)) {
    ellipse(220,110,10,30);
    ellipse(300,110,10,30);
  }
  else if ((mouseX > 220) && (mouseY < 140)) {
    ellipse(220,120,10,30);
    ellipse(300,120,10,30);
  }
  else {
    ellipse(220,130,10,30);
    ellipse(300,130,10,30);
  }
*/

float mx = constrain(mouseX, 200, 220);
float my = constrain(mouseY, 110, 130);
ellipse(mx, my, 10, 30);
ellipse(mx+80, my, 10, 30);

  stroke(0, 255, 0);
  line(260, 107, 320, 107);
  line(260, 133, 320, 133);


  //eyebrows
  stroke(255);
  line(150, 40, 240, 95);
  line(150, 45, 240, 95);
  line(150, 50, 240, 95);

  line(350, 40, 260, 95);
  line(350, 45, 260, 95);
  line(350, 50, 260, 95);

  //mouth
  fill(0);
  quad(220, 230, 280, 230, 290, 270, 210, 270);
  line(220, 230, 235, 270);
  line(235, 270, 250, 230);
  line(250, 230, 265, 270);
  line(265, 270, 280, 230);

  //body
  fill(0);
  noStroke();
  rect(222, 300, 55, 75);
  
  //arm
  //quad(275, 320, mouseX, mouseY, mouseX, mouseY, 290, 340);
  

  // println(mousePressed);
  if (mousePressed == true) {
    fill (255,255,255);
    triangle(361, 147, 374, 112, 386, 117);
    ellipse(400,100,80,50);
  } 
  else {
    //  PFont font;
    // The font must be located in the sketch's 
    // "data" directory to load successfully
    //font = loadFont("FFScala-32.vlw"); 
    //textFont(font); 
    //text("word", 400, 100); 

    fill(200,0,0);
    triangle(361, 147, 374, 112, 386, 117);
    ellipse(400, 100, 80,50);
  }




}









