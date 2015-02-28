
//copyright Kelechi Edozie-Anydiewgu
//Computer Arts with Processing
//Homework 4
float x, y, wd, ht ;

void setup()
{
 size(400,400);
 smooth();
 
 x=100;
 y=100;
 wd=100;
 ht=100;
 
   background(173,6,211);
   noStroke();
   fill(255,255,255);
 ellipse(x*2, y*2, wd*3, ht*3);

}
void mouseClicked()
{
background (random(255), random(255), random(255));
}
void draw()
{

  
  //background(173,6,211);
//   noStroke();
//   fill(255,255,255);
// ellipse(x*2, y*2, wd*3, ht*3);
  // ellipse(x,y,wd,ht);
}



void keyPressed()
{
  if (key ==' ')//clearface
  {
    fill(255,255,255);
    ellipse (x*2, y*2, wd*3, ht*3);
  }
  if (key =='n')//nose color
  {
  fill(random(255),random(10),random(10));
  ellipse(x/.5,y/.5,wd*.5,ht*.5 );  
  }
  if (key == 'e') //eye color
  {
   fill(random(255),random(115),random(255));
  ellipse(x*1.5,y*1.5, random(50,100), random(50,100)); 
  ellipse(x*2.5, y*1.5, random(50,100), random(50,100));
  }
  if (key == 'm') //mouth color
  {
    strokeWeight(random(10,50));
    fill(random(255),random(115),random(255));
    //noFill();
   arc(x/.5, y*2.5, wd*2,ht,radians(0), radians(180));
  }
  
}




