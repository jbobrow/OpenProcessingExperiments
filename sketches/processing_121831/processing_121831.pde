
void setup () {
  size(1000,1000);
}

void draw () {
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
       stroke(0);
  fill(255);
  ellipseMode(CENTER);
  ellipse(293,402 , 476, 845);
   
     stroke(0);
  fill(253);
  ellipseMode(CENTER);
  ellipse(-457,464 , 754, 593);
   
  stroke(0);
  fill(250);
  ellipseMode(CENTER);
  ellipse(758,242 , 941, 819);
  }
  
  stroke(0);
  
  fill(250,2,2);
  noStroke();
  ellipse(mouseX,mouseY,115,140);    // Rode lichaam mouseX=100 - mouseY = 70
  
  fill(255);
  ellipse(mouseX,mouseY-30,55,60);     // Witte oog
  
  fill(0);
  noStroke();
  ellipse(mouseX,mouseY-25,30,30);     // Zwarte pupil
  
  fill(255);
  noStroke();
  ellipse(mouseX,mouseY-25,10,10);     // Wit oog in pupil
  
  fill(255);
  stroke(0);
  rect(mouseX, mouseY+30, 40, 20, 50); // Mond
  
  fill(255,2,2);
  stroke(255,0,0);
  rect(mouseX-50,mouseY+40,40,10,50);   // Links bovenbeen
  rect(mouseX+50,mouseY+40,40,10,50);   // Rechts bovenbeen
  rect(mouseX-70,mouseY+55,10,60,50);   // Links onderbeen
  rect(mouseX+70,mouseY+55,10,60,50);   // Rechts onderbeen
  
  fill(0);
  stroke(0);
  triangle(mouseX+10, mouseY-70, mouseX+20, mouseY-80, mouseX+30, mouseY-60); // rechte driehoek
  triangle(mouseX-30, mouseY-60, mouseX-20, mouseY-80, mouseX-10, mouseY-70); // linkse driehoek
  
  line(mouseX-10, mouseY+20, mouseX-10, mouseY+40);         // linkse tand
  line(mouseX, mouseY+20, mouseX, mouseY+40);               // Middelste tand
  line(mouseX+10, mouseY+20, mouseX+10, mouseY+40);         // Rechtse tand
  line(mouseX-20, mouseY+30, mouseX+20, mouseY+30);
}
 
