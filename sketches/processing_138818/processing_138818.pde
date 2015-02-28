
float r=255;
float g=255;
float b=255;
float a=100;
float weight=2;
boolean addRed= false;
boolean addGreen= false;
boolean addBlue= false;
boolean addWhite= false;
boolean addLayer= false;
boolean saveDrawing=false;

void setup(){
  size(800,800);
  background(43,20,50); //deep purple
}

void draw(){
   drawButtonsBorder(); 
  }
  
void mouseDragged() {
  drawLine(); //when the mouse is dragged, it draws lines 
}

void mouseClicked(){
  if (mouseX>50 && mouseX<170 && mouseY>740){
    addRed=true; //set the boolean from false to true
    addGreen=false; //set everything else to false
    addBlue=false;
    addWhite=false;
    addLayer=false;
    saveDrawing:false;
  }
  else if (mouseX>170 && mouseX<290 && mouseY>740){
    addGreen=true;
    addRed=false;
    addBlue=false;
    addWhite=false;
    addLayer=false;
    saveDrawing:false; 
  }
  else if (mouseX>290 && mouseX<410 && mouseY>740) {
    addBlue=true;
    addRed=false;
    addGreen=false;
    addWhite=false;
    addLayer=false;
    saveDrawing:false;
  }
  else if (mouseX>410 && mouseX<530 && mouseY>740){
    addWhite=true;
    addRed=false;
    addGreen=false;
    addBlue=false;
    addLayer=false;
    saveDrawing:false;
  }
  else if (mouseX>530 && mouseX<630 && mouseY>740){
    addLayer=true;
    addRed=false;
    addGreen=false;
    addBlue=false;
    addWhite=false;
    saveDrawing:false;
  }
  else if (mouseX>630 && mouseX<750 && mouseY>740){
    saveDrawing=true;
    addLayer=false;
    addRed=false;
    addGreen=false;
    addBlue=false;
    addWhite=false;
  }
  else{
    saveDrawing=null; //trying to turn off the save button
  }
  
  
  //defines statements above, still within mouseClicked
  if (addRed){
    b=random(100,200); //set random value between 100 and 200
  }
  else{}
  if (addGreen){
    g=random(100,200);
  }
  else{}
  if (addBlue){
    r=random(100,200);
  }
  else{}
  if (addWhite){
    r=255;
    g=255;
    b=255;
  }
  else{}
  if (addLayer){ //draws a new deep purple layer ontop with an opacity of 45
    fill(43,20,50,45);
    rect(0,0,800,800);
  }
  else{}
  if (saveDrawing){ //saves sketch
    saveFrame("images/sketch-###.png");
  }
  else{}

}

void drawLine(){
  stroke(r,g,b,a);
  strokeWeight(weight);
  
  //line(mouseX,mouseY-50,pmouseX,pmouseY-80); //these two lines create hash-marks
  //line(mouseX,mouseY-80,pmouseX,pmouseY-50);
  
  //line(mouseX-15,mouseY-15,pmouseX,pmouseY); // these two lines create the network of lines 
  //line(height-mouseY-15,mouseX-15,pmouseX,pmouseY);
  
  line(width-mouseX-20,mouseY-50,pmouseX,pmouseY); 
  line(height-mouseY-20,mouseX-50,pmouseX,pmouseY);
  
  //line(mouseX+50,mouseY-50,pmouseX,pmouseY); //more angular
  //line(mouseX-50,mouseY-50,pmouseX,pmouseY); //longer, more fluid lines
  //line(width-mouseX-50,mouseY-50,pmouseX,pmouseY); //makes almost 3D shapes (keep fluid lines on)
  //line(mouseX-50,height-mouseY-50,pmouseX,pmouseY); //makes almost 3D shapes sideways (keep fluid lines on)
  
  a=random(15,100); //randomly change the opacity between 50 and 100
  weight=random(2,5); //randomly change the stroke weights between 2 and 5
}


void drawButtonsBorder (){ //function to draw the border and buttons
  //border
  noStroke();
  fill(255);
  rect(0,0,800,15); //top
  rect(785,0,15,800); //right
  rect(0,740,800,60); //bottom
  rect(0,0,15,800); //left
  
  //red
  noStroke();
  fill(150,30,45);
  rect(80,750,60,40);
  
  //green
  fill(30,151,50);
  rect(200,750,60,40);
  
  //blue
  fill(30,71,151);
  rect(320,750,60,40);
  
  //white
  stroke(43,20,50);
  strokeWeight(1);
  fill(255);
  rect(440,750,60,40);
  
  //layer
  textSize(30); 
  fill(43,20,50);
  text("layer", 550, 780);
  
  //save
  textSize(30);
  fill(43,20,50);
  text("save", 660,780);

}







