
color brushColor;
int brushSize = 2;
int opacity = 255;
color red = color(255,0,0,opacity); 
color orange = color(255,175,0);
color yellow = color(255,255,0);
color green = color(0,255,0);
color blue = color(0,0,255);
color purple = color(125,0,255);
color pink = color(255,50,150);
color black = color(0);
color gray = color(175);
color white = color(255);
color bgColor = white;
color oldBgColor = white;
void setup() {
  size(700,900);
  smooth();
  background(bgColor);
}

void draw() {
  /*loadPixels();
  color drawings[] = new color[pixels.length];
  for (int i = 0; i < pixels.length; i++) {
    if(pixels[i] != oldBgColor){
    drawings[i] = pixels[i];
    }
    else if(pixels[i] == oldBgColor){
    drawings[i] = bgColor;
    }
  }
    for (int i = 0; i < pixels.length; i++) {
    pixels[i]=drawings[i];
    }
    updatePixels();*/
  stroke(0);
  strokeWeight(5);
  fill(255);
  rect(1,1,100,50); //clear button
  /*rect(1,1,100,25); //brush button
  rect(1,26,100,25); //eraser button*/
  
  rect(100,1,200,50); //brush box
  
  rect(200,1,300,50); //brush size box
  
  fill(red); // brush color boxes
  rect(100,1,40,25);  
  fill(orange);
  rect(140,1,40,25); 
  fill(yellow); 
  rect(180,1,40,25); 
  fill(green); 
  rect(220,1,40,25); 
  fill(blue); 
  rect(260,1,40,25); 
  fill(purple); 
  rect(100,26,40,25); 
  fill(pink); 
  rect(140,26,40,25); 
  fill(black);
  rect(180,26,40,25); 
  fill(gray); 
  rect(220,26,40,25); 
  fill(white);
  rect(260,26,40,25);
  
  /*fill(red); // background color boxes
  rect(100,849,40,25);  
  fill(orange);
  rect(140,849,40,25); 
  fill(yellow); 
  rect(180,849,40,25); 
  fill(green); 
  rect(220,849,40,25); 
  fill(blue); 
  rect(260,849,40,25); 
  fill(purple); 
  rect(100,874,40,25); 
  fill(pink); 
  rect(140,874,40,25); 
  fill(black);
  rect(180,874,40,25); 
  fill(gray); 
  rect(220,874,40,25); 
  fill(white);
  rect(260,874,40,25);*/
  
  for(int i=0; i<5; i++){ //brush size box
    fill(white);
    rect(300+(i*40),1,40,50);
    fill(black);
    ellipse(320+(i*40),25,(15-3*i),(15-3*i));
  }
  for(int i=0; i<5; i++){ //opacity box
    fill(white);
    stroke(0);
    rect(500+(i*40),1,40,50);
    fill(0,0,0,255-(i*60));
    noStroke();
    ellipse(520+(i*40),25,(25),(25));
  }
  
  
  fill(0);
  textSize(20); //text
  text("CLEAR",20,32);
  strokeWeight(brushSize);
    
  
  if(mousePressed){
    if((mouseX >= 1 && mouseX <= 100) && (mouseY >=  1 && mouseY <= 51)){//clear button
      background(255);
    }
      //BRUSH COLOR CHANGES
      if((mouseX >= 100 && mouseX <= 140) && (mouseY >= 1 && mouseY <= 26))
      brushColor = red;
       if((mouseX >= 140 && mouseX <= 180) && (mouseY >= 1 && mouseY <= 26))
      brushColor = orange;
       if((mouseX >= 180 && mouseX <= 220) && (mouseY >= 1 && mouseY <= 26))
      brushColor = yellow;
       if((mouseX >= 220 && mouseX <= 260) && (mouseY >= 1 && mouseY <= 26))
      brushColor = green;
       if((mouseX >= 260 && mouseX <= 300) && (mouseY >= 1 && mouseY <= 26))
      brushColor = blue;
      if((mouseX >= 100 && mouseX <= 140) && (mouseY >= 26 && mouseY <= 51))
      brushColor = purple;
       if((mouseX >= 140 && mouseX <= 180) && (mouseY >= 26 && mouseY <= 51))
      brushColor = pink;
       if((mouseX >= 180 && mouseX <= 220) && (mouseY >= 26 && mouseY <= 51))
      brushColor = black;
       if((mouseX >= 220 && mouseX <= 260) && (mouseY >= 26 && mouseY <= 51))
      brushColor = gray;
       if((mouseX >= 260 && mouseX <= 300) && (mouseY >= 26 && mouseY <= 51))
      brushColor = white;
       
       //SIZE CHANGES
       if((mouseX >= 300 && mouseX <= 340) && (mouseY >= 1 && mouseY <= 51))
       brushSize=20;
       if((mouseX >= 340 && mouseX <= 380) && (mouseY >= 1 && mouseY <= 51))
       brushSize=15;
       if((mouseX >= 380 && mouseX <= 420) && (mouseY >= 1 && mouseY <= 51))
       brushSize=10;
       if((mouseX >= 420 && mouseX <= 460) && (mouseY >= 1 && mouseY <= 51))
       brushSize=5;
       if((mouseX >= 460 && mouseX <= 500) && (mouseY >= 1 && mouseY <= 51))
       brushSize=2;
       
       //OPACTIY CHANGES
       if((mouseX >= 500 && mouseX <= 540) && (mouseY >= 1 && mouseY <= 51))
       opacity = 255;
       if((mouseX >= 540 && mouseX <= 580) && (mouseY >= 1 && mouseY <= 51))
       opacity = 195;
       if((mouseX >= 580 && mouseX <= 620) && (mouseY >= 1 && mouseY <= 51))
       opacity = 135;
       if((mouseX >= 620 && mouseX <= 660) && (mouseY >= 1 && mouseY <= 51))
       opacity = 75;
       if((mouseX >= 660 && mouseX <= 700) && (mouseY >= 1 && mouseY <= 51))
       opacity = 15;
       
      /* //BACKGROUND COLOR CHANGES
      if((mouseX >= 100 && mouseX <= 140) && (mouseY >= 849 && mouseY <= 874))
      oldBgColor=bgColor;
      bgColor = red;
       if((mouseX >= 140 && mouseX <= 180) && (mouseY >= 849 && mouseY <=874))
      oldBgColor=bgColor;
      bgColor = orange;
       if((mouseX >= 180 && mouseX <= 220) && (mouseY >= 849 && mouseY <= 874))
      oldBgColor=bgColor;
      bgColor = yellow;
       if((mouseX >= 220 && mouseX <= 260) && (mouseY >= 849 && mouseY <= 874))
      oldBgColor=bgColor;
      bgColor = green;
       if((mouseX >= 260 && mouseX <= 300) && (mouseY >= 849 && mouseY <= 874))
     oldBgColor=bgColor;
      bgColor = blue;
      if((mouseX >= 100 && mouseX <= 140) && (mouseY >= 874 && mouseY <= 899))
      oldBgColor=bgColor;
      bgColor = purple;
       if((mouseX >= 140 && mouseX <= 180) && (mouseY >=874 && mouseY <= 899))
      oldBgColor=bgColor;
      bgColor = pink;
       if((mouseX >= 180 && mouseX <= 220) && (mouseY >= 874 && mouseY <= 899))
      oldBgColor=bgColor;
      bgColor = black;
       if((mouseX >= 220 && mouseX <= 260) && (mouseY >= 874 && mouseY <= 899))
      oldBgColor=bgColor;
      bgColor = gray;
       if((mouseX >= 260 && mouseX <= 300) && (mouseY >= 874 && mouseY <= 899))
      oldBgColor=bgColor;
      bgColor = white;*/
  }
  
  if (mousePressed == true) { //draw lines
    stroke(color(red(brushColor),green(brushColor),blue(brushColor),opacity));
    line(mouseX, mouseY, pmouseX, pmouseY);
    
  }
}


