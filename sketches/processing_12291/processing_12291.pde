
void setup()
{//"Kite Target" by Lizzy Graham
//Sept. 17, 2010
  // code here runs once
 
  size(400,400);
  background (250,190,0);
 stroke(pmouseX,pmouseY,0);
  line(pmouseX,pmouseY,mouseX,mouseY);
  //background(pmouseX,pmouseY,111);
  ellipse (200, 200, 390, 390);
  ellipse (200, 200, 350, 350);
  ellipse (200, 200, 310, 310);
  ellipse (200, 200, 270, 270);
ellipse (200, 200, 230, 230);
ellipse (200, 200, 190, 190);
ellipse (200, 200, 150, 150);
ellipse (200, 200, 110, 110);
ellipse (200, 200, 70, 70);
fill(0);
ellipse (200, 200, 30, 30);

}

void draw()
{
  {
  if(mouseY < 200)
  {
    cursor(CROSS);
  } else {
    cursor(HAND);
  }
}
//background(pmouseX,pmouseY,111);
  // code here is run repeatedly
 
 { if(mouseY <200)
 { fill(pmouseX,pmouseY,250);
 } else {
   fill(140,pmouseY, pmouseX);
 }
 }

line(mouseX,mouseY, 200, 200);
 
  rect(mouseX,mouseY,50,50);
  
 fill(0,250,0);
  rect(mouseX,mouseY,40,40);
   fill(250,0,0);
    rect(mouseX,mouseY,30,30);
    fill(pmouseX,pmouseY,250);
     rect(mouseX,mouseY,20,20);
      fill(250,200,0);
     
      rect(mouseX,mouseY,10,10);
    
  



}

