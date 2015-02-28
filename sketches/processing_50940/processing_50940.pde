


//int [] x = {3};
//float speed = 3;

void setup()
{
  size(500,500);
  //int[] x = {0,255,0};
}

void draw()
{
  background(255);

  if (mouseX >490)
  {
  float maprand = map(mouseX,0,width,0,10);
  float randx = random(-maprand,maprand);
  float randy = random(-maprand,maprand);
  translate(randx,randy);
  }
  fill(188,178,87);
  rect(100,50,300,400);
  fill(255);
  
  //Eye 1
  float c1x = map(mouseX,0,width,50,200);
  float c1y = map(mouseX,0,width,50,200);
  float er = map(mouseX,0,width,0,188);
  float eg = map(mouseX,0,width,0,145);
  float eb = map(mouseX,0,width,0,87);
  fill(er,eg,eb);
  ellipse(150,140,c1x,c1y);
  
  //Pupil 1
  float p1x = map(mouseX,0,width,0,150);
  float p1y = map(mouseX,0,width,0,150);
  fill(129,188,87); 
  ellipse(160,150,p1x,p1y);
  
  //Pupil 2
  if(mouseX > 208)
  {
  float p2x = map(mouseX,208,width,0,100);
  float p2y = map(mouseX,208,width,0,100);
  float p2r = map(mouseX,0,width,255,211);
  float p2g = map(mouseX,0,width,255,219);
  float p2b = map(mouseX,0,width,255,126);
  fill(p2r,p2g,p2b);
  ellipse(170,160,p2x,p2y);
  }
    
  //Eye 2
  float e2r = map(mouseX,0,width,0,188);
  float e2g = map(mouseX,0,width,0,145);
  float e2b = map(mouseX,0,width,0,87);
  float c2x = map(mouseX,0,width,-50,-75);
  float c2y = map(mouseX,0,width,50,75);
  fill(e2r,e2g,e2b);
  ellipse(350,150,c2x,c2y);
  
  //nose
  fill(0);
  float n1x = map(mouseX,0,width,200,240);
  float n2x = map(mouseX,0,width,300,260);
  triangle(250,210,n2x,250,n1x,250);
  

  //color
  float r = map(mouseX,0,width,255,255);
  float g = map(mouseX,0,width,255,0);
  float b = map(mouseX,0,width,255,0);
  
  //mouth
  float my = map(mouseX,0,width,50,250);
  float mx = map(mouseX,0,width,150,200);
  //fill(r,g,b);
  fill(30,12,7);
  arc(250,300,mx,my,0,PI);
  
  //lip
  fill(188,178,87);
  float ly = map(mouseX,width,0,0,75);
  arc(250,300,300,ly,0,PI);
  
  //tongue
  if(mouseX>460)
  {
  //float tx = map(mouseX,430,width,0,75);
  float ty = map(mouseX,470,width,0,70);
  fill(255,0,0);
  arc(250,425,65,ty,PI,TWO_PI);
  }
  
  //Uvula
  //ellipse
  
  
  //teeth
  fill(188,178,87);
  for (int i = 146; i <355; i += 21)
  {
    rect(i,300,20,20);
  }
  for (int i = 146; i <355; i += 21)
  {
    rect(i,405,20,30);
  }

 
  //eyelid
  if(mouseX <350)
  {
  fill(188,178,87);
  noStroke();
  float el = map(mouseX,0,width,0,50);
  rect(300,100,90,el);
  rect(300,200,90,-el);
  }
  else if(mouseX >=420)
  {
  fill(188,178,87);
  noStroke();
  float el = map(mouseX,0,width,-200,0);
  rect(300,100,90,-el);
  rect(300,200,90,el);
  }
  else
  {
  fill(188,178,87);
  noStroke();
  rect(300,85,90,50);
  rect(300,165,90,50);
  }
  
  
  //println(mouseY);
  //println(mouseX);
}

