
int cursorX, cursorY;

int selected_box=0;

void setup(){

size(800,800);
smooth();



}




void draw(){
  
  
    background(128);
    
    

  
  //shapes
  
  rectMode(CENTER);
  

  stroke(0);
  
  fill(255,0,0);
  rect(200,200,50,50);
  
  fill(0,255,0);
  rect(500,300,60,60);
  
  fill(0,0,255);
  rect(100,500,50,50);
  
  
  
  
  
  
  //draw butterfly cursor
  
  noCursor();
  
    if(selected_box == 1){
      strokeWeight(3);
    fill(200,0,0);
    
  }
  
  else if(selected_box == 2){
    fill(0,200,0);
    
  }
  
  else if(selected_box == 3){
    fill(0,0,200);
    
  }
  
    else{fill(255,255,0);}

  
  float flap_amount = round(map(sin(millis()/150), -1,1, 128,255));

  
  noStroke();
  //fill(255,255,0);
  ellipseMode(CORNER);
  ellipse(mouseX+5,mouseY,.1*flap_amount,20);
  ellipse(mouseX+5,mouseY-8,.1*flap_amount,20);
  
  ellipse(mouseX,mouseY,-1*(.1*flap_amount),20);
  ellipse(mouseX,mouseY-8,-1*(.1*flap_amount),20);
  
  
  stroke(0);
  fill(0);
  ellipse(mouseX,mouseY,5,15);
  

  
  
  
  
}

void mousePressed(){
  
  if(mouseX > 175 && mouseX < 225 && mouseY > 175 && mouseY < 225){
    
    selected_box = 1;
    println("you selected the red box");
    
  }
  
  
  
    if(mouseX > 475 && mouseX < 525 && mouseY > 275 && mouseY < 325){
    
    selected_box = 2;
    println("you selected the green box");
    
  }
  
      if(mouseX > 75 && mouseX < 125 && mouseY > 475 && mouseY < 525){
    
    selected_box = 3;
    println("you selected the blue box");
    
  }
  
  
  
}


