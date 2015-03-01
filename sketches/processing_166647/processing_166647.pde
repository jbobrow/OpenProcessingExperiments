
//
boolean isOn = false;
color inside1 = color(124, 200, 232);
color inside2 = color(4, 150, 143);
color inside3 = color(95, 62, 150);

void setup(){
  size(500,500);

  background(4, 95, 135);
}


void draw(){
 
  //draw bubble
  
  // if mouse is clicked
    
    if(isOn){
    
    // draw branches
    noStroke();
    fill(inside2);
    ellipse(mouseX, mouseY, random(5,10), random(5,10));
    stroke(inside2);
    line(mouseX, mouseY, pmouseX, pmouseY);
    
    // draw leaves 
    fill(inside1);
    noStroke();
    bezier(mouseX, mouseY, mouseX+random(-25,25), mouseY+random(-25,25), mouseX+random(-25,25), mouseY+random(-25,25), mouseX, mouseY); 
    fill(inside3, random(200, 255));
    bezier(mouseX, mouseY, mouseX+random(-15,15), mouseY+random(-15,15), mouseX+random(-15,15), mouseY+random(-15,15), mouseX, mouseY); 
        
        
  } else{
    background(4, 95, 135);
    
  }


}

void mousePressed(){
  isOn = !isOn;
  println("Mouse Pressed");
}

void mouseReleased(){
  println("Mouse Released");
}


