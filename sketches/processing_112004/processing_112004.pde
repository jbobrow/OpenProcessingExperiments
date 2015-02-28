
void setup () {
 size (500, 500);
  background (0,0,0);
}

void draw() { 

  if (mouseX> width/3)
  fill(17, 63, 75);
  rect(167,167,167,167);
  
 noStroke ();
 
  if (mouseY> height/6)
  fill(36, 133, 157);
  rect(190, 190, 120, 120);
  
  if (mouseY< height/6)
  fill(106, 221, 217);
  rect(230, 230, 80, 80);
  
  if ((mouseX<83.5 && mouseY>417.5)) 
  fill (194, 161, 104);
  ellipse (460, 50, 50, 50);
  
  if ((mouseX<200 && mouseY>334)) 
  fill (200, 198, 195);
  ellipse (410, 110, 30, 30);
  
   if ((mouseX<200 && mouseY>334)) 
  fill (251, 232, 157);
  ellipse (370, 150, 15, 15);
  
  if ((mouseX>300 && mouseY>334)) 
  fill (194, 161, 104);
  ellipse (40, 450, 50, 50);
  
  if ((mouseX>100 && mouseY<334)) 
  fill (200, 198, 195);
  ellipse (90, 395, 30, 30);
  
  if ((mouseX>300 && mouseY>334)) 
  fill (251, 232, 157);
  ellipse (140, 350, 15, 15);
  
  

}


