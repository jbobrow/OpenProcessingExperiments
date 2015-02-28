
int cx;
int cy;
float r;
float g;
float b;
float alpha;
boolean addRed= false;
boolean addOrange= false;
boolean addBlue= false;
boolean addWhite= false;
boolean addLayer= false;
boolean saveDrawing = false;


void setup() {
size(700,700);
background(62,61,61);

 
}
 
void draw() {  //draws the border around the buttons and keeps it over top of the "drawings" 
drawButtonsBorder();
}



void mouseClicked(){

  
  if (mouseX>50 && mouseX<170 && mouseY>640){
    addRed=true; //set the boolean from false to true
    addOrange=false; //set everything else to false
    addBlue=false;
    addWhite=false;
    addLayer=false;
    saveDrawing=false;
    //println  ("checking red"); 
  }
 
  
  else if (mouseX>170 && mouseX<290 && mouseY>640){
    addOrange=true;
    addRed=false;
    addBlue=false;
    addWhite=false;
    addLayer=false;
    saveDrawing=false;
    //println  ("checking orange"); 
  }
  else if (mouseX>290 && mouseX<410 && mouseY>640) {
    addBlue=true;
    addRed=false;
    addOrange=false;
    addWhite=false;
    addLayer=false;
    saveDrawing=false;
    //println  ("checking blue"); 
  }
  else if (mouseX>410 && mouseX<530 && mouseY>640){
    addWhite=true;
    addRed=false;
    addOrange=false;
    addBlue=false;
    addLayer=false;
    saveDrawing=false;
    //println  ("checking white"); 
  }
  /*else if (mouseX>550 && mouseX<630 && mouseY>680){
    addLayer=true;
    addRed=false;
    addOrange=false;
    addBlue=false;
    addWhite=false;
    saveDrawing:false;
  } */
  else if (mouseX>640 && mouseX<680 && mouseY>640){
    saveDrawing=true;
    addLayer=false;
    addRed=false;
    addOrange=false;
    addBlue=false;
    addWhite=false;
  }
  else{
    saveDrawing=null; //trying to turn off the save button
  }
   
  
  if (addRed){ //adds red color to the stroke
    r= 103;
    g= 29;
    b= 15; 
  }
  else{}
  if (addOrange){  //adds orange color to the stroke
    r= 232;
    g= 210;
    b= 176;
  }
  else{}
  if (addBlue){  // adds blue to the stroke 
   r= 63;
   g= 99;
   b= 116;
  }
  else{}
  if (addWhite){ //returns the color to white
    r=255;
    g=255;
    b=255;
  }
  else{}
  if (addLayer){  //currently doesn't work....
    fill(62,61,61,45);
    rect(0,0,700,700);
  }
  else{}
  if (saveDrawing){ //saves sketch
    saveFrame("Dandelion-###.png");
  }
  else{}
 
}


void mousePressed() { //sets the location of the dandelion fluff
  stroke(255);
  cx = (mouseX);
  cy = (mouseY);

  stroke(r,g,b);
  strokeWeight(random(2,3));
  point(cx,cy,mouseX,mouseY);

 
   
  
}
void mouseDragged() {  //draws the spikes of the dandelion fluffs

  
 stroke(r,g,b,alpha);
 strokeWeight(random(0,4));
 line(cx,cy,mouseX,mouseY);
 
 colorMode(RGB);
 stroke(103, 29, 15);
 strokeWeight(random(2,3));
 point(mouseX,mouseY);

   
 alpha= random(15,80); //randomly change the opacity between 50 and 100
}

void drawButtonsBorder (){ //function to draw the border and buttons
  //border
  noStroke();
  fill(255);
  rect(0,0,700,15); //top
  rect(685,0,15,700); //right
  rect(0,640,700,60); //bottom
  rect(0,0,15,700); //left
   
  //red
  //noStroke();
  fill(103, 29, 15);
  //stroke(150,30,45);
  rect(80,650,40,40);
   
  //orange
  fill(232,210,176);
  //stroke(232,210,176);
  rect(200,650,40,40);
   
  //blue
  fill(63,99,116);
  //stroke(63,99,116);
  rect(320,650,40,40);
   
  //white
  stroke(62,61,61);
  strokeWeight(1);
  fill(255);
  rect(440,650,40,40);
   
  //layer
  /*textSize(20);
  fill(62,61,61);
  text("layer",550, 680); */
   
  //save
  textSize(20);
  fill(62,61,61);
  text("save",640,680);
 
} 


