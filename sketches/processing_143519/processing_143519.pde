
//Nasim Nounou, hacer un toad siguiendo al mause
void setup() {
  size(1000,1000); //width, height
}

void draw(){
  background(255);
  stroke(0,0,0);
  fill(229,0,0);
  ellipse(mouseX,mouseY,1,1);
  ellipse(mouseX,mouseY-20,100,100);//seta roja
  fill(255,224,191);
  strokeWeight(1);
  ellipse(mouseX,mouseY+12,70,45);//tronco veix
  fill(255,255,255);
  ellipse(mouseX,mouseY-40,45,45);
  ellipse(mouseX-37,mouseY-25,23,45);
  ellipse(mouseX+37,mouseY-25,23,45);
  
   noStroke();
  fill(227,196,158);
  ellipse(mouseX,mouseY+4,60,26);
  
  fill(0,0,0);
 rectMode(CENTER);
 rect(mouseX-11,mouseY+10,5,15,10);
 rect(mouseX+11,mouseY+10,5,15,10);
 fill(255);
 ellipse(mouseX-11,mouseY+7,5,5);
 ellipse(mouseX-12,mouseY+14,3,3);
 ellipse(mouseX+11,mouseY+7,5,5);
 ellipse(mouseX+12,mouseY+14,3,3);
 fill(0);
 ellipse(mouseX,mouseY+20,5,5);


  }



