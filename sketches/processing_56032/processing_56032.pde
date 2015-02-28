
void setup() { 
  size(740, 500);
  smooth(); 
  strokeWeight(2);
  background(252, 174, 50);
  ellipseMode(RADIUS);
}
void draw() {
  
//neck
stroke(120);
strokeWeight(5);
line(240, 257, 240, 162);
line(260, 257, 260, 162);
line(280, 257, 280, 162); 


//Antennae

stroke(70);
strokeWeight(4);
line(265, 155, 230, 50);
line(276, 155, 306, 56);
  if(mousePressed){
    stroke(255);
    line(265, 155, 230, 50);
    line(276, 155, 306, 56);
  }
  
    
//body
noStroke();
fill(120, 48, 90); 
ellipse(264, 435, 40, 40);
fill(8);
strokeWeight(10);
fill(120, 40, 50);
rect(219, 257, 90, 120);
fill(70, 20, 10, 210);
rect(219, 274, 90, 120);  //arms
rect(180, 290, 168, 6);   //arms
strokeWeight(5);
fill(70, 40, 10, 210); // colour for orbs above arm
ellipse(180, 250, 20, 20);
ellipse(345, 250, 20, 20);

  if(mousePressed){
    fill (252, 3, 11);
    ellipse(180, 250, 20, 20);
    ellipse(345, 250, 20, 20);
} else {
    fill (255);
  }



  
//head
fill(0);
strokeWeight(20);
ellipse(264, 155, 50, 50);
fill(255);
ellipse(288, 150, 14, 14);
fill(0);
ellipse(288, 148, 5, 5);
fill(180, 60, 70);
ellipse(258, 148, 7, 7);
ellipse(270, 130, 5, 5);
ellipse(279, 170, 4, 4);
ellipse(247, 180, 6, 6);





}


