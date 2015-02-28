
/*
hw2
Liz Rutledge
Aguest 3

*/


void setup(){
  size(150,119);
  background(#446A42);
  smooth();
  noStroke();
}
void draw(){
  fill(#73906E);
  rect(0,0,45,40);
  
  fill(#236446);
  rect(0,40,47,52);
  
  fill(#213132);
  rect(0,93,7,16);  
  
  fill(#30864C);
  rect(0,108,32,12);


beginShape();
  fill(#B3E246);
vertex(46, 71);
vertex(87,71);
vertex(87,120);
vertex(32,120);
vertex(32,108);
vertex(7,108);
vertex(7,91);
vertex(46,92);
endShape(); 

  fill(#49BB09);
  rect(46,16,41,55);
  
  
beginShape();
  fill(#38A055);
vertex(46, 0);
vertex(150,0);
vertex(150,19);
vertex(145,19);
vertex(143,71);
vertex(87,71);
vertex(87,16);
vertex(46,16);
endShape(); 

  fill(#40693E);
  rect(145,20,5,58);
  
  fill(#398F54);
  rect(87,71,56,30);
  
    
  fill(#398F54);
  rect(143,79,7,22);
  
    
  fill(#8AD810);
  rect(114,101,36,19);
      
  fill(#21573F);
  rect(87,102,27,118);
    


}

