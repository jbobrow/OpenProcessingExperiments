
int a;

float r;
int[] i = new int [255];
int[] j = new int [255];
int[] k = new int [255];



float g;
float b;
float s;
int p;
int h;
int l;


void setup()
{

  size(800, 800);
  background(255);

  p = 200;
  s = 10;
  l = 40;
}


void draw()
{
  fill(50);
  rect(0, 0, 320, 800);

  noStroke();
  fill(50);
  rect(10, 200, 300, 255);



  //p calculator for slider
  if (mouseX > 275 && mouseX < 305 && mouseY > 200 && mouseY < 455 && mousePressed)
  {
    p = mouseY;
      r = map(p, 200, 400, 0, 255);
  }

  //red value





  //g&b selector
  if (mouseX > 10 && mouseX < 265 && mouseY > 200 && mouseY < 455 && mousePressed)
  {
    g = map(mouseX, 10, 200, 0, 255);
    b = map(mouseY, 200, 400, 0, 255);
  }



  //red color bar
  pushMatrix();
  for (int i=0; i<255; i++)
  {

    stroke(i, g, b);
    line(275, i+200, 305, i+200);
  } 



  for (int j=0; j<255; j++)
  {

    for (int k=0; k<255; k++)
    {
      noStroke();
      fill(r, j, k);
      rect(j+10, k+200, 1, 1);
    }
  }
  popMatrix();


  //slider

  fill(0);
  rect(270, p, 40, 5);


  //hSelector
  fill(30);
  rect(40, 490, 225, 5);
  fill(200);
  ellipse(22, 493, 10, 10);
  ellipse(290, 493, 35, 35);

  //p calculator for slider
  if (mouseX > 40 && mouseX < 265 && mouseY > 485 && mouseY < 495 && mousePressed)
  {
    l = mouseX;
    s = map(mouseX, 40, 265, 10, 35);
  }

  rect(l, 480, 5, 20 );




  fill(255);
  rect(40, 550, 20, 20);

  fill(200,200,200);
  rect(70, 550, 20, 20);

  fill(150);
  rect(100, 550, 20, 20);

  fill(100);
  rect(130, 550, 20, 20);

  fill(40);
  rect(160, 550, 20, 20);

  fill(0);
  rect(190, 550, 20, 20);




  if (mouseX > 40 && mouseX < 60 && mouseY > 550 && mouseY < 570 && mousePressed)
  {
    r = 255;
    g = 255;
    b = 255;
    p = 455;
  }
  
  if (mouseX > 70 && mouseX < 90 && mouseY > 550 && mouseY < 570 && mousePressed)
  {
    r = 200;
    g = 200;
    b = 200;
  }
  
 if (mouseX > 100 && mouseX < 120 && mouseY > 550 && mouseY < 570 && mousePressed)
  {
    r = 150;
    g = 150;
    b = 150;
  }

 if (mouseX > 130 && mouseX < 150 && mouseY > 550 && mouseY < 570 && mousePressed)
  {
    r = 100;
    g = 100;
    b = 100;
  }

 if (mouseX > 160 && mouseX < 180 && mouseY > 550 && mouseY < 570 && mousePressed)
  {
    r = 40;
    g = 40;
    b = 40;
  }

 if (mouseX > 190 && mouseX < 210 && mouseY > 550 && mouseY < 570 && mousePressed)
  {
    r = 0;
    g = 0;
    b = 0;
  }


  //h command, must place at the bottom!!
  if (mouseX> 320 && mousePressed)
  {

    fill(r, g, b);
    noStroke();
    ellipse(mouseX, mouseY, s, s);
  }


}

