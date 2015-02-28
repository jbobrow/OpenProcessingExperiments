
void setup() {
  size(1280,720);
  smooth();
  strokeWeight(3);
  
}
 
  
  void draw(){
      background(100);
      fill(90, 154, 112);
      rect(0,0,3000,100);
      rect(0,720,3000,100);
     
     int x=0;//street line markers
 int y=360;//street line markers
 for(x=0; x <=1280; x+=60)
     {
   fill(240,179,45);
   rectMode(CENTER);
   rect(x,y,25,10);
     }
 
//wheels
fill(150);
ellipse((mouseX-20), (mouseY+30), 30, 15);
ellipse((mouseX-20),(mouseY+30),15,7);
ellipse((mouseX+60), (mouseY+30), 30, 15);
ellipse((mouseX+60),(mouseY+30),15,7);
//car body
beginShape();
fill(232,105,70);
vertex((mouseX-55), (mouseY-30));
vertex(mouseX-30, mouseY-50);
vertex(mouseX+80, mouseY-50);
vertex(mouseX+78, mouseY-10);
vertex(mouseX+70, mouseY-10);
vertex(mouseX+70, mouseY-5);
vertex(mouseX+78, mouseY-5);
vertex(mouseX+80, mouseY+30);
vertex(mouseX-30, mouseY+30);
vertex(mouseX-55, mouseY+10);
vertex(mouseX-55, mouseY-30);
endShape();
//right headlight
beginShape();
fill(240,193,93);
vertex(mouseX-50,mouseY-25);
vertex(mouseX-30,mouseY-45);
vertex(mouseX-30,mouseY-25);
vertex(mouseX-50,mouseY-25);
endShape();

//left headlight
beginShape();
fill(240,193,93);
vertex(mouseX-50,mouseY+5);
vertex(mouseX-30,mouseY+5);
vertex(mouseX-30,mouseY+25);
vertex(mouseX-50,mouseY+5);
endShape();

//rear right headlight
beginShape();
fill(240,193,93);
vertex(mouseX+75,mouseY-45);
vertex(mouseX+73,mouseY-25);
vertex(mouseX+60,mouseY-25);
vertex(mouseX+60,mouseY-45);
vertex(mouseX+75,mouseY-45);
endShape();

//rear left headlight
beginShape();
fill(240,193,93);
vertex(mouseX+75,mouseY+25);
vertex(mouseX+73,mouseY+5);
vertex(mouseX+60,mouseY+5);
vertex(mouseX+60,mouseY+25);
vertex(mouseX+75,mouseY+25);
endShape();

//windshield
beginShape();
fill(90,154,175);
vertex(mouseX-10,mouseY+20);
vertex(mouseX+20,mouseY+15);
vertex(mouseX+20,mouseY-35);
vertex(mouseX-10,mouseY-40);
vertex(mouseX-10,mouseY+20);
endShape();

//body creases
line(mouseX-15,mouseY+1,mouseX-50,mouseY-4);
line(mouseX-15,mouseY-20,mouseX-50,mouseY-15);
line(mouseX-15,mouseY-6,mouseX-50,mouseY-7);
line(mouseX-15,mouseY-13,mouseX-50,mouseY-12);
line(mouseX+20,mouseY-35,mouseX+60,mouseY-45);
line(mouseX+20,mouseY+15,mouseX+60,mouseY+25);



}



