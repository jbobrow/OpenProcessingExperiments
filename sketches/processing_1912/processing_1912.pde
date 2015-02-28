
//I put the background in it's own class to lessen clutter in the draw box.

class BG {
  

  

  void showBG(){
  rectMode(CORNER);
  smooth();

//Start
 fill(50);
 rect(0,600,700,200);
 
 //Halfway point
 fill(50);
 rect(0,325,700,48);
 
 //Lilypads
  noFill();
 ellipse(80,35,55,55);
 ellipse(215,35,55,55);
 ellipse(350,35,55,55);
 ellipse(485,35,55,55); 
 ellipse(620,35,55,55);
   
  //Lilypad backgrounds
  noStroke();
  fill(18,85,3);
  rect(0,0,52,75);
  rect(106,0,82,75);
  rect(241,0,82,75);
  rect(376,0,82,75);
  rect(511,0,82,75);
  rect(646,0,82,75);   
  rect(0,0,700,5);
  //Road
  stroke(0);
  fill(145);
  rect(0,373,700,226);
  
  //Water
  fill(27,14,232);
  rect(0,60,700,265);
  
  

  }

  

}

