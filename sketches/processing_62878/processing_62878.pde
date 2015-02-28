

int s = second();
int rotationAngle =0;
float arcVariable = 0; 

void setup()
{
  size(500, 500);
  background(0);
  smooth();
}

void draw()
{ 
  fill(10, 10);
  noStroke();
  rect(0, 0, 500, 500);


  translate (width/2, height/2);
  rotate(radians(rotationAngle));
  int s = second();
  arcVariable += 1;

  for (int i=0; i<=int(mouseX/100); i++)
  {
   
    

    stroke(random(80), 0, mouseY, 20);
    strokeWeight(s+i*5);
    noFill();
    arc(0, 0, width*0.6, height*0.6, radians(arcVariable), radians(arcVariable+200));
    arc(0, 0, width*0.6+i*10, height*0.6+i*10, radians(arcVariable+i*1), radians(arcVariable));
  }

  for (int i=0; i<=int(mouseX/100); i++) 
  {
     
    stroke(255, 100, 0, 10);
    strokeWeight(s);
    noFill();
    arc(0, 0, width*0.7, height*0.7, radians(-arcVariable), radians(-arcVariable+150));
    arc(0, 0, width*0.7+i*10, height*0.7+i*10, radians(-arcVariable+i*1), radians(-arcVariable));
  }
  
  
  for (int i=0; i<=int(mouseX/200); i++) 
  {
    stroke(255, 180, 0, 5);
    strokeWeight(54);
    noFill();
    arc(0, 0, width*1, height*1, radians(-arcVariable), radians(-arcVariable+30));
    arc(0, 0, width*1+i*60, height*1+i*60, radians(arcVariable), radians(arcVariable));
  }
  
  for (int i=0; i<=(mouseX/100); i++)
  { 
    stroke(mouseX, 0, random(250), 2);
    strokeWeight(22);
    noFill();
    arc(0, 0, width*0.55, height*0.55, radians(mouseX), radians(mouseY+50));
    stroke(200, random(250), 0, 2);
    strokeWeight(3);
    arc(0, 0, width*0.85, height*0.85, radians(mouseX+50), radians(mouseY+50));
    stroke(200, 0 , random(250), 2);
    strokeWeight(2);
    arc(0, 0, width*0.35, height*0.35, radians(-mouseX), radians(-mouseY));

}

for (int i=0; i<=(mouseX/100); i++){
fill(mouseX*i/200,5);
noStroke();
beginShape();
vertex(mouseX-250,mouseY-250);
vertex(250,250);
vertex(250,-250);
endShape(CLOSE);

 

 beginShape();
vertex(mouseX-250,mouseY-250);
vertex(-250,-250);
vertex(-250,250);
endShape(CLOSE);



beginShape();
vertex(mouseX-250,mouseY-250);
vertex(250,250);
vertex(-250,-250);
endShape(CLOSE);
}

}

