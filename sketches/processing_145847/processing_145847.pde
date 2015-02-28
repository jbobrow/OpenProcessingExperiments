
float d=15;
int hue =172;
int brightness = 98;
int x = -100;
int y = -100;



void setup() {
  size(650, 650);
    colorMode(HSB, 360, 100, 100);
  background(220,1,99);
  frameRate(30);
  noFill();



}

void draw() {
  noFill();
  
  if(mousePressed){ //draw circle
    strokeWeight(random(5));
    stroke(hue,90, 75, 50);
    ellipse(x, y, d, d); 
    d = d+random(+7, +3);
}
  
  else{}

     
   fill(69,3,98); //outer frame
   noStroke();
   rect(0,0,35,650);
   rect(0,0,650,35);
   rect(615,0,35,650);
   rect(0,615, 650, 35);


  textSize(15); // instructions
  fill(60,5,26);
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
 hue= floor(random(250));
 brightness= floor(random(250));

}

void keyPressed(){
  if (key =='l'){ //opacity layer
   createLayer();
}
  if (key =='s'){ //save drawing
    fill(220,1,99);
    noStroke();
    rect(0,0,35,650);
    rect(0,0,650,35);
    rect(615,0,35,650);
    rect(0,615, 650, 35);
    saveDrawing();
}
  if (key =='r'){
    background(220,1,99);
}
}

void createLayer() { //makes opacity layer
  fill(0, 0, 100, 95);
  rect(35,35,580,580);
  noFill();
}

void saveDrawing() { //saves drawing
  saveFrame("images/circles-###.png"); 
}





