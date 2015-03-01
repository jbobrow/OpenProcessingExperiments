
void setup()
{
  size(650,650);
  background(47,15,7);
  smooth(); 
  
}

void draw()
{

//SKETCHBOOK ASSIGNMENT 1

  fill(255, 10);
  for (int x = 20; x <= 800; x += 40)
    {
      for (int y = 20; y <= 800; y += 40) {
      rect(x-37,y-37,10,10);
    }
}


  //line 1 RECT
  stroke(#002673);
  strokeWeight(10);
  fill(#bd0730);
  rect(50,50,150,150,   40);
  stroke(#ce1126);
  strokeWeight(9);
  fill(#f6d61a);
  rect(250,50,150,150,   40);
  stroke(#df6f01);
  strokeWeight(10);
  fill(#003684);
  rect(450,50,150,150,   40);
  
  
  //line 1 ELLIPSE
  noStroke();
  fill(250);
  ellipse(100, 95, 70, 70);
  noStroke();
  fill(#039752);
  ellipse(325, 95, 70, 70);
  noStroke();
  fill(250);
  ellipse(550, 95, 70, 70);
  
  
  //line 2 RECT
  stroke(#00aad6);
  strokeWeight(10);  
  fill(#ffc622);
  rect(50,250,150,150,   40);
  stroke(0);
  strokeWeight(15);
  fill(250);
  rect(250,250,150,150,   40);
  stroke(#fce909);
  strokeWeight(10);
  fill(#d61133);
  rect(450,250,150,150,   40);
  
  
  //line 2 ELLIPSE
  noStroke();
  fill(#14b333);
  ellipse(105, 325, 80, 80);
  noStroke();
  fill(#005097);
  ellipse(325, 325, 100, 100);
  noStroke();
  fill(0);
  ellipse(545, 325, 80, 80);
  
  
  //line 2 CENTER ELLIPSE
  noStroke();
  fill(250);
  ellipse(325,340, 55,55);
 
  //line 3
  stroke(250);
  strokeWeight(10);
  fill(0);
  rect(50,450,150,150,   40);
  stroke(#006b49);
  strokeWeight(9);
  fill(#d61133);
  rect(250,450,150,150,   40);
  stroke(#2a486b);
  strokeWeight(10);
  fill(#d6d8e3);
  rect(450,450,150,150,   40);
  
  
  //line 3 ELLIPSE
  noStroke();
  fill(#ee2b33);
  ellipse(100, 555, 70, 70);
  noStroke();
  fill(#ffcc00);
  ellipse(325, 555, 70, 70);
  noStroke();
  fill(#b42728);
  ellipse(550, 555, 70, 70);
  
  
}
