

void setup()

{
size(1200,200);
fill(255,255,0);
}


int posX = 0;
boolean omNom = false;
float checkPos = 0;


void draw()
{
  // check to omNom
  if(posX<0)
  {
  checkPos = -posX % 40;
  }
  else
  {
  checkPos = posX % 40;
  }

  if(checkPos == 0)
  {
    omNom = true;
  }
   
  if(checkPos == 10)
  {
   omNom = false; 
  }
  
  if(posX == 1100)
  {
    posX= -700;
  }
//start to draw  
  
background(0);
noStroke();


if(omNom == true )       // try to eat the om noms
{
  fill(255,255,0); 
  arc(posX+100,100,100,100,0,2*PI);
}
else
{
  fill(255,255,0);
arc(posX+100,100,100,100,PI/8, 7*QUARTER_PI);
}


fill(0,0,255);                     
rect(posX+200,70,120,70);
bezier(posX+200,140,posX+210,160,posX+220,160,posX+230, 140);
fill(0);
bezier(posX+230,140,posX+235,120,posX+240,120,posX+245,140);
fill(0,0,255);
bezier(posX+245,140,posX+255,160,posX+265,160,posX+275,140);
fill(0);
bezier(posX+275,140,posX+280,120,posX+285,120,posX+290,140);
fill(0,0,255);
bezier(posX+290,140,posX+300,160,posX+310,160,posX+320,140);
arc(posX+260,70, 120,90,PI,2*PI);

if(omNom == true)
{
fill(0);
}
else
{
fill(255);
}
ellipse(posX+235,70,20,20);
ellipse(posX+285,70,20,20);

fill(0);
ellipse(posX+240,70,10,10);
ellipse(posX+290,70,10,10);

fill(255);
rect(posX + 340,80,120,70);
bezier(posX + 340,150,posX +  350,170,posX + 360,170,posX +  370, 150);
fill(0);
bezier(posX + 370,150,posX + 375,130,posX + 380,130,posX + 385,150);
fill(255);
bezier(posX + 385,150,posX + 395,170,posX + 405,170,posX + 415,150);
fill(0);
bezier(posX + 415,150,posX + 420,130,posX + 425,130,posX + 430,150);
fill(255);
bezier(posX + 430,150,posX + 440,170,posX + 450,170,posX + 460,150);
arc(posX + 400,80, 120,90,PI,2*PI);

if(omNom == true)
{
fill(0);
}
else
{
fill(255);
}
ellipse(posX + 375,80,20,20);
ellipse(posX + 425,80,20,20);

fill(0);
ellipse(posX + 380,80,10,10);
ellipse(posX + 430,80,10,10);


fill(0,0,255);
rect(posX + 480,70,120,70);
bezier(posX + 480,140,posX +  490,160,posX + 500,160,posX +  510, 140);
fill(0);
bezier(posX + 510,140,posX + 515,120,posX+ 520,120,posX + 525,140);
fill(0,0,255);
bezier(posX + 525,140,posX + 535,160,posX + 545,160,posX + 555,140);
fill(0);
bezier(posX + 555,140,posX + 560,120,posX + 565,120,posX + 570,140);
fill(0,0,255);
bezier(posX + 570,140,posX + 580,160,posX + 590,160,posX + 600,140);
arc(posX + 540,70, 120,90,PI,2*PI);

if(omNom == true)
{
fill(0);
}
else
{
fill(255);
}
ellipse(posX + 515,70,20,20);
ellipse(posX + 565,70,20,20);

fill(0);
ellipse(posX + 520,70,10,10);
ellipse(posX + 570,70,10,10);

fill(255);
rect(posX + 620,80,120,70);
bezier(posX + 620,150,posX +  630,170,posX + 640,170,posX +  650, 150);
fill(0);
bezier(posX + 650,150,posX + 655,130,posX + 660,130,posX + 665,150);
fill(255);
bezier(posX + 665,150,posX + 675,170,posX + 685,170,posX + 695,150);
fill(0);
bezier(posX + 695,150,posX + 700,130,posX + 705,130,posX + 710,150);
fill(255);
bezier(posX + 710,150,posX+ 720,170,posX + 730,170,posX + 740,150);
arc(posX + 680,80, 120,90,PI,2*PI);

if(omNom == true)
{
fill(0);
}
else
{
fill(255);
}
ellipse(posX + 655,80,20,20);
ellipse(posX + 705,80,20,20);

fill(0);
ellipse(posX+ 660,80,10,10);
ellipse(posX + 710,80,10,10);





///end draw

//integer modifications

posX +=1;

}

