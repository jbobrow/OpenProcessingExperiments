
//Append Exercise by Xiaofeng Lin
//advised by Jennifer Presto

float[] xPos = new float[0];
float[] yPos = new float[0];
float[] zPos = new float[0];

void setup(){
  size(500, 500, P3D);
}

void draw(){
  println(xPos.length);
  background(200);
  fill(255);
  rect(480, 480, 20, 20);
  fill(255, 0, 0);
  rect(0, 470, 30, 30);
  fill(0, 255, 0);
  rect(30, 470, 30, 30);
  fill(0, 0, 255);
  rect(60, 470, 30, 30);
  fill(0);
  rect(90, 470, 30, 30);
  fill(150);
  rect(120, 470, 30, 30);
 
  stroke(0);
  if(mousePressed){
    xPos = (float[])append(xPos, mouseX);
    yPos = (float[])append(yPos, mouseY);
    zPos = (float[])append(zPos, mouseX+mouseY);
  }
  for(int i=0; i < xPos.length-1; i++){
//    ellipse(xPos[i], yPos[i], 10, 10);
    line(xPos[i], yPos[i], xPos[i+1], yPos[i+1]);
    if(!mousePressed){
      xPos[i] += random(-.5, .5);
      yPos[i] += random(-.5, .5);
      zPos[i] += random(-.5, .5);
    }
//Slow down motion    
    if(mouseX > 480 && mouseY > 480){
      fill(200);
      rect(0,0,500,500);
    }
    if(mouseX < 30 && mouseY > 470){
      stroke(255, 0, 0);
    }
    if(mouseX > 30 && mouseX < 60 && mouseY > 470){
      stroke(0, 255, 0);
    }
    if(mouseX > 60 && mouseX < 90 && mouseY > 470){
      stroke(0, 0, 255);
    }
    if(mouseX > 90 && mouseX < 120 && mouseY > 470){
      strokeWeight(3);
    }
    if(mouseX > 120 && mouseX < 150 && mouseY > 470){
      strokeWeight(1);
    }
  }
  
  
}
