
//Property of Derek Gryga
//Generated 18 February 2013
//Credit to Ben Norskov for the Hair Easing Code!  It is labeled "!=EZHair".
//int sector2startvalue = 250;
//int sector2endvalue = 500;
//int sector3value = 500;
//int sector4value = 4;
//int sector5value = 5;
//int sector6value = 6;
void setup() {
  size(1000, 1000);
}
void draw() {
  background(255);
  //sector2startvalue = 250;
  //sector2endvalue = 500;
  //rect(width/4,height/4,  width/4, height/2);//Commented out for intersection display.
  line(width/4, 0, width/4, height/1);//Left line.
  line(width/2, 0, width/2, height/1);//Right Line.
  line(0, height/2, width/1, height/2);//Horizon line.
  if ((mouseX>0)&&(mouseX<250))
  if ((mouseY>0)&&(mouseY<500)){
    fill(100, 100, 24);                          //Start of Sector 1 Face Parts.
    ellipse(mouseX + -20, mouseY + -20, 50, 50);
    fill(255);
    ellipse(mouseX + -5, mouseY + -18, 12, 12);
    ellipse(mouseX + -30, mouseY + -18, 12, 12);
    fill(255, 255, 255);
    ellipse(mouseX + -5, mouseY + -18, 3, 3);
    ellipse(mouseX + -30, mouseY + -18, 4, 3);      //End of Sector 1 Face Parts.
  }
  if ((mouseX>250)&&(mouseX<500))                
  if ((mouseY>0)&&(mouseY<500)){
    fill(100, 100, 24);
    ellipse(mouseX + -20, mouseY + -20, 50, 50);
    fill(255);
    ellipse(mouseX + -5, mouseY + -18, 12, 6);
    ellipse(mouseX + -30, mouseY + -18, 12, 6);
    fill(255, 255, 255);
    ellipse(mouseX + -5, mouseY + -18, 3, 3);
    ellipse(mouseX + -30, mouseY + -18, 4, 3); 
  }
  if ((mouseX>500)&&(mouseX<1000))
  if((mouseY>0)&&(mouseY<500))  {
    fill(100, 100, 24);                          
    ellipse(mouseX + -20, mouseY + -20, 50, 70);
    fill(255);
    ellipse(mouseX + -5, mouseY + -18, 12, 12);
    ellipse(mouseX + -30, mouseY + -18, 12, 12);
    fill(255, 255, 255);
    ellipse(mouseX + -5, mouseY + -18, 3, 3);
    ellipse(mouseX + -30, mouseY + -18, 4, 3);
    fill(3,0,0);
    ellipse(mouseX + -20,mouseY + -1,10,10);
  }
  if((mouseX>0)&&(mouseX<250))
  if((mouseY>500)&&(mouseY<1000)){
  fill(100, 100, 24);
    ellipse(mouseX + -20, mouseY + -20, 50, 50);
    fill(255);
    ellipse(mouseX + -5, mouseY + -18, 12, 6);
    ellipse(mouseX + -30, mouseY + -18, 12, 12);
    fill(255, 255, 255);
    ellipse(mouseX + -5, mouseY + -18, 3, 3);
    ellipse(mouseX + -30, mouseY + -18, 4, 3);
    line(mouseX + -40,mouseY + -25,mouseX + -30,mouseY + -30);
    line(mouseX + 3,mouseY + -22,mouseX + -10, mouseY + -30);
    fill(111,201,255);
    ellipse(mouseX + -1,mouseY + -8,10,10);
}
   if((mouseX>250)&&(mouseX<500))
   if((mouseY>500)&&(mouseY<1000))  {
     fill(100, 100, 24);                          
    ellipse(mouseX + -20, mouseY + -20, 50, 50);
    fill(255);
    ellipse(mouseX + -5, mouseY + -18, 12, 12);
    ellipse(mouseX + -30, mouseY + -18, 12, 12);
    fill(255, 255, 255);
    ellipse(mouseX + -5, mouseY + -18, 3, 3);
    ellipse(mouseX + -30, mouseY + -18, 4, 3);
    fill(3,0,0);
    beginShape();
    vertex(mouseX + -19,mouseY + -10);
    vertex(mouseX + -16,mouseY + -10);
    vertex(mouseX + -14, mouseY + -2);
    vertex(mouseX + -20,mouseY + -2);  
    line(mouseX + -9,mouseY + -40,mouseX + 6, mouseY + -16);
    endShape(CLOSE);
 } 
 if((mouseX > 500)&&(mouseX < 1000))
 if((mouseY > 500)&&(mouseY < 1000))  {
    println("He will get you"); 
  beginShape();
  fill(3,0,0);
  vertex(mouseX + -30,mouseY + 100);
  vertex(mouseX + -58,mouseY + 5);
  vertex(mouseX + 20, mouseY + 5);
  vertex(mouseX + -5,mouseY + 100);
  endShape(CLOSE);
   fill(240, 240, 240);                          
    ellipse(mouseX + -20, mouseY + -20, 50, 80);  
}
}
