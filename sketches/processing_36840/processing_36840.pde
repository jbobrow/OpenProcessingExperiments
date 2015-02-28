
//Stephanie Callaghan
//Lab Assignment 3.2
//Changing Musical Notes

void setup(){
  size(600,200);
  background(225,175,230); //setting the size and color of program
}

int numOfnotes = 1; //setting program so that it only draws one of each note

void draw (){
  strokeWeight(2);
  line(0,50,width,50);
  line(0,70,width,70);
  line(0,90,width,90);
  line(0,110,width,110);
  line(0,130,width,130); //these bars will remain the same while music notes change
  
   if (numOfnotes > 0){ //setting program so that it only draws one of each note
    noStroke();
    fill(0);
    
    float firstNote = random(50,130);
    float secondNote = random(50,130);
    float thirdNote = random(50,130);
    float fourthNote = random(50,130);
    float fifthNote = random(50,130);
    float sixthNote = random(50,130);
    float seventhNote = random(50,130);
    float eighthNote = random(50,130);
    float ninthNote = random(50,130);
    float tenthNote = random(50,130); //setting random location to change each note
   
    ellipse(25, firstNote, 25,20);
    ellipse(75,secondNote,25,20);
    ellipse(125,thirdNote,25,20);
    ellipse(175,fourthNote,25,20);
    ellipse(225,fifthNote,25,20);
    ellipse(275,sixthNote,25,20);
    ellipse(325,seventhNote,25,20);
    ellipse(375,eighthNote,25,20);
    ellipse(425,ninthNote,25,20);
    ellipse(475,tenthNote,25,20); // x-coordinate is set for each note, y-coordinate is random
   
    stroke(1);
    line(35,firstNote,35,firstNote-60);
    line(85,secondNote,85,secondNote-60);
    line(135,thirdNote,135,thirdNote-60);
    line(185,fourthNote,185,fourthNote-60);
    line(235,fifthNote,235,fifthNote-60);
    line(285,sixthNote,285,sixthNote-60);
    line(335,seventhNote,335,seventhNote-60);
    line(385,eighthNote,385,eighthNote-60);
    line(435,ninthNote,435,ninthNote-60);
    line(485,tenthNote,485,tenthNote-60); // x-coordinate is set, while y-coordinate corresponds to its random ellipse
   }

  numOfnotes--;// keeps each note from repeating more than once
  }


