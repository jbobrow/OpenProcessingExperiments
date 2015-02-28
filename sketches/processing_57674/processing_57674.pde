
void setup () {
 size(600,600); 
 smooth();
}

void draw () {
   background(108);

//shadow
  fill(54, 54, 54, 100);
  noStroke();
  ellipse(mouseX+100,mouseY+260, 300,40);

//body
  stroke(0);
  strokeJoin(ROUND);
  strokeWeight(6);
  fill(mouseX, mouseY, 108);
  triangle(mouseX,mouseY, mouseX+200,mouseY, mouseX+100,mouseY+250);   
   
   
//face
  strokeWeight(13);
  fill(228, 227, 237);
  ellipse (mouseX+100,mouseY-50,150,150);
  strokeWeight(3);
  strokeCap(ROUND);
  line(mouseX+100,mouseY-125,mouseX+100,mouseY-81);
  noFill();
  strokeWeight(1);
    arc(mouseX+100,mouseY-5,150,150, radians(197), radians(345));
    arc(mouseX+100,mouseY+20,150,150, radians(209), radians(331));
  fill(255);
  noStroke();


// eyes
   if (mousePressed) {
     fill(247, 164, 37);
   } else {
  fill(78, 227, 16);
   }
  strokeWeight(5);
  stroke(0);
   ellipse(mouseX+60,mouseY-30,20,20);
   ellipse(mouseX+140,mouseY-30,20,20);
  
//gleam
   fill(255); 
   noStroke();
   ellipse(mouseX+55,mouseY-32, 4,4);
   ellipse(mouseX+135,mouseY-32, 4,4);
   ellipse(mouseX+60,mouseY-27, 8,8);
   ellipse(mouseX+140,mouseY-27, 8,8);

//on click
  if (keyPressed) {
   noStroke();
   fill(255);
    rect(mouseX+100, mouseY+250, 100,50); 
  }

}

