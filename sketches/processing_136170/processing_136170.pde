
int l = 50;
int w = 50;
int x1 = 150;
int x2 = 200;
int x3 = 250;
int y1 = 150;
int y2 = 200;
int y3 = 250;
float x = 100;
float y = 100;
float speed = 0.5;


void setup(){
  
  size(500, 500);
  background(255);
  
  
  
  
}



void draw(){
  
  
  
  
  if (mouseButton == RIGHT){ //if you press the right button, background turns to black
    background(0);
  }

  strokeWeight(5);
  
  if (mousePressed== true){ //starts out as b&w, turns to color when the mouse is pressed
    fill(41, 162, 64);// green
  }else{ if(keyPressed){
    fill(34, 200, 180);// teal, if you press a key, then color scheme changes
  }else{
    fill(200); //light grey
  }
  }
  rect(x1, y1, l, w); //rubik's cube squares --top left
  
  
  
  if (mousePressed == true){
  fill(255);
  }else{ if(keyPressed){
    fill(245, 115, 252); //light purple
  }else{
    fill(0); //black
  }
  }
  rect(x2, y1, l, w); // top middle, white
    
    
    
    
  if (mousePressed == true){
    fill(0, 0, 255); //blue
  }else{ if(keyPressed){
    fill(126, 250, 141); //light green
  }else{
    fill(255); //white
  }
  }
  rect(x3, y1, l, w); // top right, blue
  
  
  if(mousePressed == true){
    fill(255, 0, 0);//red
  }else{ if(keyPressed){
    fill(247, 250, 146); //light yellow
  }else{
    fill(100); //dark grey
  }
  }
  rect(x1, y2, l, w);// middle left, red
  
  
  if (mousePressed == true){
  fill(250, 143, 28);// orange
  }else{ if(keyPressed){
    fill(250, 201, 126); //light orange
  }else{
    fill(200);
  }
  }
   rect(x2, y2, l, w);//middle middle, orange
   
   
  if (mousePressed == true){
    fill(41, 162, 64);//green
  }else{ if(keyPressed){
  fill(35, 200, 180); //light blue
  }else{
    fill(0);
  }
}
  rect(x3, y2, l, w);//middle right, green
  
  
  
  if (mousePressed == true){
    fill(255);
  }else{ if(keyPressed){
    fill(245, 91, 145); //pink
  }else{
    fill(255);
  }
  }
  rect(x1, y3, l, w);//bottom left, white
  
  
  if (mousePressed == true){
    fill(255, 255, 30); //yellow
  }else{ if(keyPressed){
    fill(126, 250, 141); //light green
  }else{
    fill(200);
  }
  }
  rect(x2, y3, l, w);//bottom middle, yellow
    
     
    
  if (mousePressed == true){
    fill(255, 0, 0); //red
  }else{ if(keyPressed){
    fill(247, 250, 146); //light yellow
  }else{
    fill(100); //dark grey
  }
  }
  
    if (keyPressed) {
if ((key == '1') || (key == '5')) { //if you press the 1 or 5 key, the bottom right square will move into place
    x += speed;
    
  rect(x, y3, l, w);// bottom right, red
  
  
  
    


    
  }

  
  
  
    }

    }



