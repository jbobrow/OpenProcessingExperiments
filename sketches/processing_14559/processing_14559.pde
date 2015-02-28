
void setup(){
size(200,200);
}
 
void draw(){
 
background(210);
  scale(0.1);
  for(int x=0; x<=1000; x=x+110)  {
    for(int y=0; y<=1000; y=y+110)  {
      pushMatrix();
      translate(x+x,y+y);
      rotate(radians(frameCount+4));
      newDraw();
  
      popMatrix();
    }
  }
}
 
 
void newDraw()  {
 
stroke(100);
fill(#00BFFF,255);
 
beginShape();
vertex(55,100);
vertex(55,200);
vertex(150,200);
vertex(150,50);
endShape(CLOSE);
line(90,50,85,200);
 
beginShape();
vertex(5,50);
vertex(95,17);
vertex(160,20);
vertex(65,60);
endShape(CLOSE);
 
beginShape();
vertex(5,50);
vertex(20,115);
vertex(80,130);
vertex(65,60);
endShape(CLOSE);
 
beginShape();
vertex(160,20);
vertex(175,90);
vertex(80,130);
vertex(65,60);
endShape(CLOSE);
 
 
fill(#00BFFF);
beginShape();
vertex(30,118);
vertex(60,125);
vertex(38,200);
vertex(9,200);
endShape(CLOSE);
 
fill(#00BFFF);
beginShape();
vertex(60,125);
vertex(70,128);
vertex(49,200);
vertex(38,200);
endShape(CLOSE);
 
 
noStroke();
fill(#1874CD,120);
beginShape();
vertex(30,118);
vertex(60,125);
vertex(56,130);
vertex(28,124);
endShape(CLOSE);
 
fill(#1874CD,180);
beginShape();
vertex(60,125);
vertex(70,128);
vertex(69,130);
vertex(56,130);
endShape(CLOSE);
 
noStroke();
fill(95);
ellipse(135,65,9,10);
ellipse(110,75,9,10);
 
beginShape();
vertex(120,105);
vertex(145,95);
vertex(130,85);
endShape(CLOSE);
 
}


                
                                                
              
