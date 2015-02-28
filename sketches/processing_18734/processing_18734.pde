

void setup(){
  size(250,250);
  frameRate(6);
}

void draw(){
  background(255);
  noStroke();
  fill(200,50,5,random(200));
 ellipseMode(CENTER);{
/*ellipse(random(width),25,5,5);
ellipse(random(width),25,5,5);
ellipse(random(width),25,5,5);
ellipse(random(width),25,5,5);*/

ellipse(random(width),5,5,5);
ellipse(random(width),5,5,5);
ellipse(random(width),5,5,5);
ellipse(random(width),5,5,5);

ellipse(random(width),50,5,5);
ellipse(random(width),50,5,5);
ellipse(random(width),50,5,5);
ellipse(random(width),50,5,5);

/*ellipse(random(width),75,5,5);
ellipse(random(width),75,5,5);
ellipse(random(width),75,5,5);
ellipse(random(width),75,5,5);*/


ellipse(random(width),100,5,5);
ellipse(random(width),100,5,5);
ellipse(random(width),100,5,5);
ellipse(random(width),100,5,5);

ellipse(random(width),150,5,5);
ellipse(random(width),150,5,5);
ellipse(random(width),150,5,5);
ellipse(random(width),150,5,5);

ellipse(random(width),200,5,5);
ellipse(random(width),200,5,5);
ellipse(random(width),200,5,5);
ellipse(random(width),200,5,5);

ellipse(random(width),245,5,5);
ellipse(random(width),245,5,5);
ellipse(random(width),245,5,5);
ellipse(random(width),245,5,5);
  }
  if(keyPressed);{
  noStroke();
  fill(200,5,5,25);
  rect(mouseX,mouseY,random(250),random(20));
  }
}

