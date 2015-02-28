
int counter;

PImage pik;
void setup()
{
  frameRate(60);
  size (500,500);
  pik = loadImage ("Rock.jpg");
  pik.resize (500,500);
  image(pik,0,0);
  noFill();
  stroke(1,1,1,150);
  strokeWeight(11);
  strokeJoin(BEVEL);
  line(140,160,360,160);
  strokeWeight(5);
  line(160,185,235,185);
  line(265,185,340,185);
  arc(302.5,185,35,35,0,PI);
  arc(197.5,185,35,35,0,PI);
  beginShape();
  vertex(230,225);
  vertex(230,235);
  vertex(270,235);
  vertex(270,220);
  vertex(255,220);
  endShape();
  beginShape();
  vertex(170,270);
  vertex(330,270);
  vertex(330,282);
  vertex(280,282);
  endShape();
  //arc(120,190,40,30,PI/2,PI+PI/2);
  //arc(380,190,40,30,TWO_PI-PI/2, TWO_PI);
  //arc(380,190,40,30,0,PI/2);
  //arc(380,190,40,30,TWO_PI-PI/2,PI/2); WHY CANT I DRAW AN ARC THE OTHER WAY AROUND
  bezier(120,175,90,175,90,205,120,205);
  beginShape();
  vertex(120,205);
  vertex(130,350);
  vertex(370,350);
  vertex(380,205);
  endShape();
  bezier(380,175,410,175,410,205,380,205);
  line(250,350,250,320);
  line(240,320,260,320);
}
 
void draw()
{
  if (mousePressed==true)
  {
    strokeWeight(4);
    float q;
    float w;
    q = random(mouseX-15,mouseX+15);
    w = random(mouseY-15,mouseY+15);
    line(mouseX,mouseY,q,w);
  }
if(mousePressed && mouseButton == RIGHT)
    {
      size (500,500);
      pik = loadImage ("Rock.jpg");
      pik.resize (500,500);
      image(pik,0,0);
      noFill();
      stroke(1,1,1,150);
      strokeWeight(11);
      strokeJoin(BEVEL);
      line(140,160,360,160);
      strokeWeight(5);
      line(160,185,235,185);
      line(265,185,340,185);
      arc(302.5,185,35,35,0,PI);
      arc(197.5,185,35,35,0,PI);
      beginShape();
      vertex(230,225);
      vertex(230,235);
      vertex(270,235);
      vertex(270,220);
      vertex(255,220);
      endShape();
      beginShape();
      vertex(170,270);
      vertex(330,270);
      vertex(330,282);
      vertex(280,282);
      endShape();
      //arc(120,190,40,30,PI/2,PI+PI/2);
      //arc(380,190,40,30,TWO_PI-PI/2, TWO_PI);
      //arc(380,190,40,30,0,PI/2);
      //arc(380,190,40,30,TWO_PI-PI/2,PI/2); WHY CANT I DRAW AN ARC THE OTHER WAY AROUND
      bezier(120,175,90,175,90,205,120,205);
      beginShape();
      vertex(120,205);
      vertex(130,350);
      vertex(370,350);
      vertex(380,205);
      endShape();
      bezier(380,175,410,175,410,205,380,205);
      line(250,350,250,320);
      line(240,320,260,320);
     }
}


                
                
