
void setup() {
  //frameRate(20);
  size(1000,600);
 // background(0);
}

  //float seconds = 0;
  float x;
  float y;
  float easing=0.1;
  
  int brushWidth = 120;
  int brushHeight = 120;

  
  
void draw() {
  //seconds += 1.0/60.0;
  //seconds = seconds/60;
  //println(seconds);
  //background(0);
  //x = (mouseX * .5)+(width/4);
  //y = (mouseY * .5)+(height/4);
  //ellipse(x,y,50,50);
  
  float targetX = mouseX;
  x += (targetX - x) *easing;
 // ellipse(x,40,12,12);
  println(targetX + " : " + x);
 
  float targetY = mouseY;
  y += (targetY - y) *easing;
  ellipse(x,y,brushWidth,brushHeight);
/*  
 fill(255,0,0); // button to turn background red
  rect(10,10,50,50);
  if ((mouseX>10 && mouseX<60 && mouseY>10 && mouseY<60)){
    background(255,0,0);
  }
  
 fill(0,255,0); // button to turn background green
  rect(10,70,50,50);
  if ((mouseX>10 && mouseX<60 && mouseY>70 && mouseY<120)){
    background(0,255,0);
  }
  
 fill(0,0,255); // button to turn background blue
  rect(10,130,50,50);
  if ((mouseX>10 && mouseX<60 && mouseY>130 && mouseY<180)){
    background(0,0,255);
  }
  
  fill(255); //increase brush size
  rect(10,190,54,54);
  rect(10,190,52,52);
  rect(10,190,50,50);
  if ((mouseX>10 && mouseX<60 && mouseY>190 && mouseY<240)){
    brushWidth += 3;
    brushHeight += 3;
  }  
  fill(255); //decrease brush size
  rect(10,254,50,50);
  rect(10,254,48,48);
  rect(10,254,46,46);
  if ((mouseX>10 && mouseX<60 && mouseY>254 && mouseY<304)){
    brushWidth -= 3;
    brushHeight -= 3;
  }
  
  
  
  
 fill(255); //reset color
*/
}




