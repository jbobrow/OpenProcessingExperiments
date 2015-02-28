
float rectWidth = 200;
float rectHeight = 100;
float grow = 1;
color rectRed = color(255,0,0);
color rectBlue = color(0,0,255);

void setup() {

  size(600, 600);
  background(0);
}

void draw() {
  background(0);
  
  if(grow < 0){
    fill(rectRed);
  } else {
    fill(rectBlue);
  }
  
  rectMode(CENTER);
  rect(width/2, height/2, rectWidth, rectHeight);
  
   //grow width
  rectWidth = rectWidth + grow;
  //grow height
  rectHeight = rectHeight + grow;
  
  if (rectWidth > 400) {
    grow = - grow;
      }
      else if (rectHeight <0) { 
        grow = - grow;
      }
 
  
  
  
  
}



