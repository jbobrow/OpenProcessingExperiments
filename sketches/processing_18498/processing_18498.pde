

void setup()
{
size (200,160);
rectMode (CORNER);
smooth();
}

void draw(){
 fill(250,172,3);
 noStroke();
 rect(0,0,width/2,height);
 
 fill(47,26,85);
 rect(width/2,0,width/2,height);
 
 fill(0);
 rect(50,0,25,height);
 
 stroke(0);
 strokeWeight(2);
 fill(255,13,0);
 ellipse(5,35,25,25);
 
 stroke(0);
 strokeWeight(3);
 fill(255);
 ellipse((width/2)-5,55,35,35);
 
  stroke(0);
 strokeWeight(4);
 fill(255,0,124);
 ellipse(60,25,105,105);
 
  stroke(0);
 strokeWeight(5);
 fill(64,275,242);
 ellipse(50,30,45,45);

}

