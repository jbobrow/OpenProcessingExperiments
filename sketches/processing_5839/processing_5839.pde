
float x = 140;
float y = 140;
float w = 50;
float h = 50;

float r = 255;
float g = 180;
float b = 70;
float a = 110;

float hartR;
float hartG;
float hartB;

float xspeed = 3;
float yspeed = 1;

void setup()
{
  size(210,220);
  smooth();
  frameRate(30);
}

void draw()
{
  background(r,g,b);
  
  //Teken perspectieflijnen
  stroke(150,0,255);
  line(0,0,50,50);
  line(200,0,150,50);
  line(0,220,50,200);
  line(200,220,150,200);
 
 //Teken gekleurde rechthoeken wanneer:
  if(mouseX > 50 && mouseX < 150)  {
    fill(100,100,200);
    rect(50,50,100,150);                
  } else if(mouseX < 50)  {
    fill(0,255,0);
    rect(0,50,50,150);
}  else if(mouseX > 150)  {
  fill(0,255,255);
  rect(150,50,210,150);
}
  
  //Gekleurde vlakken, steeds doorzichtiger:
  stroke(255);
  fill(0,0,255);
  rect(20,35,b,a);
  fill(r,0,0,191);
  rect(35,20,b,a);
  fill(r,0,0,30);
  rect(60,7,b,a);
  
  //Teken hart bloem
  noStroke();
  hartR = random(r);
  hartG = random(r);
  hartB = random(r);
  fill(hartR,hartG,hartB);
  ellipse(x,y,w,h);
  
  //Tekenbloemblaadjes
  fill(r,100,200);
  ellipse(x-22,y-22,w/2,h/2);
  ellipse(x,y-30,w/2,h/2);
  ellipse(x+16,y+20,w/2,h/2);
  ellipse(x+20,y-20,w/2,h/2);
  ellipse(x-22,y+15,w/2,h/2);
  ellipse(x+25,y,w/2,h/2);
  ellipse(x-30,y-2,w/2,h/2);
  ellipse(x-2,y+25,w/2,h/2);
  
  //Bloem van locatie veranderen door speed
   x = x + xspeed;
   y = y + yspeed;
   
  if((x > 210) || (x < 0)){
    xspeed = xspeed * -1;
   
  }
  //Bloem blijft op het scherm
   y = constrain(y,10,183);
}

void mousePressed()
{
    println("Nu ben ik heel benieuwd.. is het interactief genoeg?");
}


