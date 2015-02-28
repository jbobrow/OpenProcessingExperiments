
//Tortuga que es mou segons posició del cursor
//la carcassa canvia de color segons les posicions del mouse (X i Y)

int posX;

void setup(){
  size(700,700);
  background(60,195,206);
  noCursor();
  posX=0;
}


void draw(){
  background(60,195,206);
  noStroke();

  //mans//
  fill(13,113,18);
  ellipse(mouseX-45,mouseY-45,30,30);
  ellipse(mouseX-45,mouseY+45,30,30);
  ellipse(mouseX+45,mouseY-45,30,30);
  ellipse(mouseX+45,mouseY+45,30,30);
  ellipse(mouseX,mouseY-55,50,50);
  triangle(mouseX,mouseY+70,mouseX-5,mouseY+50,mouseX+5,mouseY-50);
  
  //ulls//
  fill(0);
  ellipse(mouseX-20,mouseY-70,5,5);
  ellipse(mouseX+20,mouseY-70,5,5);
  
  //carcassa//
  stroke(255);
  strokeWeight(10);
  fill(200,mouseY,mouseX);
  ellipse(mouseX,mouseY,100,100);
  
  // --línies carcassa
  strokeWeight(0.1);
  stroke(0);
  line(mouseX-10,mouseY-15,mouseX+10,mouseY-15);
  line(mouseX-10,mouseY-15,mouseX-20,mouseY);
  line(mouseX-20,mouseY,mouseX-10,mouseY+15);
  line(mouseX-10,mouseY+15,mouseX+10,mouseY+15);
  line(mouseX+10,mouseY+15,mouseX+20,mouseY);
  line(mouseX+20,mouseY,mouseX+10,mouseY-15);
  line(mouseX+10,mouseY-15,mouseX+17,mouseY-30);
  line(mouseX+17,mouseY-30,mouseX+33,mouseY-30);
  line(mouseX+20,mouseY,mouseX+35,mouseY);
  line(mouseX+35,mouseY,mouseX+42,mouseY-12);
  line(mouseX+10,mouseY+15,mouseX+20,mouseY+30);
  line(mouseX+20,mouseY+30,mouseX+10,mouseY+42);
  line(mouseX-10,mouseY+15,mouseX-20,mouseY+30);
  line(mouseX-20,mouseY+30,mouseX-10,mouseY+42);
  line(mouseX-10,mouseY+42,mouseX+10,mouseY+42);
  line(mouseX-10,mouseY-42,mouseX+10,mouseY-42);
  line(mouseX+10,mouseY-42,mouseX+17,mouseY-30);
  line(mouseX-10,mouseY-42,mouseX-18,mouseY-30);
  line(mouseX-18,mouseY-30,mouseX-10,mouseY-15);
  line(mouseX-18,mouseY-30,mouseX-34,mouseY-30);
  line(mouseX-20,mouseY,mouseX-35,mouseY);
  line(mouseX-35,mouseY,mouseX-42,mouseY-12);
  line(mouseX-43,mouseY+15,mouseX-35,mouseY);
  line(mouseX-20,mouseY+30,mouseX-34,mouseY+30);
  line(mouseX+20,mouseY+30,mouseX+34,mouseY+30);
  line(mouseX+35,mouseY,mouseX+43,mouseY+9);

  
}


