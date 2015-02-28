
//sketch for lama that moves with your mouse, the eye colour changes for the position and if you click a head apears

void setup (){
  // size window
  size(200,200);
  }
void draw (){
  // blue background and colour for fill
  background(120,50,255);
  fill(255,153,0);
  
  // ellipse in center mode
  ellipseMode(CENTER);
  
  //neck and head
  rect(mouseX-30,mouseY-40,10,40);
  ellipse(mouseX-33,mouseY-40,30,15);
  
  // body
  ellipse(mouseX,mouseY,60,50);
  
  //legs
  line(mouseX-15,mouseY+10,mouseX-20,mouseY+50);
  line(mouseX-10,mouseY+23,mouseX,mouseY+50);
  line(mouseX+10,mouseY+10,mouseX+13,mouseY+50);
  line(mouseX+15,mouseY+21,mouseX+23,mouseY+50);
  
  //tail
  line(mouseX+30,mouseY,mouseX+45,mouseY+5);
  line(mouseX+38,mouseY+3,mouseX+44,mouseY+2);
  line(mouseX+37,mouseY+3,mouseX+42,mouseY+8);
  
  //eye
  fill(mouseX+75,mouseY+75,20);
  ellipse(mouseX-28,mouseY-42,3,6);

//when the mouse is pressed
if(mousePressed){
  //hoedje
  fill(50,255,100);
  triangle(mouseX-35,mouseY-46,mouseX-25,mouseY-60,mouseX-17,mouseY-42);
}
}           
