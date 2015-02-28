

ArrayList<Integer> X;
ArrayList<Integer> Y;
int delay = 10;
float alpha = 0;
color c1;
int blue = 255;
int red = 0;
int sliderx = 10;
int sliderposX;
int sliderposY;
int sliderLenght = 100;
int sliderHeight = 20;
float randmax = 0;
int vividness = 0;

/*

to do:

-sliders for randomizing and color vividness.
-figure menu to be inactive when drawing.
-push back button




boolean sketchFullScreen() {
  return true;
}



void mouseWheel(MouseEvent event) {
  randmax -= 10 * event.getAmount();
  if(randmax<0){
    randmax = 0;
  }
}

*/

void setup(){
  background(0);
  //size(displayWidth, displayHeight);
  size(900,700);
  X = new ArrayList<Integer>();
  Y = new ArrayList<Integer>();
  sliderposX = width-110;
  sliderposY = height-25;
}

void drawMenu(){
  
  noStroke();
  
  //draw text "gridBrush"
  fill(255, 20);
  textSize(20);
  text("gridBrush", 5,height-6);
  
  //draw slider
  fill(255,200);
  textSize(12);
  text("delay:", width-150, height-9);
  fill(80);
  rect(sliderposX,sliderposY,sliderLenght,sliderHeight);
  fill(#50d2fc); 
  rect(sliderposX,sliderposY,sliderx,sliderHeight);
  
  //instructions
  textSize(12);
  fill(255,200);
  text("hit B to push back, SPACE to clear. N and M for randomization.", 150, height-9);
  text("randomness: " + randmax/10, width -260, height-9);
  
}

void clearScreen(){
  fill(0,255);
  rect(0,0,width,height-30);
  for(int i = 0; i <= X.size(); i += 1 ){
    X.remove(i);
    Y.remove(i);
  }
}

void pushBack(){
  noStroke();
  fill(0,20);
  rect(0,0,width,height-30);
}

void rand(){
  if (key == 'm'){
      randmax += 1;
  }      
  if (key == 'n'){
    randmax -= 1;
    if(randmax<0){
      randmax = 0;
    }
  }
}

void slider(){
  if(mousePressed){
    sliderx = mouseX-sliderposX;
    if(sliderx>100){
      sliderx = 100;
    }
    if(sliderx < 2){
      sliderx = 2;
    }
    delay = sliderx;
  }
}

void draw(){
  smooth();
  if(keyPressed){
    if(key == ' '){
      clearScreen();
    }
    if(key == 'b'){
      pushBack();
    }
    if(key == 'm' || key == 'n'){
      rand();
    }
  }
  X.add(mouseX + int(random(-randmax,randmax)));
  Y.add(mouseY + int(random(-randmax,randmax)));
  while(X.size() > delay+1){
    X.remove(0);
    Y.remove(0);
  }
  
  int i = 0;
  if((mouseX >= sliderposX) && (mouseX <= sliderposX+sliderLenght) &&
     (mouseY >= sliderposY) && (mouseY <= sliderposY+sliderHeight)){
       slider();    
  }
    

    
  if(mousePressed && (X.size() > delay)) {
    
    //DRAWING GRID:
      
    if(mouseButton == RIGHT) {
      stroke(255,alpha);
      strokeWeight(1);
      line(X.get(0), Y.get(0), mouseX,mouseY);
      strokeWeight(2);
      line(X.get(delay-1),Y.get(delay-1),mouseX,mouseY);
      alpha += 2;
      if (alpha > 10){
      alpha = 10;
      }
    }
    
    //DRAWING TRIANGLES:
    
    if(mouseButton == LEFT) {
      
      //first define colors:
      blue = 255 - 2 * abs(X.get(delay)-X.get(delay-1));
      red = 5 * abs(Y.get(delay)-Y.get(delay-1));
      if (alpha>10){
        fill(red,191,blue,alpha);
      }
      else {
        fill(255,alpha); 
      }
      alpha += 2;
      if(alpha > 30){
        alpha = 30;
      }
      triangle(X.get(0), Y.get(0),mouseX,mouseY, X.get(delay-1), Y.get(delay-1));
      triangle(mouseX,mouseY, X.get(delay-1), Y.get(delay-1), X.get(int(delay/2)),Y.get(int(delay/2)));
      line(X.get(0), Y.get(0), mouseX,mouseY);
    }
  }
  
  //draws the grid tail
  if(!mousePressed && (X.size() > delay)) {
    stroke(255,alpha);
    strokeWeight(1);
    line(X.get(0), Y.get(0), mouseX,mouseY);
    strokeWeight(2);
    line(X.get(delay-1),Y.get(delay-1),mouseX,mouseY);
    alpha -= 2;
    if (alpha < 0){
      alpha = 0;
    }
  }
  fill(50,255);
  noStroke();
  rect(0,height-30,width,30);
  drawMenu();
}


