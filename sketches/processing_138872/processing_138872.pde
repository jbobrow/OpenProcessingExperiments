
int dia = 75;
int diaother = 75;
int something = 300;
int otherangle = 0;
int red = 100;
int blue = 100;
int green = 100;


void setup() {
  size (1000, 600);
  background (255);
  smooth();
  noFill();
  frameRate(30);
  
  f = createFont("Arial",12,true);
}

//lines drawn randomly
void draw() {
  drawLines();
  instructions ();
}  

/*
allows users to draw lines and change 
line postion when a new layer is created
*/
void drawLines(){
  if(mousePressed){
    stroke(red,100,blue,50);
    strokeWeight(random(5));
  if(otherangle == 0) {
      line(mouseX, mouseY, dia, dia);
  }
  else if(otherangle == 1){
      line(mouseX, mouseY, dia+100, dia);
  }
  else if(otherangle == 2){
      line(mouseX, mouseY, dia+200, dia);
  }
  else if(otherangle == 3){
      line(mouseX, mouseY, dia+300, dia);
  }
  else if(otherangle == 4){
      line(mouseX, mouseY, dia+400, dia);
  }
  else{}
  
  dia = random(600);
  }
}

void mouseClicked(){    //subtle hue change on click
  red = floor(random(100,125));
  blue = floor(random(100,125));
}


void keyPressed() {
  if (key=='s')     //save drawing
  {
    saveDrawing();
  }
  if (key=='l')    //create layer & move draw line
  {
    createLayer();
  }
  if (key=='r')    //clearing the canvas
  {
    resetCanvas();
  }


}

void createLayer(){    //create layer & move draw line
  fill(255, 255, 255,150);
  rect(0,0,1000,600);
  otherangle++;
  if (otherangle > 4){
  otherangle = 0;
  }
  }

void resetCanvas(){    //reset canvas
  fill(250,250,250);
  rect(0,0,1000,600);
  }

void saveDrawing() {    //save drawing
  frame ();
  saveFrame("images/circles-###.png"); 
}

void frame () {    //create white frame to hide instructions when saved
  fill(255);
  noStroke();
  rect(0,575,1000,575);
  rect(0,0,1000,25);
  rect(0,0,25,600);
  rect(975,0,1000,600);
}

void instructions () {    //create uniform boarder & display instructions
  fill(200,200,200,100);
  noStroke();
  rect(0,575,1000,575);
  rect(0,0,1000,25);
  rect(0,0,25,600);
  rect(975,0,1000,600);
  textFont(f);
  fill(100);
  textAlign(CENTER);
  text("Use Mouse to draw  |  l = faded layer  |  r = reset canvas  |  s = save image",width/2, 590);

}



