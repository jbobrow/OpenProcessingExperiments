
//name font
String line1 = "THE MELODRAMA OF LABOUR";
String line2 = "THE MENACE OF FAILURE";
String line3 = "THE DETERMINATION TO ACHIEVE";
String line4 = "TO MAKE ON BELIEVE";
String line5 = "THAT SUCCESS IS IN REACH";


void setup ()
{
  size (800,500);
  background (0);

 
}
void draw ()  {
  
  
  //block 1 (top)
  background (247,148,30);
  
    if(mouseY < 100 ) {
     
      fill(0);
      rect (0,0,800,100);
      noFill();
      
      fill(220);
      textAlign(CENTER);
      text(line1, mouseX, mouseY, 200, 200); // defines a box
      noFill();
      
    }


    if(mouseY < 200 && mouseY > 100 ) {
      noStroke();
      fill(0);
      rect (0,100,800,100);
      
      noFill();
      fill(220);
      textAlign(CENTER);
      text(line2, mouseX, mouseY, 250, 200); // defines a box
    }

    if(mouseY < 300 && mouseY > 200 ) {
      noStroke();
      fill(0);
      rect (0,200,800,100);
      noFill();
     
      fill(220);
      textAlign(CENTER);
      text(line3, mouseX, mouseY, 250, 200); // defines a box
    }

 if(mouseY < 400 && mouseY > 300 ) {
    
      noStroke();
      fill(0);
      rect (0,300,800,100);
      noFill();
   
      fill(220);
      textAlign(CENTER);
      text(line4, mouseX, mouseY, 200, 200); // defines a box
    }

 if(mouseY < 500 && mouseY > 400 ) {
    noStroke();
    
      fill(0);
      rect (0,400,800,100);
      noFill();   
   

      
      fill(220);
      textAlign(CENTER);
      text(line5, mouseX, mouseY, 200, 200); // defines a box
      
      
      
 }
  

  
}
