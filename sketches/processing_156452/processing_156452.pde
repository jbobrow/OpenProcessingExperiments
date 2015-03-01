
color B1 = color(0,0,0);//black
color B2 = color(255,255,255);//white
color B3 = color(183,0,0);//red
color B4 = color(242,101,12);//orange
color B5 = color(255,255,0);//yellow
color B6 = color(0,128,0);//green
color B7 = color(0,0,255);//blue
color B8 = color(128,0,128);//purple
color B9 = color(255,128,192);//pink
color B10 = color(128,128,128);//grey
color B11 = color(128,64,0);//brown
color B12 = color(random(255), random(255), random(255));//green "random" 
color B13 = color(255,128,128); //pink erase
color penColor = color(0,0,0); 
float oldX, oldY;
int thick = 1; 

void setup(){
  size(600,600);
  smooth();
  background(255);
}

void draw(){
  stroke(0);
  fill(B1);
  rect(520,0,40,40); //black button
  fill(B2);
  rect(560,0,40,40); //white button
  fill(B3);
  rect(520,40,40,40); //red button
  fill(B4);
  rect(560,40,40,40); //orange button
  fill(B5);
  rect(520,80,40,40); //yellow button
  fill(B6);
  rect(560,80,40,40); //green button
  fill(B7);
  rect(520,120,40,40); //blue button
  fill(B8);
  rect(560,120,40,40); //purple button
  fill(B9);
  rect(520,160,40,40); //pink button
  fill(B10);
  rect(560,160,40,40); //grey button
  fill(B11);
  rect(520,200,40,40); //brown button
  fill(128,255,29);
  rect(560,200,40,40); //random button
  fill(B13);
  stroke(0);
  rect(520,250,80,40); //erase button
  fill(0);
  rect(520,240,80,10);
  
 

  
  if(mousePressed) {
    if(mouseX > 520 && mouseX < 560) {
      if(mouseY > 0 && mouseY < 40){
        penColor = B1;
        thick = 2;
      }
      else if(mouseY > 40 && mouseY < 80) {
        penColor = B3;
        thick = 2; 
      }
      else if(mouseY > 80 &&  mouseY < 120){
        penColor = B5;
        thick = 2;
      }
      else if(mouseY > 120 &&  mouseY < 160){
        penColor = B7;
        thick = 2;
      }
      else if(mouseY > 160 &&  mouseY < 200){
        penColor = B9;
        thick = 2;
      }
      else if(mouseY > 200 && mouseY < 240) {
        penColor = B11;
        thick = 2;
      }
      else if(mouseY > 240 && mouseY < 260) {
        penColor = B1;
        thick = 5; 
      }
      else if(mouseY > 260 && mouseY < 300){
        background(255);
      }
    }
    if(mousePressed){
      if(mouseX > 560 && mouseX < 600){
        if(mouseY > 0 && mouseY < 40){
          penColor = B2;
          thick = 2; 
        }
        else if(mouseY > 40 && mouseY < 80){
          penColor = B4;
          thick = 2;
        }
        else if (mouseY > 80 && mouseY < 120){
          penColor = B6;
          thick = 2;
        }
        else if(mouseY > 120 && mouseY < 160) {
          penColor = B8;
          thick = 2; 
        }
        else if(mouseY > 160 && mouseY < 200) {
          penColor = B10;
          thick = 2;
        }
        else if(mouseY > 200 && mouseY < 240) {
          penColor = B12; 
          thick = 2;
        }
        else if(mouseY > 240 && mouseY < 260) {
          penColor = B1;
          thick = 5; 
        }
        else if (mouseY > 260 && mouseY < 300){
          background(255);
        }
      }
    }     
    stroke(penColor);
    strokeWeight(thick);
    line(oldX, oldY, mouseX, mouseY);
  }
  oldX = mouseX;
  oldY = mouseY;  
}
                
                                
