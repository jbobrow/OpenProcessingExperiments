

void setup() {
  size(500,500); 
  background(255);
  smooth();
}

void draw() {
  background(255);
  smooth();
  //body
  stroke(175);
  fill(200,mouseX,mouseY,200);
  //mouseX=400, mouseY=378
  ellipse(mouseX,mouseY,30,30);
  ellipse(mouseX-25,mouseY+3,40,40);
  ellipse(mouseX-52,mouseY+6,50,50);
  ellipse(mouseX-85,mouseY+9,47,47);
  ellipse(mouseX-112,mouseY-3,40,40);
  ellipse(mouseX-130,mouseY-28,35,35);
  ellipse(mouseX-137,mouseY-53,35,35);
  ellipse(mouseX-142,mouseY-73,30,30);
  ellipse(mouseX-145,mouseY-88,20,20);
  strokeWeight(2);
  line(mouseX+15,mouseY,mouseX+40,mouseY-20);

//head
strokeWeight(1);
fill(255);
ellipse(mouseX-153,mouseY-143,100,100);
stroke(150);
fill(mouseX,mouseY,0);
ellipse(mouseX-153,mouseY-143,100,100);

//face features
strokeWeight(0);
fill(0);
ellipse(mouseX-166,mouseY-143,10,10);
ellipse(mouseX-140,mouseY-143,10,10);
/*fill(0);
ellipse(mouseX-166,mouseY-113,5,5);
ellipse(mouseX-140,mouseY-113,5,5);*/
strokeWeight(1);
stroke(160);
fill(240);
ellipse(mouseX-166,mouseY-143,4,4);
ellipse(mouseX-140,mouseY-143,4,4);

fill(255,200,mouseY);
line(mouseX-173,mouseY-128,mouseX-133,mouseY-128);
arc(mouseX-153, mouseY-128, 40, 40, 0, PI/1);
}

void keyPressed () {
fill(255,0,0);
line(mouseX-173,mouseY-128,mouseX-133,mouseY-128);
arc(mouseX-153, mouseY-128, 40, 40, 0, PI/1);
}

//void mousePressed () {
  




