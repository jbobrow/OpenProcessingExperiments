
void setup(){
  size(500,500);
}


void draw(){
    background(0);
    //drawEllipse();
    
    fill(255);
  ellipse(250,220, 250,250);
    fill(0);
  ellipse(150,200,20,20);

   if (mousePressed == true) {
    fill(255);
    stroke(255);
  } else {
    fill(0);
    
  }
   ellipse(350,200,20,20);
   
   
   if (mousePressed == true) {
    fill(0);
    stroke(0);
  } else {
    noFill();
    noStroke();
    
  }
   rect(330,200,30,10);
}

  
void drawEllipse(){
  fill(0);
  ellipse(350,200,20,20);
}

void drawRect(){
  fill(0);
  rect(340,200,40,20);
}
   // ellipse(x,y,20,20);







