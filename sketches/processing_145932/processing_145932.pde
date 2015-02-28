
void setup () {
  size(600,700);
  background(#ffefb9);
  smooth();
  colorMode(HSB);
 }
 
 void draw () {
   
  //when mouse is clicked (black ink)
  if (mousePressed) {
      strokeWeight(12.0);
      strokeCap(ROUND);
      line(pmouseX, pmouseY, mouseX, mouseY);
}
 
  //when 1 is pressed (red paint)
  if(key=='1'){   
   stroke(#CE1500,255);
      strokeWeight (random(6));
      fill (#C60E00,80);
      ellipse (mouseX,mouseY,random(0,20),random(0,15));
      fill (#CE1500,180);
      ellipse (mouseX,mouseY,random(0,10),random(0,5));
      ellipse (mouseX+random(-10,15),mouseY+random(-10,15),random(0,5),random(0,5));
     
    stroke(#EF3C2E,#f7bd19,#f7bd19,#8C0A00);
      strokeWeight (30);
      fill (0,0,0,30);
      ellipse (mouseX,mouseY,random(0,20),random(0,10));
      rect (mouseX,mouseY,random(15,20),random(-10,20));
}   

   //when 2 is pressed (random shape outlines)
   if (key == '2'){
   pushMatrix();
   stroke(random(255), random(255), random(255));
   fill(random(255), random(255), random(255), random(100));
   ellipse(mouseX, mouseY, random(120), random(140));
   rect(mouseX + random(50), mouseY + random(20), random(30), random(40)); 
   popMatrix();
}

}

   






