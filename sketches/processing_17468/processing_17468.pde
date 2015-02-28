
void setup() {
  size(200,200);
  smooth();
 
}

void draw(){
  
  //bg
  background(255,213,121);
  noStroke();
  
      //bg lines
  stroke(170,123,21);
  line(20,0,20,200);
  line(60,0,60,200);
  line(100,0,100,200);
  line(180,0,180,200);
  line(140,0,140,200);
  
 
  //bowling ball movement
  fill(93,69,19);
  noStroke();
  ellipse(100,mouseY/2+65,145,145);
  
  //bowling ball
  fill(0,mouseX,mouseY);
  noStroke();
  ellipse(100,mouseY+20,150,150);
 
  
  //holes
  stroke(250);
  strokeWeight(4);
  ellipse(80,mouseY/2+60,15,15);
  ellipse(120,mouseY/2+60,15,15);
  ellipse(100,mouseY/2+80,15,15);
  

}

void mousePressed(){
    frameRate(10);
  //Bowling ball turns black
  fill(0);
  noStroke();
  ellipse(100,mouseY+20,150,150);
  
  //holes also turn black
  stroke(250);
  strokeWeight(4);
  ellipse(80,mouseY/2+60,15,15);
  ellipse(120,mouseY/2+60,15,15);
  ellipse(100,mouseY/2+80,15,15);
}
  

void mouseReleased() {
  //bowling ball back to multicolor
    fill(0,mouseX,mouseY);
  noStroke();
  ellipse(100,mouseY+20,150,150);
 
  
  //holes back to multicolor
  stroke(250);
  strokeWeight(4);
  ellipse(80,mouseY/2+60,15,15);
  ellipse(120,mouseY/2+60,15,15);
  ellipse(100,mouseY/2+80,15,15);
}

