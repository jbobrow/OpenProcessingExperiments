
int xPos = 10;
int yPos = 10;
int bSize = 30;
int s = 20;

void setup(){
  
  size(800,600);
  background(83,83,83);
  noStroke();
  fill(44,44,44);
  rect(40,0,770,600);
  stroke(0);
  
  //button
  fill(251,86,128);
  rect(xPos,yPos,s,s);
  fill(212,85,136);
  rect(xPos,yPos+s,s,s);
  fill(101,235,208);
  rect(xPos,yPos+s+s,s,s);
  fill(186,233,191);
  rect(xPos,yPos+s+s+s,s,s);
  fill(226,240,187);
  rect(xPos,yPos+s+s+s+s,s,s);  
  
   fill(229,226,233);
    rect(xPos,yPos+s+s+s+s+s,s,s);
   fill(205,214,231);
  rect(xPos,yPos+s+s+s+s+s+s,s,s);
   fill(170,186,219);
  rect(xPos,yPos+s+s+s+s+s+s+s,s,s);
   fill(154,175,196); 
  rect(xPos,yPos+s+s+s+s+s+s+s+s,s,s);
   fill(115,93,114);
  rect(xPos,yPos+s+s+s+s+s+s+s+s+s,s,s);
}

void draw(){
  
  if(mousePressed){
    
    if(mouseX > 40 && mouseX < 800 && mouseY > 0 && mouseY < 600){     
     // 
      line(pmouseX,pmouseY,mouseX,mouseY);
    }
    
    if(mouseX > xPos && mouseX < xPos+s && mouseY > yPos && mouseY < yPos+s){
      stroke(251,86,128);
      strokeWeight(4);
    }
    
    if(mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s && mouseY < yPos+s+s){
      stroke(212,85,136);
      strokeWeight(4);
    }
    if(mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s && mouseY < yPos+s+s+s){
      stroke(101,235,208);
      strokeWeight(4);
    }
    if(mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s && mouseY < yPos+s+s+s+s){
      stroke(186,233,191);
      strokeWeight(4);
    }
     if(mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s+s && mouseY < yPos+s+s+s+s+s){
      stroke(226,240,187);
      strokeWeight(4);
    }
     if(mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s+s+s && mouseY < yPos+s+s+s+s+s+s){
      stroke(229,226,233);
      strokeWeight(4);
    }
    if(mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s+s+s+s && mouseY < yPos+s+s+s+s+s+s+s){
      stroke(205,214,231);
      strokeWeight(4);
    }
     if(mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s+s+s+s+s && mouseY < yPos+s+s+s+s+s+s+s+s){
      stroke(170,186,219);
      strokeWeight(4);
    }
      if(mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s+s+s+s+s+s && mouseY < yPos+s+s+s+s+s+s+s+s+s){
      stroke(154,175,196);
      strokeWeight(4);
    }
     if(mouseX > xPos && mouseX < xPos+s && mouseY > yPos+s+s+s+s+s+s+s+s+s && mouseY < yPos+s+s+s+s+s+s+s+s+s+s){
      stroke(115,93,114);
      strokeWeight(4);
    }
  }
}
