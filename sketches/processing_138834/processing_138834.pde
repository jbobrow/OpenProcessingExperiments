
float h=161;
float s=84;
float b=150;
float opacity=35;
float dia= 0;

void setup(){
  size(600,600);
  background(0);
  frameRate(15);
}
void draw(){
  noFill();
  stroke(161, 84, 150);
  dia=random(10, 210); //randomizes size
  
  //press the mouse and C and the size becomes larger
  if(keyPressed && mousePressed) {
    if(key=='c') {
      dia=random(10, 700); 
  }
 }
  else {}
  
  //randomizes hue in center
  if (mousePressed){
    fill(h,s,b,opacity);
    ellipse(mouseX,mouseY, dia, dia);
    changeColor();
  } 
}

  void keyPressed () {
 //adds new layer transparency
   if (key == 'x' ) {
   noStroke();
   fill(0, 0, 0, opacity);
   rect(0, 0, 600, 600);
   }
   else {}
   
 //"s" saves my image 
   if (key=='s') {
    saveDrawing();
  }
  else {}
  
 }

// h value: 0-50-greenish, 50-150-blue-purpleish, 150-200 redish,
  void changeColor(){
   h=random(130, 180);
   s=random(50, 150);
   b=random(50, 150);
}

//put the PNG in a new browser tab
void saveDrawing() {
  saveFrame("images/circles-###.png");
  }



