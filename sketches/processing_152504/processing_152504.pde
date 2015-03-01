
PImage layout;

float move = 20;
float move2 = 20;
float spessore;
float opacita2;
color c;
color gomma;

void setup() {

  size (800,600);
  background(255);
layout = loadImage("layoutPaint.png");
image(layout, 0, 0);
noStroke();
gomma = get(770, 571);

  
}
void draw() {
  

       color gomma = color(255,255,239);

  
  //Scrollbar1 STROKE
  stroke(0);
  strokeWeight(1);
  fill(255);
  rectMode(CORNER);
  rect(570,20, 20, 95);
  fill(0);
  if (mouseY>=20 && mouseY<=105 && mouseX>570 && mouseX<590) {
  if (mouseY>=20 && mouseY<=105 && mouseX>570 && mouseX<590 && mousePressed==true ) {
      move = mouseY;
    rect(570, move, 20, 10);
  spessore = map(move, 18, 104, 0, 255);
  println(spessore);
  
  }
    }
     rect(570, move, 20, 10);
     
     
     
  //scrollbar2   OPACITY    
  fill(255);
  rectMode(CORNER);
  rect(620,20, 20, 95);
  fill(0);
  if (mouseY>=20 && mouseY<=105 && mouseX>620 && mouseX<640) {
  if (mouseY>=20 && mouseY<=105 && mouseX>620 && mouseX<640 && mousePressed==true ) {
   rect(620, mouseY, 20, 10);
  move2 = mouseY;
  opacita2 = map(move2, 18, 104, 0, 255);
  println(opacita2);
  }
    }
     rect(620, move2, 20, 10);
     
  
  
  
  
  

 
  strokeWeight(1 + spessore/8);

   
   //RGBKW
  
if (mousePressed && mouseX>28 && mouseX<540 && mouseY>12 && mouseY<130)
   { 
      c = get(mouseX, mouseY);
        stroke(c); 


   }

//GOMMA  
    if (mousePressed && mouseY<117 && mouseY>36 && mouseX>682 &&mouseX<720)
      {
         gomma = color(255,255,239);
        c = gomma;
  

      }   

  

        
if (mousePressed && mouseX>10 && mouseX<780 && mouseY>130 && mouseY<580) 
{
  stroke(c, 255 - opacita2);
  line(mouseX,mouseY,pmouseX,pmouseY);
}
  


  
//Colors
  fill(c);
  noStroke();
   rect(740,20, 50, 100);


  
  
  

println(mouseX, mouseY);

 
     
     // reset
     
      
 
       }
       
        void keyPressed() {
       if ((keyCode==ENTER) || (keyCode==BACKSPACE )) {
         image(layout, 0, 0);
 
       
       }
         
     
     
     
    
     
   }   




