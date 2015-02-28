


void setup()
{
  size (800, 800);
  background(0, 0, 0);
}




int value = 0;
void draw() {




  fill(value);
//  rect(200, 200, 50, 75);
  
  for ( int i=0;i<30;i++)


  {
     if (mousePressed && (mouseButton == LEFT)) 
     {
    line(mouseX+random(10), mouseY+random(10), pmouseX+random(10), pmouseY+random(10));
    strokeWeight(1);
     }
//    stroke(random(256), random(256), random(256));
  

  }
  
  if (mousePressed && (mouseButton == RIGHT)) {
   
    stroke(random(256),random(256),random(256));
  }
  
  
  
}


  void mouseClicked() {
    if (value == 0) {
      value = 60;
    } 
    else {
      value = 0;
    
  }
}

void keyPressed(){
   if (keyPressed && (key == ' '))
   rect(random(0,800), random(0,800), random(0,50), random(0,75));
     stroke(random(256),random(256),random(256));
   if (keyPressed && (key == 'e'))
       background(0);
  }


