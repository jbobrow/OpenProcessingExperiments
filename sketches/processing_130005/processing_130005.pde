
int c=450;
ArrayList<Integer> xpos;
ArrayList<Integer> ypos;
ArrayList<Integer> size;
ArrayList<Integer> xvelocity;
ArrayList<Integer> yvelocity;

void setup () 
{
  size(900, 900);
  strokeWeight(5);
  stroke(random(255), random(255), random(255)); 
  background(255);
  xpos = new ArrayList<Integer>();
  ypos = new ArrayList<Integer>();
  size = new ArrayList<Integer>();
  xvelocity = new ArrayList<Integer>();
  yvelocity = new ArrayList<Integer>();
  xvelocity.add(int(random(-80,80)));
  yvelocity.add(int(random(-80,80)));
} 

void draw ()
{
  if (mousePressed) 
  {
    fill(random(255),random(255),random(255));
    xpos.add(int(random(425,475)));
    ypos.add(int(random(425.475)));
    size.add(int(random(50)));
    xvelocity.add(int(random(-80,80)));
    yvelocity.add(int(random(-80,80))); 
  }
  else
  {
    fill (255); 
  }
  if (xpos.size()>0)
  {
  my_own();
  } 
  ellipse (mouseX, mouseY, 40, 40);
//  line(c, c, mouseX, mouseY);
//  fill(random(255),random(255),random(255));
//  ellipse(450, 450, random(150),random(150)); 
for (int i = 0; i < xpos.size()-1 ; i++)
  {
  if (i%954 == 0)
  {
  rect(random(1000),ypos.get(i),10,10);
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,xpos.get(i)+yvelocity.get(i));
  }
  {
    ellipse(xpos.get(i),ypos.get(i),size.get(i),size.get(i));
    xpos.set(i,xpos.get(i)+xvelocity.get(i));
    ypos.set(i,xpos.get(i)+yvelocity.get(i));
  }  

  }  
}

void keyPressed() 
{
  background (random(255),random(255),random(255));
  stroke(random(255), random(255), random(255));
  
}


void my_own()
{
  fill (random(255),random(255),random(255));
  rect (random(11),random(900),random(100),random(100));
  rect (random(900),random(800-900),random(100),random(100));
  rect (random(100)+800,random(900),random(100),random(100));
  rect (random(900),random(100)+800,random(100),random(100));
  
  
//  
//  for (int i = 0; i < xpos.size()-1 ; i++){
//  if (i%954 == 0)
//  {
//  rect(random(1000),ypos.get(i),size.get(i),size.get(i));
//    xpos.set(i,xpos.get(i)+xvelocity.get(i));
//    ypos.set(i,xpos.get(i)+yvelocity.get(i));
//  }
//  {
//    ellipse(450,ypos.get(i),size.get(i),size.get(i));
//    xpos.set(i,xpos.get(i)+xvelocity.get(i));
//    ypos.set(i,xpos.get(i)+yvelocity.get(i));
//  }  
//}
}

