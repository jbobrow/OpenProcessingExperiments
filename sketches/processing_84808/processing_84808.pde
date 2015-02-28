
void setup()
{
/*import processing.pdf.*;*/
  size(400,600);
  background(255);
  smooth();
}

void draw()
{
  /*beginRecord(PDF, "formes simples pdf 1.pdf");*/
  //forme 1 de gauche à droite// Jeux de symétrie triangle
  noFill();
  stroke(0);
  beginShape();
  vertex(80,65);
  vertex(80,25);
  vertex(125,75);
  vertex(40,75);
  vertex(80,115);
  
  endShape();
  
  
  //forme 2 vide
    noFill();
  stroke(0);
  translate(110,0);
  beginShape();
  vertex(80,65);
  vertex(80,25);
  vertex(125,75);
  vertex(40,75);
  
  endShape();
  
  //Partie pleine de la forme2
   beginShape(); 
   fill(0);
    vertex(40,75);
   vertex(80,125);
  vertex(80,75);
  
  endShape();
  
   //forme 2 vide
    noFill();
  stroke(0);
  strokeWeight(3);
  translate(110,0);
  beginShape();
  vertex(80,65);
  vertex(80,25);
  vertex(125,75);
  vertex(40,75);
  
  endShape();
  
  
  //Partie pleine de la forme 3
   beginShape(); 
   fill(0);
    vertex(40,75);
   vertex(80,125);
  vertex(80,75);
  
  endShape();
  
  
   //forme 4 vide
    noFill();
  stroke(0);
  strokeWeight(2);
  translate(-220,130);
  beginShape();
  vertex(80,65);
  vertex(80,25);
  vertex(125,75);
  vertex(40,75);
   vertex(80,125);
  vertex(80,85);
  
  endShape();
  
   //FORME 5 
    noFill();
  stroke(0);
  strokeWeight(2);
  translate(110,0);
  beginShape();
  vertex(80,65);
  vertex(80,25);
  vertex(125,75);
  vertex(40,75);
  vertex(40,60);
 vertex(60,41); 
  endShape();
  
  //FORME 6
  
   noFill();
  stroke(0);
  strokeWeight(2);
  translate(110,0);
  beginShape();
   vertex(80,25);
  vertex(125,75);
  vertex(40,75);
  vertex(40,60);
 endShape();
 
 //FORME 7
 
  noFill();
  stroke(0);
  strokeWeight(2);
  translate(-220,130);
  beginShape();
   vertex(80,30);
  vertex(125,75);
  vertex(40,75);
  vertex(60,50);
 endShape();
 
 //FORME 8
  noFill();
  stroke(0);
  strokeWeight(2);
  translate(110,0);
  beginShape();
  vertex(80,45);
  vertex(80,25);
  vertex(80,60);
  vertex(125,75);
  vertex(40,75);

  endShape();
  
   beginShape();
   fill(0);
   vertex(80,25);
  vertex(125,73);
  vertex(80,45);
   endShape();
   
    //FORME 9
  noFill();
  stroke(0);
  strokeWeight(2);
  translate(110,0);
  beginShape();
  vertex(80,15);
  vertex(80,25);
  vertex(80,60);
  vertex(125,75);
  vertex(40,75);

  endShape();
  
   beginShape();
   fill(0);
   vertex(79,10);
  vertex(125,73);
  vertex(79,60);
  
   endShape();
   
   
   //Forme 10
    noFill();
  stroke(0);
  strokeWeight(2);
  translate(-220,100);
  beginShape();
  vertex(85,62);
  vertex(80,55);
  vertex(80,15);
  vertex(125,75);
  vertex(40,75);
  vertex(40,60);
 vertex(60,41); 
  endShape();
 
 //Forme 11
    noFill();
  stroke(0);
  strokeWeight(2);
  translate(110,0);
  beginShape();
  vertex(85,62);
  vertex(80,55);
  vertex(80,15);
  vertex(125,75);
  vertex(40,75);
  vertex(35,70); 
  endShape();
  
  //Forme 12
    noFill();
  stroke(0);
  strokeWeight(2);
  translate(110,0);
  beginShape();
  vertex(85,62);
  vertex(80,55);
  vertex(80,15);
  vertex(125,75);
  vertex(40,75);
  vertex(32,82);
  endShape();
  
    //Forme 13
    noFill();
  stroke(0);
  strokeWeight(2);
  translate(-220,110);
  beginShape();
  vertex(92,75);
  vertex(80,55);
  vertex(80,15);
  vertex(125,75);
  vertex(40,75);
  endShape();
 
 
     //Forme 14
    fill(0);
  translate(110,0);
  beginShape();
  vertex(92,75);
  vertex(80,55);
  vertex(80,15);
  vertex(125,75);
  vertex(40,75);
  endShape();
  
       //Forme 14
    fill(0);
  translate(110,0);
  beginShape();
  /*vertex(92,75);*/
  vertex(80,55);
  vertex(80,15);
  vertex(125,75);
  vertex(40,75);
  endShape();
 
  
 
  
//forme raté 
/*fill(0);
translate(110,0);
  beginShape();
  vertex(80,75);
  vertex(80,25);
  vertex(100,95);

  endShape();*/
  
  /*endRecord();*/
  noLoop();
}


