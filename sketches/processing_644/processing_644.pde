

void setup(){
size(1320,200);
}

void draw() {
 background(22,149,163);
 copa();
 cup();
 seg();
 minu();
 }
 void copa(){
  for( int x= 10; x<1300; x=x+110){
  for(int y=0; y<1300; y=y+110){
  beginShape(POLYGON);
  noFill();
  smooth();
  stroke(255);
  
  vertex(x,185);
  vertex(x+45,170);
  vertex(x+45,120);
  vertex(x,70);
  vertex(x+100,70);
  vertex(x+55,120);
  vertex(x+55,170);
  vertex(x+100,185);
  endShape(CLOSE);
      
    }
  }
}
 void cup(){
 for( int x=0; x<1300; x=x+110){
 for(int y=0; y<1300; y=y+110){
  beginShape(POLYGON);
  smooth();
  noFill();
  stroke(255);
  vertex(x+60,115);
  vertex(x+25,75);
  vertex(x+95,75);
  endShape(CLOSE);
  }
  }
  }
 void seg(){
   int s = second();
   fill(255);
   ellipse(60, s, 10, 10);
}

  void minu(){
    int s=second();
    smooth(); 
    noStroke();
    fill(204,44,134);
    triangle(60, 115, 25, 75+s, 95,75+s); 



  
  {
 /* triangle(x1,y1,x2,y2,x3,y3);//cada vertice
    rect(20,20,20,20);// x,y,ancho,alto 
*/

  }
  }

