
void setup()
{
  size(500,500);
  background(255);
}

void draw()
{
 
  //    hatterszin finom torlese
 
  colorMode(RGB);
  noStroke();
  fill(255,255,255,15);
  rectMode(CORNER);
  rect(0,0,width,height);
  
  
  //    eger ala pozicionalunk egy ellipszist
  
  stroke(10,100,255);
  fill(75,219,224);
  ellipse(mouseX,mouseY,40,40);
  
  //    kirakjuk a haromszogeket
  
  colorMode(HSB);
  myTriangle(100,100,0,255,255);
  myTriangle(100,150,10,255,255);
  myTriangle(100,200,50,255,255);
  myTriangle(100,250,100,255,255);
  myTriangle(100,300,200,255,255);
  
  //    forgatott negyzetek
  
  for(int i=0; i < 10; i++)
  {
    sorozat(i + mouseX / 100.0);
  }
}

//    haromszog kirajzolo fuggveny

void myTriangle(int x, int y, int r, int g, int b)
{
  noStroke();
  fill(r,g,b);
  triangle(x,y,x + 30,y,x + 15, y + 15); 
}

// negyzetet kirajzolo fuggveny   

void sorozat(float ezazamithasznalunk)
{
  translate(0, 40);
  
  pushMatrix();
    translate(width/2,0);
    rotate(ezazamithasznalunk);
    rectMode(CENTER);
    rect(0, 0, 30, 30);
  popMatrix();
}
