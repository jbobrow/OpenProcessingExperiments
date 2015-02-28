
boolean test;
void setup(){
  size(500,500);
  background(0);
  test=true;
}
void draw(){
  fill(255,255,0);
  stroke(0);
  arc(mouseX, mouseY, 100, 100, 0.63, 5.65);


  if(keyPressed==true){        //complete background
    if(key=='b'){
noStroke();
for (int y = 0; y <= height; y += 40) {
  for (int x = 0; x <= width; x += 40) {
    fill(0,0,255);
    ellipse(x, y, 40, 40);
  }
}
    }
  }
  if (mousePressed==true){     //pacman yellow
    fill(255,255,0);
    arc(mouseX, mouseY, 140, 140, 0.63, 5.65);
    
  }
 if(keyPressed==true){             //orange with leaf 
   if(key=='o');
   
   fill(255,97,3);      //row 1 of ORANGES
   ellipse(40, 40, 40, 40);
   fill(0,255,0);
   quad(40, 20, 55, 10, 52, 20, 40, 20);
    fill(255,97,3);
   ellipse(120, 40, 40, 40);
    fill(0,255,0);
    quad(120, 20, 135, 10, 132, 20, 120, 20);
      fill(255,97,3);
   ellipse(200, 40, 40, 40);
    fill(0,255,0);
    quad(200, 20, 215, 10, 212, 20, 200, 20);
      fill(255,97,3);
   ellipse(280, 40, 40, 40);
    fill(0,255,0);
    quad(280, 20, 295, 10, 292, 20, 280, 20);
      fill(255,97,3);
   ellipse(360, 40, 40, 40);
    fill(0,255,0);
    quad(360, 20, 375, 10, 372, 20, 360, 20);
      fill(255,97,3);
   ellipse(440, 40, 40, 40);
    fill(0,255,0);
    quad(440, 20, 455, 10, 452, 20, 440, 20);
    
    fill(255,97,3);      //row 2 of ORANGES
   ellipse(40, 440, 40, 40);
   fill(0,255,0);
   quad(40, 420, 55, 410, 52, 420, 40, 420);
    fill(255,97,3);
   ellipse(120, 440, 40, 40);
    fill(0,255,0);
    quad(120, 420, 135, 410, 132, 420, 120, 420);
      fill(255,97,3);
   ellipse(200, 440, 40, 40);
    fill(0,255,0);
    quad(200, 420, 215, 410, 212, 420, 200, 420);
      fill(255,97,3);
   ellipse(280, 440, 40, 40);
    fill(0,255,0);
    quad(280, 420, 295, 410, 292, 420, 280, 420);
      fill(255,97,3);
   ellipse(360, 440, 40, 40);
    fill(0,255,0);
    quad(360, 420, 375, 410, 372, 420, 360, 420);
      fill(255,97,3);
   ellipse(440, 440, 40, 40);
    fill(0,255,0);
    quad(440, 420, 455, 410, 452, 420, 440, 420);
}

}





