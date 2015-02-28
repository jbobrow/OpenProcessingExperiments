
class BlueBird{
  
  float x;
  float y;
  
  BlueBird(){
    
  }
  
  void draw(float x, float y, int s){
  
   
  //bird body  
  //underlying shadow
  fill(213,199,214,150);
  ellipse(x+10,y+110,90,20);
  //back wing
  noStroke();
  fill(48,230,252);
  ellipse(x+15,y-30,110,200);
  //tail
  strokeWeight(3);
  stroke(54,203,222);
  triangle(x-35,y+35,x-35,y+80,x-60,y+75);
  noStroke();
  //midsection
  fill(242,252,163);
  ellipse(x+10,y+5,100,190);
  fill(48,230,252);
  ellipse(x,y,100,210);
  //front wing
  strokeWeight(2);
  stroke(54,203,222);
  ellipse(x-10,y,50,200);
  //head
  ellipse(x+30,y-90,110,110);
  //beak
  noStroke();
  fill(242,114,34);
  triangle(x+70,y-75,x+100,y-75,x+70,y-55);
  triangle(x+70,y-75,x+70,y-50,x+100,y-45);
  //legs
  strokeWeight(4);
  stroke(242,114,34);
  line(x+40,y+80,x+40,y+110);
  line(x+5,y+95,x+5,y+130);
  ellipse(x+10,y+130,25,10);
  ellipse(x+40,y+110,25,10);
  noStroke();
  //eyes
  fill(255);
  ellipse(x+50,y-95,30,30);  
  drawPupil(x+59,y-95,15);
}

//code used from January 22 lecture notes
void drawPupil(float x, float y, float s)
{
  // Make the eye look at the mouse
  float angle = atan2(mouseY-y, mouseX-x);
  pushMatrix();
  translate(x, y);
  rotate(angle);
  fill(0);
  ellipse(s/4, 0, s, s);
  popMatrix();
}

}
    

