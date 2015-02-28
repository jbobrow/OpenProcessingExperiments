
//joseph jung

int click = 99;
void setup()
{
  size(400,400);
  background(255);
  smooth();
  noCursor();
  
}
void draw()
{
  
  drawJim(mouseX,mouseY,200,200);
}

void drawJim(float x, float y,float wd, float ht)
{

background(200);
fill(250,200,200);
noStroke();
ellipse(x,y,wd,ht);
ellipse(x-wd*.5,y,wd*.3,ht*.3);
ellipse(x+wd*.5,y,wd*.3,ht*.3);
 
fill(255);
ellipse(x-wd*.25+(mouseX*.075),y-ht*.15+(mouseY*.05),wd*.1,ht*.1);
ellipse(x+wd*.25-(mouseX*.075),y-ht*.15+(mouseY*.05),wd*.1,ht*.1);
 
fill(0);
ellipse(x-wd*.25+(mouseX*.075),y-ht*.15+(mouseY*.05),wd*.05,ht*.05);
ellipse(x+wd*.25-(mouseX*.075),y-ht*.15+(mouseY*.05),wd*.05,ht*.05);
 
noFill();
stroke(0);
strokeWeight(3);
rect(x-wd*.4+(mouseX*.075),y-ht*.3+(mouseY*.05),wd*.2,ht*.2,wd*.1);
rect(x+wd*.2-(mouseX*.075),y-ht*.3+(mouseY*.05),wd*.2,ht*.2,wd*.1);
 

 
fill(180,80,80);
stroke(0);
strokeWeight(2.5);
bezier(x-wd*.15,y+ht*.25,x-wd*.1,y+ht*.8,x+wd*.1,y+ht*.8,x+wd*.2,y+ht*.14);
 
fill(255);
noStroke();
bezier(x-wd*.15,y+ht*.25,x-wd*.1,y+ht*.25,x+wd*.1,y+ht*.25,x+wd*.2,y+ht*.14);
 
 
noFill();
stroke(200,150,150);
strokeWeight(2.5);
bezier(x-wd*.1,y-ht*.1,x-wd*.06,y+ht*.15,x+wd*.1,y+ht*.11,x+wd*.1,y-ht*.28);

if (click >99)
  {
     textSize(45);
    textAlign(CENTER);
    strokeWeight(5);
    fill(random(150,230),10,10);
    text("You get an A+",mouseX,mouseY-120);
  }
}

void mousePressed()

{
  if (mousePressed == true)
  { 
    click = 100;
  }
}

void mouseReleased()

{
 
  click = 99;
  
}

void keyPressed()

{
  if (keyPressed == true)
  {
    background(random(255),random(255),random(255));
    textSize(45);
    textAlign(CENTER);
    text("PARTY TIME!!!",200,360);
  }
}


