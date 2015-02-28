
     
void setup()   {
  size (500, 500);
  background(0,0,239); 
  smooth();
  frameRate(3);

  
}

void draw() {
  drawFish();

  
  //drawbutton
  fill(250,20,220);
  rect(250, 470, 160, 20);
    buttonClicked();
}

void drawFish() {
  for (int x = 65; x <= width; x += 90) {
    for (int y = 65; y <= height; y += 90) {
      //green
      fill(230,220,156);
      //topfin
      ellipse(x, y-30, 30, 40);
      //yellow
      fill(233,233,0);  
      //circle
      ellipse(x, y, 65, 65);  
      //black
      fill (0,0,0);
      //eyeleft
      ellipse(x-10, y, 10, 10);
      //black
      fill (0,0,0);
      //eyeright
      ellipse(x+10, y, 10, 10);
      //green
      fill(0,237,59);
      //mouth
      ellipse(x, y+20, 20, 3);
      //orange
      fill(235,100,20);
      //finleft
      triangle(x-30, y, x-50, y+20, x-50, y-20);
      //finright
      triangle(x+30, y, x+50, y+20, x+50, y-20);
         }
  }
}
      void buttonClicked()   {
        if ((mousePressed) && (mouseX >=250 && mouseX <=410 && mouseY >= 470 && mouseY <= 490))   {
        fill(255,0,0);
        rect(250, 470, 160, 20);

        for (int x = 65; x <= width; x += 90) {
           for (int y = 65; y <= height; y += 90) {
      //green
      fill(230,220,156);
      //topfin
      ellipse(x, y-30, 30, 40);
      //yellow
      fill(233,233,0);  
      //circle
      ellipse(x, y, 65, 65);  
      //black
      fill (0,0,0);
      //eyeleft
      ellipse(x-10, y, 10, 10);
      //black
      fill (0,0,0);
      //eyeright
      ellipse(x+10, y, 10, 10);
      //green
      fill(0,237,59);
      //mouth
      ellipse(x, y+20, 30, 15);
      //orange
      fill(235,100,20);
      //finleft
      triangle(x-30, y, x-50, y+20, x-50, y-20);
      //finright
      triangle(x+30, y, x+50, y+20, x+50, y-20);
         }
  }
}
    
      }      
        

        
