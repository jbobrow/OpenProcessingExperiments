

int xPos=0;
int yPos=0;


void setup() {
  size(500,500);

  background(255);
  smooth();
}
void draw() {
  background(255);

  //UFO
  if(mousePressed) {
    frameRate (60);
    fill(0);
    ellipse(xPos,yPos,5,5);

    if(mouseX<=width/2)
    {
      xPos=xPos+5;
      yPos=yPos+5;
    }
    else
    {
      xPos=xPos-5;
      yPos=yPos+5;
    }

    ellipse(mouseX, mouseY,70,60);
    fill(0);
    ellipse(mouseX, mouseY,130,25);


    fill(255);
    line(mouseX,mouseY,mouseX+45,mouseY-45);
    line(mouseX,mouseY,mouseX-45,mouseY-45);
  }

  fill(0);
  translate(width/2, height/2);
  ellipseMode(CENTER);
  ellipse(0,0,110,120);


  strokeWeight(5);    
  line(0,0,1,200);

  strokeWeight(5);    
  line(0,0,1,-90);


  fill(255);
  ellipse(0,0,45,50);



  //oberes Auge

  fill(255);
  ellipse(0,-100,30,35);


  //noStroke();
  fill(255);
  rect(-25,35,50,10);


  if(mousePressed)
  {
    //cursor(HAND);
    rect(-25,35,50,random(10));
    fill(0);
    ellipse(map(mouseX,0,width,-10,10),map(mouseY,0,height,-20,20),10,15);

    fill(0);
    ellipse(map(mouseX,0,width,-3,3),map(mouseY,0,height,-12,12)-100,5,7);
  }
  else

  {
    //cursor(ARROW);
    fill(0);
    ellipse(3,0,10,15);

    fill(0);
    ellipse(-3,-100,5,7);
  }
}
void mouseClicked()
{
  xPos=mouseX;
  yPos=mouseY;
}
void mouseReleased()
{
  xPos=mouseX;
  yPos=mouseY;
}


