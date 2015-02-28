
void setup(){
  size(300,300);
   smooth();
  noStroke();
 colorMode(RGB);
 
}

int x=0;

void draw(){
}
void mouseDragged(){

  //sky color
 fill(mouseX,mouseX,233);
 rect(0,0,width,220);
 
 
  //grass color
 fill(0,251,76);
 rect(0,220,width,100);
 
 
 //tree
 stroke(1);
 line(290,0,280,220);
 fill(119,65,27);
 triangle(280,220,290,0,300,220);
 noStroke();
 triangle(291,0,300,220,300,0);
 stroke(1);
 line(290,70,260,0);
 line(290,90,255,0);
 fill(119,65,27);
 quad(255,0,260,0,290,70,290,90);
 
  //pumpkin
 ellipseMode(CENTER);
 fill(247,147,56);
 ellipse(mouseX,210,32,32);
 ellipse(mouseX,210,32,32);
 ellipse(mouseX,210,8,32);
 noFill();
 ellipse(mouseX,210,32,32);
fill(0,135,72);
rect(mouseX,184,5,10);

 fill(355,60,0);
 stroke(50,0,0);
 strokeWeight(1);
 ellipse(x+170,x,10,15);
 
 x++;


}

