
//Emotion of flower - When the flower gets upset(upward mouse y coordinate), it turns red raising its eyebrows, and when it feels sad(downward mouse y coordinate), it turns blue lowering its eyebrows. Also, x coordinate of your mouse affects red value of the colors of the petals.

void setup() {
  size(400, 600);
}

void draw() {
  //Background Sky :
  noStroke();
  fill(50, 200, 250, 3);
  rect(0, 0, 400, 500);

  //Background Floor:
  noStroke();
  fill(160, 140, 20, 7);
  rect(0, 500, 400, 100);

  //Stem:
  noFill();
  stroke(0, 100, 0);
  arc(155, 445, 130, 285, PI+HALF_PI+QUARTER_PI, TWO_PI+QUARTER_PI, OPEN);



  //Petals:
  //The color of each petal keeps changing 
  //according to the x,y coordinates of the mouse.
  noStroke();
  fill(mouseX/2, 0, mouseY/3, 40);
  ellipse(200, 145, 150, 150);
  fill(mouseX/2, 50, mouseY/3, 40);
  ellipse(125, 200, 150, 150); 
  fill(mouseX/2, 100, mouseY/3, 40);
  ellipse(160, 280, 150, 150);
  fill(mouseX/2, 150, mouseY/3, 40);
  ellipse(240, 280, 150, 150);
  fill(mouseX/2, 200, mouseY/3, 40);
  ellipse(275, 200, 150, 150);

  //Eyebrows :
  //The shpae of eyebrow keeps changing according to the y coordinates.
  stroke(0);
  strokeWeight(5);
  line(120, 160+mouseY/10, 180, 190);
  line(220, 190, 280, 160+mouseY/10);

  //Eyes :
  noStroke();
  fill(0);
  ellipse(160, 230, 15, 30);
  ellipse(240, 230, 15, 30);
  
  //Eyelashes :
  stroke(0);
  strokeWeight(1);
   //Left eyelashes:
  curve(160,200,150,200,160,230,190,200);
  curve(170,200, 160,200, 160, 230,190,200);
  curve(180,200,170,200,160,230,200,200);
   //Right eyelashes:
   curve(240,200, 230,200,240,230,270,200);
   curve(250,200, 240,200,240,230,270,200);
   curve(260,200,250,200,240,230,280,200);


  //Vase:
  fill(120, 80, 20);
  strokeWeight(2);
  quad(160, 470, 190, 585, 240, 585, 270, 470);

  //Vase Pattern :
  fill(130, 100, 20);
  strokeWeight(2);
  triangle(170, 508, 185, 538, 200, 508);
  triangle(200, 508, 215, 538, 230, 508);
  triangle(230, 508, 245, 538, 260, 508);
}
