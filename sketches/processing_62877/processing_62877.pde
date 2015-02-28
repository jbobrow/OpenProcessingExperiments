
void setup()
{
  size(1000,800);
  noStroke();
  smooth();

}
void draw()
{
  background(.3*mouseY,250-.2*mouseY,330-.1*mouseY);
   if(mouseY>760&&mouseX<200)
    background(0,0,0);
  
    
  //Sun
  //Rays
  fill(255,320-.3*mouseY,0);
  triangle(mouseX-90,mouseY-30,mouseX-90,mouseY+30,mouseX-150,mouseY);
  triangle(mouseX-80,mouseY-20,mouseX-50,mouseY-80,mouseX-120,mouseY-100);
  triangle(mouseX-50,mouseY-80,mouseX,mouseY-90,mouseX-50,mouseY-155);
  triangle(mouseX+50,mouseY-80,mouseX,mouseY-90,mouseX+50,mouseY-155);
  triangle(mouseX+80,mouseY-20,mouseX+50,mouseY-80,mouseX+120,mouseY-100);
  triangle(mouseX+90,mouseY-30,mouseX+90,mouseY+30,mouseX+150,mouseY);
  triangle(mouseX-80,mouseY+20,mouseX-50,mouseY+80,mouseX-120,mouseY+100);
  triangle(mouseX-50,mouseY+80,mouseX,mouseY+90,mouseX-50,mouseY+155);
  triangle(mouseX+50,mouseY+80,mouseX,mouseY+90,mouseX+50,mouseY+155);
  triangle(mouseX+80,mouseY+20,mouseX+50,mouseY+80,mouseX+120,mouseY+100);
  //Sphere
  fill(255,280-.3*mouseY,0);
  ellipse(mouseX,mouseY,200,200);
  
  //Face
  //Eyes
  fill(255,255,255);
  ellipse(mouseX-20,mouseY-20,30,18);
  ellipse(mouseX+50,mouseY-20,30,18);
  fill(72,118,255);
  ellipse(mouseX-20,mouseY-20,15,18);
  ellipse(mouseX+50,mouseY-20,15,18);
  fill(0,0,0);
  ellipse(mouseX-20,mouseY-20,5,5);
  ellipse(mouseX+50,mouseY-20,5,5);
    //blink
    if(mouseY<200&&mouseY>190||mouseY<580&&mouseY>570||mouseY<300&&mouseY>290)
    {fill(255,280-.3*mouseY,0);
     ellipse(mouseX,mouseY,200,200);}
  
  //Mouth
  fill(235,199,158);
  ellipse(mouseX+10,mouseY+20,100,50);
  fill(255,280-.3*mouseY,0);
  ellipse(mouseX+10,mouseY+10,100,50);
  
 
  
  //
  
  //windmill
  fill(120,120,120);
  rect(900,610,20,130);
  fill(238,238,0);
  pushMatrix();
  translate(910,600);
  if(mouseX/100==0)
   {rect(-25,-25,50,50);
    triangle(-25,-25,0,-50,0,-25);
    triangle(25,-25,50,0,25,0);
    triangle(25,25,0,50,0,25);
    triangle(-25,25,-50,0,-25,0);
   }  
  if(mouseX/100==1)
   {rotate(radians(36));
    rect(-25,-25,50,50);
    triangle(-25,-25,0,-50,0,-25);
    triangle(25,-25,50,0,25,0);
    triangle(25,25,0,50,0,25);
    triangle(-25,25,-50,0,-25,0);
    rotate(radians(-36)); } 
  if(mouseX/100==2)
   {rotate(radians(72));
    rect(-25,-25,50,50);
    triangle(-25,-25,0,-50,0,-25);
    triangle(25,-25,50,0,25,0);
    triangle(25,25,0,50,0,25);
    triangle(-25,25,-50,0,-25,0);
    rotate(radians(-72)); } 
  if(mouseX/100==3)
   {rotate(radians(108));
    rect(-25,-25,50,50);
    triangle(-25,-25,0,-50,0,-25);
    triangle(25,-25,50,0,25,0);
    triangle(25,25,0,50,0,25);
    triangle(-25,25,-50,0,-25,0);
    rotate(radians(-108)); } 
  if(mouseX/100==4)
   {rotate(radians(144));
    rect(-25,-25,50,50);
    triangle(-25,-25,0,-50,0,-25);
    triangle(25,-25,50,0,25,0);
    triangle(25,25,0,50,0,25);
    triangle(-25,25,-50,0,-25,0);
    rotate(radians(-144)); } 
  if(mouseX/100==5)
   {rotate(radians(180));
    rect(-25,-25,50,50);
    triangle(-25,-25,0,-50,0,-25);
    triangle(25,-25,50,0,25,0);
    triangle(25,25,0,50,0,25);
    triangle(-25,25,-50,0,-25,0);
    rotate(radians(-180)); } 
  if(mouseX/100==6)
   {rotate(radians(216));
    rect(-25,-25,50,50);
    triangle(-25,-25,0,-50,0,-25);
    triangle(25,-25,50,0,25,0);
    triangle(25,25,0,50,0,25);
    triangle(-25,25,-50,0,-25,0);
    rotate(radians(-216)); } 
  if(mouseX/100==7)
   {rotate(radians(252));
    rect(-25,-25,50,50);
    triangle(-25,-25,0,-50,0,-25);
    triangle(25,-25,50,0,25,0);
    triangle(25,25,0,50,0,25);
    triangle(-25,25,-50,0,-25,0);
    rotate(radians(-252)); } 
  if(mouseX/100==8)
   {rotate(radians(288));
    rect(-25,-25,50,50);
    triangle(-25,-25,0,-50,0,-25);
    triangle(25,-25,50,0,25,0);
    triangle(25,25,0,50,0,25);
    triangle(-25,25,-50,0,-25,0);
    rotate(radians(-288)); } 
  if(mouseX/100==9)
   {rotate(radians(324));
    rect(-25,-25,50,50);
    triangle(-25,-25,0,-50,0,-25);
    triangle(25,-25,50,0,25,0);
    triangle(25,25,0,50,0,25);
    triangle(-25,25,-50,0,-25,0);
    rotate(radians(-324)); } 
  fill(120,120,120);
  ellipse(0,0,10,10);
  popMatrix(); 
  
  
  //Hills
  fill(50,205,50);
  ellipse(200,850,1200,600);
  ellipse(500,800,1200,200);
  
  
  //House
  fill(190,190,190);
  ellipse(200,650,170,170);
  fill(50,205,50);
  rect(100,690,200,100);
    //open
    if(mouseY>600&&mouseY<685)
    {
      fill(30,144,255);
      ellipse(200,650,(mouseY-599)*2,170);
      fill(50,205,50);
      rect(100,690,200,100);
    }
    if(mouseY>684&&mouseY<781)
    {
      fill(30,144,255);
      ellipse(200,650,170,170);
      fill(50,205,50);
      rect(100,690,200,100);
    }
    if(mouseY>780&&mouseY<799)
    {
      fill(30,144,255);
      ellipse(200,650,(798-mouseY)*10,170);
      fill(50,205,50);
      rect(100,690,200,100);
    }
    if(mouseY>798)
    {
      fill(190,190,190);
      ellipse(200,650,170,170);
      fill(50,205,50);
      rect(100,690,200,100);
    }
  
  
  //Teletubbies
  //Tinky Winky
  //scurrying
  
  
  if(mouseY>700&&mouseY<765)
  {
    fill(148,0,211);
    ellipse(400+2800-4*mouseY,620-490+.7*mouseY,50-.5*(mouseY-700),90-.8*(mouseY-700));
    ellipse(400+2800-4*mouseY,560-910+1.3*mouseY,50-.5*(mouseY-700),50-.5*(mouseY-700));
    ellipse(390+2730-3.9*mouseY,660-210+.3*mouseY,13-.1*(mouseY-700),50-.5*(mouseY-700));
    ellipse(410+2870-4.1*mouseY,660-210+.3*mouseY,13-.1*(mouseY-700),50-.5*(mouseY-700));
    rect(398+2800-4*mouseY,528-1120+1.6*mouseY,4-.03*(mouseY-700),10-.05*(mouseY-700));
    triangle(400+2800-4*mouseY,528-1120+1.6*mouseY,380+2660-3.8*mouseY,510-1260+1.8*mouseY,420+2940-4.2*mouseY,510-1260+1.8*mouseY);
    ellipse(372+3.723*(700-mouseY),560-917+1.31*mouseY,18-.2*(mouseY-700),30-.32*(mouseY-700));
    ellipse(428+3010-4.3*mouseY,560-917+1.31*mouseY,18-.2*(mouseY-700),30-.32*(mouseY-700));
    fill(.3*mouseY,250-.2*mouseY,330-.1*mouseY);
    if(mouseY>720)
      fill(50,205,50);
    if(mouseY>737)
      fill(30,144,255);
    triangle(400+2800-4*mouseY,524-1155+1.65*mouseY,386+2723-3.89*mouseY,513-1225+1.75*mouseY,414+2870-4.1*mouseY,513-1225+1.75*mouseY);
  }
  else if(mouseY<701)
  {
    fill(148,0,211);
    ellipse(400,620,50,90);
    ellipse(400,560,50,50);
    ellipse(390,660,13,50);
    ellipse(410,660,13,50);
    rect(398,528,4,10);
    triangle(400,528,380,510,420,510);
    ellipse(372,560,18,30);
    ellipse(428,560,18,30);
    fill(.3*mouseY,250-.2*mouseY,330-.1*mouseY);
    if(mouseY>760&&mouseX<200)
      fill(0,0,0);
    triangle(400,524,386,513,414,513);
  }
  
  
  
  //Dipsy
  
  if(mouseY>700&&mouseY<770)
  {
    fill(127,255,0);
    ellipse(500+5*(700-mouseY),640-308+.44*mouseY,50-.52*(mouseY-700),80-.8*(mouseY-700));
    ellipse(500+5*(700-mouseY),585-1*(700-mouseY),50+.5*(700-mouseY),50-.5*(mouseY-700));
    ellipse(490+4.9*(700-mouseY),678-.09*(700-mouseY),13+.12*(700-mouseY),50+.6*(700-mouseY));
    ellipse(510+5.1*(700-mouseY),678-.09*(700-mouseY),13+.12*(700-mouseY),50+.6*(700-mouseY));
    rect(498+4.98*(700-mouseY),525-1.7*(700-mouseY),4+.04*(700-mouseY),60+.8*(700-mouseY));
    ellipse(472+4.7*(700-mouseY),585-1*(700-mouseY),18+.2*(700-mouseY),30+.3*(700-mouseY));
    ellipse(528+5.3*(700-mouseY),585-1*(700-mouseY),18+.2*(700-mouseY),30+.3*(700-mouseY));
  }
  
  else if(mouseY<701)
  {
    fill(127,255,0);
    ellipse(500,640,50,80);
    ellipse(500,585,50,50);
    ellipse(490,678,13,50);
    ellipse(510,678,13,50);
    rect(498,525,4,60);
    ellipse(472,585,18,30);
    ellipse(528,585,18,30);
  }
  
  
  //Lala
  
  if(mouseY>700&&mouseY<775)
  {
    fill(255,255,0);
    ellipse(600+5.9*(700-mouseY),660-.2*(700-mouseY),50+.52*(700-mouseY),70+.7*(700-mouseY));
    ellipse(600+5.9*(700-mouseY),610-.7*(700-mouseY),45+.45*(700-mouseY),45+.45*(700-mouseY));
    ellipse(590+5.8*(700-mouseY),690+.08*(700-mouseY),13+.13*(700-mouseY),50+.6*(700-mouseY));
    ellipse(610+6*(700-mouseY),690+.08*(700-mouseY),13+.13*(700-mouseY),50+.6*(700-mouseY));
    rect(598+5.89*(700-mouseY),570-1.1*(700-mouseY),4+.03*(700-mouseY),20+.2*(700-mouseY));
    rect(601+5.91*(700-mouseY),555-1.25*(700-mouseY),4+.03*(700-mouseY),22+.2*(700-mouseY));
    ellipse(575+5.63*(700-mouseY),610-.7*(700-mouseY),15+.13*(700-mouseY),25+.21*(700-mouseY));
    ellipse(625+6.16*(700-mouseY),610-.7*(700-mouseY),15+.13*(700-mouseY),25+.21*(700-mouseY));
  }
  
  else if(mouseY<701)
  {
    fill(255,255,0);
    ellipse(600,660,50,70);
    ellipse(600,610,45,45);
    ellipse(590,690,13,50);
    ellipse(610,690,13,50);
    rect(598,570,4,20);
    rect(601,555,4,22);
    ellipse(575,610,15,25);
    ellipse(625,610,15,25);
  }
  
  
  
  //Po
  
  if(mouseY>700&&mouseY<780)
  {
    fill(255,0,0);
    ellipse(700+6.9*(700-mouseY),670-.1*(700-mouseY),40+.4*(700-mouseY),60+.6*(700-mouseY));
    ellipse(700+6.9*(700-mouseY),625-.55*(700-mouseY),40+.4*(700-mouseY),40+.4*(700-mouseY));
    ellipse(692+6.82*(700-mouseY),690+.1*(700-mouseY),12+.12*(700-mouseY),50+.5*(700-mouseY));
    ellipse(708+6.97*(700-mouseY),690+.1*(700-mouseY),12+.12*(700-mouseY),50+.5*(700-mouseY));
    rect(698+6.88*(700-mouseY),600-.8*(700-mouseY),4+.04*(700-mouseY),10+.1*(700-mouseY));
    ellipse(700+6.9*(700-mouseY),590-.9*(700-mouseY),20+.2*(700-mouseY),20+.2*(700-mouseY));
    ellipse(680+6.7*(700-mouseY),625-.55*(700-mouseY),15+.15*(700-mouseY),25+.25*(700-mouseY));
    ellipse(720+7.1*(700-mouseY),625-.55*(700-mouseY),15+.15*(700-mouseY),25+.25*(700-mouseY));
    fill(.3*mouseY,250-.2*mouseY,330-.1*mouseY);
    if(mouseY>760&&mouseX<200)
      fill(0,0,0);
    if(mouseY>720)
      fill(50,205,50);
    if(mouseY>760)
      fill(30,144,255);
      
    ellipse(700+6.9*(700-mouseY),590-.9*(700-mouseY),15+.15*(700-mouseY),15+.15*(700-mouseY));
  }
  
  else if(mouseY<701)
  {
    fill(255,0,0);
    ellipse(700,670,40,60);
    ellipse(700,625,40,40);
    ellipse(692,690,12,50);
    ellipse(708,690,12,50);
    rect(698,600,4,10);
    ellipse(700,590,20,20);
    ellipse(680,625,15,25);
    ellipse(720,625,15,25);
    fill(.3*mouseY,250-.2*mouseY,330-.1*mouseY);
    if(mouseY>760&&mouseX<200)
      fill(0,0,0);
    ellipse(700,590,15,15);
  }
 
  
}

