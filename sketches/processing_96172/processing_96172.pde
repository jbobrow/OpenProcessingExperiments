

PFont font;

void setup(){
  size(400,400);
  noCursor();
  
  font = loadFont ("arial.vlw");
textFont (font);

}

void draw (){
  background (270-mouseX,100,50+mouseX);
  strokeWeight(2);
  fill(255,189,5);
  ellipse(mouseX,-(mouseX/2)+250,50,50);
  fill(129,127,127);
  ellipse(mouseX,mouseY,20,10);
  triangle(mouseX-2,mouseY-10,mouseX+5,mouseY+5,mouseX-5,mouseY+5);
  strokeWeight (5);
  fill(255);
  triangle (width/2,height/2,200,00,300,height/2);
  triangle(width/2,height/2,200,50,130,height/2);
  quad(130,200,140,250,300,250,300,200);
  fill(14,32,126);
  strokeWeight (2);
  quad(0,250,0,400,400,400,400,250);
  
 
fill(0, 0,0);
text("ESP-14", 210, 130,300,130);

  
}


 



