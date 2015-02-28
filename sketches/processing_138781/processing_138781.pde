
float d=15;
int red =150;
int blue = 100;
int x = -100;
int y = -100;



void setup() {
  size(650, 650);
  background(249,250,252);
  frameRate(30);
  noFill();

}

void draw() {
  noFill();
  
  if(mousePressed){ //draw circle
    strokeWeight(random(5));
    stroke(red,0,blue, 50);
    ellipse(x, y, d, d); 
    d = d+random(+3, +3);
}
  
  else{}

     
   fill(249,250,252); //outer frame
   noStroke();
   rect(0,0,35,650);
   rect(0,0,650,35);
   rect(615,0,35,650);
   rect(0,615, 650, 35);


  textSize(15); // instructions
  fill(66,66,63);
  text("Click to draw  |  'L' for new layer  |  'R' to reset canvas  |  'S' to save", 35, 640);
     
} 


void mouseReleased(){ //set circle back to original size
 d=15;
 x= -100; 
 y= -100; 
}

void mousePressed(){
   if (x == -100 && y == -100) { 
    x = mouseX; 
    y = mouseY;
}
  else{} 
  
}
  

void mouseClicked(){ //random hue
 red= floor(random(250));
 blue= floor(random(250));

}

void keyPressed(){
  if (key =='l'){ //opacity layer
   createLayer();
}
  if (key =='s'){ //save drawing
    fill(249,250,252);
    noStroke();
    rect(0,0,35,650);
    rect(0,0,650,35);
    rect(615,0,35,650);
    rect(0,615, 650, 35);
    saveDrawing();
}
  if (key =='r'){
    background(249,250,252);
}
}

void createLayer() { //makes opacity layer
  fill(255, 255, 255, 100);
  rect(35,35,580,580);
  noFill();
}

void saveDrawing() { //saves drawing
  saveFrame("images/circles-###.png"); 
}





