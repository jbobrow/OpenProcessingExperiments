
//background 

void setup(){
   size(800,800);
   background(300,300,300);
   
}


//Pawprints

void draw(){   

 
//mousepressed 
{
   if (mousePressed == true) 
       println("mouse was pressed");
   }  
  
  
{
   if (keyPressed == true) 
       println("key was pressed");
   }  
fill (41,9,7);
ellipse (mouseX,mouseY+10,13,13);
ellipse (mouseX +15 ,mouseY,13,13);
ellipse (mouseX +48 ,mouseY +10,13,13);
ellipse (mouseX +35 ,mouseY,13,13);
ellipse (mouseX + 25 ,mouseY + 30,30,30);
}

int xValue = 70;
float yValue = 30;
String myName = "Kaleigh";
