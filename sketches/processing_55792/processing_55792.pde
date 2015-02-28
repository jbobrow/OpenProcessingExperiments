
float elemHeight = 1;
float elemWidth = 1;
color c;


void setup() {
  size(500, 500);
  smooth();
  c = color(237,255,0);
  
} 

void draw() {
  background(0);
  stroke(#002CFC);
  strokeWeight(8);
  
  if (mousePressed) {
    fill(random(255));
  } else {
   fill(c);
 
  }  
  
  rect(75, 75, 350, 350);
  
  //horns
  float x = sin(frameCount) + width/2;
  float y = cos(frameCount) + height/2;
  
  fill(255,0,0);
  ellipse(x,y,15,15);
  
  //left arm
  line(75, 200, 25, 350);

  //right arm
  line(425, 200, 475, 350);

  //left leg
  line(180, 425, 180, 480);

  //right leg
  line(320, 425, 320, 480);
  
  //left eye
  ellipse(150, 150, 50, 50);
  ellipse(150, 150, 10, 10);
  
  //middle eye
  ellipse(250,150,50,50);
  ellipse(250,150,10,10);


  //right eye
  ellipse(350, 150, 50, 50); 
  ellipse(350, 150, 10, 10);
 
  //mouth
  rect(200, 300, 100, 50);

  fill(255);
  
  //horns

  fill(255,0,0);
  triangle(78,77,162,75,116,14);
  fill(255,0,0);
  triangle(427,74,356,76,392,10);

  if(mousePressed){
    //left eye
    fill(random(255));
  ellipse(150, 150, 50, 50);
  ellipse(150, 150, 10, 10);
  
   //middle eye
  ellipse(250,150,50,50);
  ellipse(250,150,10,10);

  //right eye
  fill(random(255));
  ellipse(350, 150, 50, 50); 
  ellipse(350, 150, 10, 10);
  
  //mouth
  rect(200, 300, 100, 50);
  
  
  } else {
    //left eye
  fill(0, 0, 0);
  ellipse(150, 150, 50, 50);
  ellipse(150, 150, 10, 10);
  
  //middle eye
  ellipse(250,150,50,50);
  ellipse(250,150,10,10);


  //right eye
  ellipse(350, 150, 50, 50); 
  ellipse(350, 150, 10, 10);
 
  //mouth
  fill(255,255,255);
  rect(200, 300, 100, 50);
  
  }
  
}




void mousePressed() {
 
 println(mouseX + "--" + mouseY);
  
}


void keyPressed() {
  
  println("'" + key + "' was pressed (keycode " + keyCode + ")"); 

  switch(keyCode) {
  case 37 :
    elemHeight -= 0.1;
    break;   
  case 38 : 
    elemWidth -= 0.1;
    break;
  case 39 :
    elemHeight += 0.1;
    break;
  case 40 :
    elemWidth += 0.1;
    break;
  }

  switch(key) {
  case ' ' :
    c = color(random(255), random(255), random(255));
    break;
  }
}




