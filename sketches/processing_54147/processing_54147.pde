
int r,g,b,l,random2,random3,random4;
float si;
PImage elect;

void setup()
{
  size(900,500);
  si = 0;
  noLoop();
  smooth();
  
  elect = loadImage("elect.png");
}

void draw()
{
  int row;
  
  background(70);

  for (int i = 0; i < 800; i = i + 200)
  {
    for (int k = 0; k < 3; k++)
    {
      if(k == 0)
       row = 0;
       else if (k ==1)
       row = 77;
       else
       row = 210;
        
        r = int(random(80,255));
        g = int(random(80,255));
        b = int(random(80,255));
        si += 0.5; 
        l = round(random(0,1));
        random2 = round(random(2,3));
        random3 = round(random(4,5));
        random4 = round(random(6,7));

        bot(i,row,r,g,b,si,l);
      
    }
    si = 0;
  }
}

void bot(float x, float y, int r, int g, int b, float s,int l)
{
  pushMatrix(); //body
  translate(x+150,y+90);
  scale(s);
  fill(r,g,b);
  stroke(0);
  strokeWeight(3); 
  pushMatrix(); //hand 1
  translate(-38,-60);
  line(0,0,15,20);
  noStroke();
  ellipse(0,0,8,8);
  popMatrix();
  pushMatrix(); //hand 2
  stroke(0);
  translate(38,-60);
  line(0,0,-15,20);
  noStroke();
  ellipse(0,0,8,8);
  popMatrix();
  
    if(random3 == 4)
  {
  noStroke();
  fill(r,g,b);
  ellipse(0,0,100+s,100+s);
  }
  else
  {
  rect(-40,-50,80,96);
  }
  fill(0);
  ellipse(-20,-15,20,35);
  ellipse(20,-15,20,35);
  fill(255);
  ellipse(-17,-25,5,5);
  ellipse(23,-25,5,5);
  


  if(l == 0)
  {
    noStroke();
    fill(150);
    triangle(15,40,31,40,23,70);
    triangle(-31,40,-15,40,-23,70);
    fill(70);
    triangle(15,40,20,40,23,70);
    triangle(-31,40,-26,40,-23,70);
    fill(240);
    triangle(27,40,30,40,25,58);
    triangle(-19,40,-16,40,-21,58);
  
  }

  else
  {
    fill(0);
    ellipse(20,50,40,20);
    ellipse(-20,50,40,20);
    noStroke();
    fill(240);
    ellipse(-12,45,12,6);
    ellipse(28,45,12,6);
  }
   if(random2 == 2)
  {
    fill(0);
    rect(-25,15,50,15);
    
    if(random4 == 6)
    {
      image(elect,-40,-90,80,60);
    }
    else
    {
    }
  }
  else
  {
    fill(0);
    ellipse(0,18,28,48);
  }
  popMatrix();
  
}

void mousePressed()
{
  redraw();
}

