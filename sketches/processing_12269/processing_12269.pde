
//Groovy Colors by Michael Lin
//September 17th, 2010

int value = 0;

void setup()
{
 size(750,750);

}

void draw()
{
 float d = dist(mouseX,mouseY,pmouseX,pmouseY);
if (mousePressed == true) {
  fill(random(0,255),random(0,255),random(0,255),random(0,255));
  triangle(mouseX,mouseY,mouseX-10,mouseY+20,width/2,height/2);
  triangle(mouseX,height-mouseY,mouseX-10,height-(mouseY+20),width/2,height/2);
  triangle(mouseY,mouseX,mouseY-10,mouseX+20,width/2,height/2);
  triangle(mouseY,height-mouseX,mouseY-10,height-(mouseX+20),width/2,height/2);
  triangle(width-mouseX,height-mouseY,width-(mouseX-10),height-(mouseY+20),width/2,height/2);
  triangle(width-mouseX,mouseY,width-(mouseX+10),mouseY-20,width/2,height/2); 
  triangle(width-mouseY,height-mouseX,width-(mouseY+10),height-(mouseX+20),width/2,height/2); 
  triangle(width-mouseY,mouseX,width-(mouseY-10),mouseX-20,width/2,height/2);  
  } else {
    background(random(245,255),random(245,255),random(245,255));
    noStroke();
    fill(0,random(0,50));
  }
  
  ellipse(mouseX, mouseY,100, 100);
  ellipse(width-mouseX, mouseY,100, 100);
  ellipse(mouseY,mouseX,100,100);
  ellipse(height-mouseY,mouseX,100,100);
  ellipse(width-mouseX,height-mouseY,100,100);
  ellipse(height-mouseY,width-mouseX,100,100);
  ellipse(mouseY,width-mouseX,100,100);
  ellipse(mouseX,height-mouseY,100,100);

  

}



