




void setup()
{
  size(600,600);
}

void draw()
{
fill(252,214,2);
noStroke();
ellipse(width/2,275,500,500);
//stroke(2);
//strokeWeight(8);
fill(225);
ellipse(200,height/4,100,100);
ellipse(400,height/4,100,100);

  fill(0);
  float my =  map(mouseY,0,height,50,200);
  ellipse(width/2,height/1.5,my,my);
  
  fill(0,160,235);
  float ma = map(mouseY,0,height,150,180);
  ellipse(200,ma,40,40);
  
  fill(0,160,235);
  float mb = map(mouseY,0,height,150,180);
  ellipse(400,mb,40,40);
  
  fill(0);
  float mx = map(mouseY,0,height,150,180);
  ellipse(200,mx,20,20);
  
  fill(0);
  float mz = map(mouseY,0,height,150,180);
  ellipse(400,mz,20,20);
  
  
}

