

void setup(){
size(500,500);
smooth();
background(255);


}

void draw(){
  
  
  //ORIGAMI STRUCTURE
  
  noStroke();
  fill(127, 210, 234,2.5);
  quad(pmouseX, pmouseY, 260,240, 332,334, 215, 306);
  
  
  noStroke();
  fill(127, 210, 234, 1);
  quad(260,240,292, 127,352, 184, pmouseX,pmouseY);
  
  
  noStroke();
  fill(127, 210, 234, 1);
  triangle(140, 213, 255, 203,260, 240);
  
  
  noStroke();
  fill(127, 210, 234,2.5);
  triangle(255, 203, 292,126,260, 240);
  
  
  
}

