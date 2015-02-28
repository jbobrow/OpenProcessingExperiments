
float x = 0;
float y = 0;
float a = 0;
float b = 0;

void setup(){
  size(500,500);
  smooth();
  background(0);
  ellipseMode(CENTER);
  rectMode(CENTER);
}

void draw(){
  
  
  if (mousePressed){
    
    fill(0,0,random(100,255));
      
  //X Row 1
  rect(mouseX +150, mouseY-150 ,10,10);
  rect(mouseX +100, mouseY-150 ,10,10);
  rect(mouseX +50, mouseY-150 ,10,10);
  rect(mouseX, mouseY-150 ,10,10);
  rect(mouseX -50, mouseY-150 ,10,10);
  rect(mouseX -100, mouseY-150 ,10,10);
  rect(mouseX -150, mouseY-150 ,10,10);
  
  //X Row 2
  rect(mouseX +150, mouseY-100 ,10,10);
  rect(mouseX +100, mouseY-100 ,10,10);
  rect(mouseX +50, mouseY-100 ,10,10);
  rect(mouseX, mouseY-100 ,10,10);
  rect(mouseX -50, mouseY-100 ,10,10);
  rect(mouseX -100, mouseY-100 ,10,10);
  rect(mouseX -150, mouseY-100 ,10,10);
  
  //X Row 3
  rect(mouseX +150, mouseY-50 ,10,10);
  rect(mouseX +100, mouseY-50 ,10,10);
  rect(mouseX +50, mouseY-50 ,10,10);
  rect(mouseX, mouseY-50 ,10,10);
  rect(mouseX -50, mouseY-50 ,10,10);
  rect(mouseX -100, mouseY-50 ,10,10);
  rect(mouseX -150, mouseY-50 ,10,10);
  
  //Center
  rect(mouseX +150, mouseY,10,10);
  rect(mouseX +100, mouseY,10,10);
  rect(mouseX +50, mouseY,10,10);
  rect(mouseX, mouseY,10,10);
  rect(mouseX -50, mouseY,10,10);
  rect(mouseX -100, mouseY,10,10);
  rect(mouseX -150, mouseY,10,10);
  
  //X Row 5
  rect(mouseX +150, mouseY+50 ,10,10);
  rect(mouseX +100, mouseY+50 ,10,10);
  rect(mouseX +50, mouseY+50 ,10,10);
  rect(mouseX, mouseY +50 ,10,10);
  rect(mouseX -50, mouseY+50 ,10,10);
  rect(mouseX -100, mouseY+50 ,10,10);
  rect(mouseX -150, mouseY+50 ,10,10);
  
  //X Row 6
  rect(mouseX +150, mouseY +100 ,10,10);
  rect(mouseX +100, mouseY+100 ,10,10);
  rect(mouseX +50, mouseY+100 ,10,10);
  rect(mouseX, mouseY+100 ,10,10);
  rect(mouseX -50, mouseY+100 ,10,10);
  rect(mouseX -100, mouseY+100 ,10,10);
  rect(mouseX -150, mouseY+100 ,10,10);
  
  //X Row 7
  rect(mouseX +150, mouseY+150 ,10,10);
  rect(mouseX +100, mouseY+150 ,10,10);
  rect(mouseX +50, mouseY+150 ,10,10);
  rect(mouseX, mouseY+150 ,10,10);
  rect(mouseX -50, mouseY+150 ,10,10);
  rect(mouseX -100, mouseY+150 ,10,10);
  rect(mouseX -150, mouseY+150 ,10,10);
  
  fill(random(200,255),random(200,255),0);
    rect(100,100,100,100);
    rect(600,200,200,200);  
    rect(400,100,50,50);
    rect(200,300,200,200);
    rect(350,350,20,20);
    rect(400,250,50,50);
    
  
  }else{
    fill(random (0,255), 0,0);
  //X Row 1
  ellipse(mouseX +150, mouseY-150 ,10,10);
  ellipse(mouseX +100, mouseY-150 ,10,10);
  ellipse(mouseX +50, mouseY-150 ,10,10);
  ellipse(mouseX, mouseY-150 ,10,10);
  ellipse(mouseX -50, mouseY-150 ,10,10);
  ellipse(mouseX -100, mouseY-150 ,10,10);
  ellipse(mouseX -150, mouseY-150 ,10,10);
  
  //X Row 2
  ellipse(mouseX +150, mouseY-100 ,10,10);
  ellipse(mouseX +100, mouseY-100 ,10,10);
  ellipse(mouseX +50, mouseY-100 ,10,10);
  ellipse(mouseX, mouseY-100 ,10,10);
  ellipse(mouseX -50, mouseY-100 ,10,10);
  ellipse(mouseX -100, mouseY-100 ,10,10);
  ellipse(mouseX -150, mouseY-100 ,10,10);
  
  //X Row 3
  ellipse(mouseX +150, mouseY-50 ,10,10);
  ellipse(mouseX +100, mouseY-50 ,10,10);
  ellipse(mouseX +50, mouseY-50 ,10,10);
  ellipse(mouseX, mouseY-50 ,10,10);
  ellipse(mouseX -50, mouseY-50 ,10,10);
  ellipse(mouseX -100, mouseY-50 ,10,10);
  ellipse(mouseX -150, mouseY-50 ,10,10);
  
  //Center
  ellipse(mouseX +150, mouseY,10,10);
  ellipse(mouseX +100, mouseY,10,10);
  ellipse(mouseX +50, mouseY,10,10);
  ellipse(mouseX, mouseY,10,10);
  ellipse(mouseX -50, mouseY,10,10);
  ellipse(mouseX -100, mouseY,10,10);
  ellipse(mouseX -150, mouseY,10,10);
  
  //X Row 5
  ellipse(mouseX +150, mouseY+50 ,10,10);
  ellipse(mouseX +100, mouseY+50 ,10,10);
  ellipse(mouseX +50, mouseY+50 ,10,10);
  ellipse(mouseX, mouseY +50 ,10,10);
  ellipse(mouseX -50, mouseY+50 ,10,10);
  ellipse(mouseX -100, mouseY+50 ,10,10);
  ellipse(mouseX -150, mouseY+50 ,10,10);
  
  //X Row 6
  ellipse(mouseX +150, mouseY +100 ,10,10);
  ellipse(mouseX +100, mouseY+100 ,10,10);
  ellipse(mouseX +50, mouseY+100 ,10,10);
  ellipse(mouseX, mouseY+100 ,10,10);
  ellipse(mouseX -50, mouseY+100 ,10,10);
  ellipse(mouseX -100, mouseY+100 ,10,10);
  ellipse(mouseX -150, mouseY+100 ,10,10);
  
  //X Row 7
  ellipse(mouseX +150, mouseY+150 ,10,10);
  ellipse(mouseX +100, mouseY+150 ,10,10);
  ellipse(mouseX +50, mouseY+150 ,10,10);
  ellipse(mouseX, mouseY+150 ,10,10);
  ellipse(mouseX -50, mouseY+150 ,10,10);
  ellipse(mouseX -100, mouseY+150 ,10,10);
  ellipse(mouseX -150, mouseY+150 ,10,10);
  
  fill(random(0,255));
  ellipse(100,100,100,100);
  ellipse(600,200,200,200);  
  ellipse(400,100,50,50);
  ellipse(200,300,200,200);
  ellipse(350,350,20,20);
  ellipse(400,250,50,50);
  }
}


