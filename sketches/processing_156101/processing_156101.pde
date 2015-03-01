
/*Day 2, Homework: Animate the Character, by Brian Tsukerman*/
int bigger = 20;
int smaller = 5;

void setup(){
  size(1000,500); 
}

void draw(){
  background((mouseX/4),(mouseY/2),((mouseX+mouseY)/8));  

  //Draw bear's left ear
  fill(135,100,50);
  ellipse(mouseX-125, mouseY-125, 150, 150);

  //Draw bear's left inner ear
  fill(206,187,75);
  ellipse(mouseX-125,mouseY-125,100,100);

  //Draw bear's right ear
  fill(135,100,50);
  ellipse(mouseX+125, mouseY-125, 150, 150);

  //Draw bear's right inner ear
  fill(206,187,75);
  ellipse(mouseX+125, mouseY-125, 100, 100);

  //Draw bear's tongue
  

  //Draw bear's head
  fill(135,100,50);
  ellipse(mouseX,mouseY,300,300);

  //Draw bear's eyes
  fill(0);
  //ellipse(mouseX-50,mouseY-50,20,20);    default left eye
  //ellipse(mouseX+50,mouseY-50,20,20);    default right eye
  ellipse(mouseX-50,mouseY-50,20,(mouseY%2)*20);    
  ellipse(mouseX+50,mouseY-50,20,20);    

  //Draw bear's eye shine
  fill(255);
  ellipse(mouseX-55, mouseY-55, 3, 3);
  
  ellipse(mouseX+45,mouseY-55,3,3);

  //Draw bear's nose
  fill(0);
  triangle(mouseX, mouseY+50, mouseX-50, mouseY, mouseX+50, mouseY);

  //Bear's mouth
  fill(135,100,50);
  ellipse(mouseX-50,mouseY+50, 100, 100);
  ellipse(mouseX+50,mouseY+50, 100, 100);
}


