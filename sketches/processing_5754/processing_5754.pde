
void setup() {
  size(400, 600);
  noStroke();
}

void draw() {
  background(85,75,70);

//mouth
  fill(165,12,12);
  ellipse(200,300,200, mouseY);
//tongue  
  fill(191,81,40);
  ellipse(200,295,170, mouseY);

//tooth1
  fill(85,75,70);
  ellipse(140,230,50, mouseY);
//tooth2
  fill(85,75,70);
  ellipse(180,240,50, mouseY);
//tooth3
  fill(85,75,70);
  ellipse(220,240,50, mouseY);
//tooth4
  fill(85,75,70);
  ellipse(260,230,50, mouseY);

//smile 
  fill(85,75,70);
   ellipse(200,200,300,mouseY);



//left sclera
fill(255);
  ellipse(100,130,120,mouseY);
//right sclera
fill(255);
  ellipse(300,130,120,mouseY);

//left iris
fill(mouseY,0,0,250);
  ellipse(100,130,100,mouseY);
//right iris
fill(mouseY,0,0,250);
  ellipse(300,130,100,mouseY);

//left pupil
  fill(0);
  ellipse(100,130,50,mouseY);
//right pupil
  fill(0);
  ellipse(300,130,50,mouseY);

//brows 
  fill(85,75,70);
  ellipse(200,60,400,mouseY);
 


}



