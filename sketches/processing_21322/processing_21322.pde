
PImage bog1;
PImage bog2;
PImage bog3;
PImage bog4;
PImage bog5;
PImage bog6;
PImage bog7;
 
void setup() {
  size(850, 400);
  smooth();
  strokeWeight(1.5);
  stroke(210);
  background(255);
  bog1 = loadImage("bog1.jpg"); 
  bog2 = loadImage("bog2.jpg"); 
  bog4 = loadImage("bog4.jpg"); 
  bog5 = loadImage("bog5.jpg"); 
  bog6 = loadImage("bog6.jpg"); 
  bog7 = loadImage("bog7.jpg"); 
  
  fill(255);
ellipse (115,265,130,130);
ellipse (265,265,130,130);
ellipse (715,115,130,130);

}

void draw() {
  
  image (bog6, 50, 50);
image (bog2, 200, 50);
image (bog7, 350, 50);
image (bog2, 500, 50);
image (bog4, 350, 200);
image (bog5, 500, 200);
image (bog1, 650, 200);
noStroke();
frameRate(50);

    if ((mouseX < 190) && (mouseX >40) &&(mouseY <190) && (mouseY >40)) 
    {
    fill(250,210,0);
    ellipse (115,116,131,133);
    }
    if ((mouseX < 190) && (mouseX >40) &&(mouseY <190) && (mouseY >40) && (mousePressed)) 
    {
    fill(50,210,200);
    ellipse (115,116,131,133);
    }
   
   if ((mouseX < 340) && (mouseX >190) &&(mouseY <190) && (mouseY >40)) 
    {
    fill(245,129,20);
    ellipse (265,116,131,133);
    }
    if ((mouseX < 340) && (mouseX >190) &&(mouseY <190) && (mouseY >40) && (mousePressed)) 
    {
    fill(100,100,255);
    ellipse (265,116,131,133);
    }
    
     if ((mouseX < 490) && (mouseX >340) &&(mouseY <190) && (mouseY >40)) 
    {
    fill(30,240,70);
    ellipse (415,116,131,133);
    }
    if ((mouseX < 490) && (mouseX >340) &&(mouseY <190) && (mouseY >40) && (mousePressed)) 
    {
    fill(240,200,50);
    ellipse (415,116,131,133);
    }
    
      if ((mouseX < 640) && (mouseX >490) &&(mouseY <190) && (mouseY >40)) 
    {
    fill(30,234,200);
    ellipse (565,116,131,133);
    }
    if ((mouseX < 640) && (mouseX >490) &&(mouseY <190) && (mouseY >40) && (mousePressed)) 
    {
    fill(255,255,0);
    ellipse (565,116,131,133);
    }
    
     if ((mouseX < 490) && (mouseX >340) &&(mouseY <190) && (mouseY >40)) 
    {
    fill(30,240,70);
    ellipse (415,116,131,133);
    }
    if ((mouseX < 490) && (mouseX >340) &&(mouseY <190) && (mouseY >40) && (mousePressed)) 
    {
    fill(240,50,50);
    ellipse (415,116,131,133);
    }
    
      if ((mouseX < 490) && (mouseX >240) &&(mouseY <340) && (mouseY >190)) 
    {
    fill(234,92,200);
    ellipse (415,266,131,133);
    }
    if ((mouseX < 490) && (mouseX >240) &&(mouseY <340) && (mouseY >190) && (mousePressed)) 
    {
    fill(150,240,100);
    ellipse (415,266,131,133);
    }
    
      if ((mouseX < 640) && (mouseX >490) &&(mouseY <340) && (mouseY >190)) 
    {
    fill(30,00,100);
    ellipse (565,266,131,133);
    }
    if ((mouseX < 640) && (mouseX >490) &&(mouseY <340) && (mouseY >190) && (mousePressed)) 
    {
    fill(240,200,50);
    ellipse (565,266,131,133);
    }
    
      if ((mouseX < 790) && (mouseX >640) &&(mouseY <340) && (mouseY >190)) 
    {
    fill(255,00,100);
    ellipse (715,266,131,133);
    }
    if ((mouseX < 790) && (mouseX >640) &&(mouseY <340) && (mouseY >190) && (mousePressed)) 
    {
    fill(00,255,00);
    ellipse (715,266,131,133);
    }

}



