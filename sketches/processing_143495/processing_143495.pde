
//Carla Barrenechea: dibuix que es mou amb el ratolí

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  
  //cabell
  strokeWeight(10);
  stroke(98,39,0);
  line(mouseX-60,mouseY-110,mouseX,mouseY);
  line(mouseX,mouseY-125,mouseX,mouseY);
  line(mouseX+60,mouseY-110,mouseX,mouseY);
  
  //cara
  stroke(162,87,11);
  strokeWeight(3);
  fill(224,132,34);
  ellipse(mouseX,mouseY-10,200,170); //cara
  fill(255,0,68);
  stroke(165,23,61);
  ellipse(mouseX,mouseY,25,25);//nas
  
  stroke(0);
  strokeWeight(2);
  noFill();
  arc(mouseX,mouseY+50,50,25,0.5,HALF_PI);//boca

  //ulls
  noStroke();
  fill(0);
  ellipse(mouseX-50,mouseY-30,50,50);
  ellipse(mouseX+50,mouseY-30,50,50);
  fill(255);
  ellipse(mouseX+40,mouseY-30,15,15);
  ellipse(mouseX-60,mouseY-30,15,15);  
  
  //ulleres
  strokeWeight(5);
  stroke(47,67,77);
  line(mouseX-15,mouseY-30,mouseX+15,mouseY-30);//pont de les ulleres
  fill(0,168,255,97);
  ellipse(mouseX-60,mouseY-30,100,100);//ullera dreta
  ellipse(mouseX+60,mouseY-30,100,100);//ullera esquerra
  
}


