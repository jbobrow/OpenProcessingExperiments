
// Miles Dempsey- p4 engneering - 4.9.13
int m; //mouse moves plane arrows move arm up and down and mousePressed creates fireball.
 
void setup ()
{
size (500,500);
}
void draw ()
{
  background (0,0,0);
  fill (#C0C0C0);
  rect (350,200,100,300);
  noStroke ();
  arc (400,200,100,50,3,6.28);
  rect (395,75,10,100);
  //empire state building
 
  fill (117,72,72);
 
 
  m = 113;
ellipse (345,140,60,60);//king kong
  rect (345,135,50,13);
  rect (347,140,15,50);
  ellipse (345,100,30,30);
 

  if(key==CODED && keyCode==UP)
  { rect (280,124,80,13);}  //down arm
  else  {rect (280,113,80,13); 
        } //up arm

  if (mousePressed)
 {
  fill (255,94,13);
  ellipse (200,150,200,200);
 }
 
 else {ellipse (1,1,1,1);
     fill (0,0,0);
     println("KING KONG");
 } 
     
      
      
  pushMatrix ();
  translate (mouseX-163,mouseY-130);
  fill (#FFFF00);//plane
  ellipse (163,130,40,40);
  rect (43,130,105,10);
  rect (173,130,110,10);
  fill(#C0C0C0);
  ellipse (163,130,10,10);
 
  fill (255,255,255);
  rect (167,130,50,5);
  rect (110,130,50,5);
 
  popMatrix ();
}
