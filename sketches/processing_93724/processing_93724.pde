
float i;


void setup(){
  
  size(500,500);
  smooth();
  
  i=0;
  
}
  
  
  
void draw(){
    
 background(255);
   
 //space
 fill(255,255,255);
 strokeWeight(0);
 quad(0,0,400,0,400,390,0,390);
 fill(190,221,244);
 quad(0,390,400,390,500,500,0,500);
    
  //shade
  fill(168,185,199);
  ellipse(250,404,80,20);
  
 //body
 strokeWeight(5);
 fill(239,103,110);
 quad(230,230,270,230,300,380,200,380);
    
 fill(232,196,206);
 quad(210,320,290,320,270,230,230,230);
    
 fill(10,230,230);
 stroke(0);
    
 //Hair
 fill(0,0,0);
 triangle(275+(mouseX-250)/30,225-(mouseY+250)/30,308+(mouseX-250)/30,215-(mouseY+250)/30,285+(mouseX-250)/30,195-(mouseY+250)/30);
 fill(193,27,27);
 ellipse(275+(mouseX-250)/30,225-(mouseY+250)/30,20,20);
    
    
  //face
  fill(255,255,255);
  strokeWeight(4);
  ellipse(width/2,height/2,110,110);
    
    
    
 //eye
 strokeWeight(4);
 line(210+(mouseX-250)/15,240+(mouseY-250)/15,230+(mouseX-250)/15,240+(mouseY-250)/15);
 line(270+(mouseX-250)/15,240+(mouseY-250)/15,290+(mouseX-250)/15,240+(mouseY-250)/15);
   
   
 //arm
 strokeWeight(7);
 line(215,300,215+(mouseX-250)/6,300+(mouseY-250)/6);
 line(285,300,310,330);
    
    
  //spray
  fill(103,180,239);
  rect(215+(mouseX-250)/6,280+(mouseY-250)/6,10,40);
    
    
  //leg
  strokeWeight(4);
  line(230,380,230,400);
  line(270,380,270,400);
    
    
    
    
    
    
    
    
    
    
    
    
  /////////////////////////////////
  // * Assignment 2 *            //
  //FLY is getting bigger!!!!    //
  //And if you click the mouse,  //
  //It will be small again.      //
  //yuck! But it's Cute...       //
  /////////////////////////////////
  
  
  
  
  
  //Fly
  strokeWeight(1);
    
  //Fly Body
  fill(0,0,0);
  ellipse(mouseX,mouseY+6,25+i+i,20+i+i);
    
    
  //Fly wing
  fill(255,255,255);
  ellipse(mouseX-10-i,mouseY+6+i/5,16+i+i,6+i);
  ellipse(mouseX+10+i,mouseY+6+i/5,16+i+i,6+i);
      
   //fly eye
  fill(255,255,255);
  ellipse(mouseX-5-i/2,mouseY-i,10+i,10+i);
  ellipse(mouseX+5+i/2,mouseY-i,10+i,10+i);
  fill(0,0,0);
  ellipse(mouseX-5-i/2,mouseY-i,4+i/2,4+i/2);
  ellipse(mouseX+5+i/2,mouseY-i,4+i/2,4+i/2);
    
 
  if (i > 50) {
    // worm reached the end, reset to initial value:
    i = 0;
  } 
  else {
    
    
    // growth: the new wormsize will be the old wormsize plus one:
    i=i+0.3;
  }

  // draw a horizontal line through the canvas:
  
}  
    
void mouseClicked() {
   i=0;
}
