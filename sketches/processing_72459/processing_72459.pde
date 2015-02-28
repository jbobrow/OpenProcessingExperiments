
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}//Sophie Riedel
//Introduction to Digital Media Fall 2012
//A
//9/10/12


float randomDiameter= 10; //global variable - float
float strokeGray= 0; //global variable- float
int mouseCount = 0;

void setup() {
  size(1200, 600);
  background(0);
}

void draw() {

  fill(255-mouseX % 255, 255-mouseX, mouseY, mouseY);
  rect(0, 0, width/2, height/2);
  fill(mouseX % 255, mouseX % 255, mouseY, mouseY);
  rect(width/2, 0, width, height/2);
  fill(mouseY % 255, mouseX %5, mouseX + mouseY % 255, mouseX);
  rect(0, height/2, width/2, height);
  fill(mouseX * 255, mouseY %5, mouseX, mouseY);
  rect(width/2, height/2, width, height);


  smooth();
  stroke(random(255)/40, random(255)/40, random(255)/40);
  strokeWeight(5);
  fill(strokeGray);

  if (randomDiameter<80) { 
    randomDiameter++;
  }
  else {
    randomDiameter=0;
  }
  //randomDiameter=random(20, 100);
  if (mouseCount==0) {
    fill(random(255), random(255)/2, random(255));
    rect(mouseX-randomDiameter/2, mouseY-randomDiameter/2, randomDiameter,randomDiameter);
  }
  if (mouseCount==1){
    fill(random(255),random(255),random(255));
    ellipse(mouseX-randomDiameter/2,mouseY-randomDiameter/2, randomDiameter, randomDiameter);
    
  }
  if (mouseCount == 2){
     fill(random(255),random(255),random(255));
   triangle(mouseX-randomDiameter/2,mouseY-randomDiameter/2, mouseX+randomDiameter, mouseY-randomDiameter,width/2,height/2);
   
  }
  if (mouseCount ==3){
    fill(random(255),random(255),random(255));
    rect(mouseX-randomDiameter/2,mouseY-randomDiameter/2, randomDiameter*2, randomDiameter/4);
  }
   if (mouseCount==4) {
    fill(random(255), random(255)/2, random(255));
    rect(mouseX-randomDiameter/2, mouseY-randomDiameter/2, randomDiameter, randomDiameter);
  }
  if (mouseCount==5){
    fill(random(255),random(255),random(255));
    ellipse(mouseX-randomDiameter/2,mouseY-randomDiameter/2, randomDiameter, randomDiameter);
    
  }
  if (mouseCount == 6){
     fill(random(255),random(255),random(255));
   triangle(mouseX-randomDiameter/2,mouseY-randomDiameter/2, mouseX+randomDiameter, mouseY-randomDiameter,width/2,height/2);
   
  }
  if (mouseCount ==7){
    fill(random(255),random(255),random(255));
    rect(mouseX-randomDiameter/2,mouseY-randomDiameter/2, randomDiameter*2, randomDiameter/4);
  }
  
}


void mouseClicked() {
  mouseCount++;
  if (mouseCount==8) {
    mouseCount = 0;
  }
}
