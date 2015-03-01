

void setup() {
  size(750,750);
  background(255);
}

void draw() {
  
  if (key == 'q' || key =='Q') {
    figureGround();   
  }
  
    if (key == 'w' || key =='W') {
      repetition();   
  }
  
  if (key == 'e' || key =='E') {
    commonFate();
  }
  
}

void figureGround(){ 
// asks if mouse is pressed then stops drawing  
    if(mousePressed){
    mouseX = 0;
    }
//fills accoriding to placement of mousex/mousey
  fill(mouseX-50,mouseY+50,mouseX+50,mouseY);
// no stroke on object  
  noStroke();
// size and placement of ellipse depend on placement of mouse in canvas  
  ellipse(mouseX, mouseY, mouseY, mouseY);
}

void repetition(){
  frameRate(60);
  // states that the next object will be filled(a shade of red)
  fill(140,0,0,5);
// tells the program not to use a stroke on the object
  noStroke();
// determines where the ellipse will be on screem inverted mousex/mousey
//also determines size of elipse
  ellipse( mouseY, mouseX, 15, 150);
}

void commonFate(){
    
  // sets back ground color to white  
  fill(mouseY, mouseX, mouseY);
  noStroke();
  rect(mouseX,0,50,100);
  
  fill(mouseX+5, mouseY, mouseX+5);
  noStroke();
  rect(mouseX,100,50,100);
  
  fill(mouseY+15, mouseX, mouseY+15);
  noStroke();
  rect(mouseX,200,50,100);
  
  fill(mouseX+20, mouseY, mouseX+20);
  noStroke();
  rect(mouseX,300,50,100);
  
  fill(mouseY+25, mouseX, mouseY+25);
  noStroke();
  rect(mouseX,400,50,100);
  
  fill(mouseX+50, mouseY, mouseX+50);
  noStroke();
  rect(mouseX,500,50,100);
  
  fill(mouseY+75, mouseX, mouseY+75);
  noStroke();
  rect(mouseX,600,50,100);
  
  fill(mouseX+100, mouseY, mouseX+100);
  noStroke();
  rect(mouseX,700,50,100);
} 

      


