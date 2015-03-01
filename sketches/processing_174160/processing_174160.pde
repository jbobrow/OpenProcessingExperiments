
float x = 100;
float y = 100;
float xspeed = 2.5;
float yspeed = 2;
boolean mouseIsDown = false;

void setup ()
{
  smooth ();
  size (500,500);
  background (#FAAE67);
  

}
void draw ()
{
 
  noStroke( );
fill(#F00515);
beginShape(POLYGON);
vertex(38, 23);
vertex(46, 23);
vertex(46, 31);
vertex(54, 31);
vertex(54, 38);

vertex(61, 38);
vertex(61, 46);
vertex(69, 46);
vertex(69, 54);
vertex(61, 54);
vertex(61, 61);
vertex(54, 61);
vertex(54, 69);
vertex(46, 69);
vertex(46, 77);
vertex(38, 77);
endShape( );



   
   strokeWeight(abs(pmouseX-mouseX));
  stroke(random(255),random(255),random(255));
  filter(POSTERIZE,6);
  //filter(DILATE);
  if(mouseIsDown == true)
  {
    fill(random(0,255),random(0,255),random(0,255),random(0,255));
 rect(pmouseX, pmouseY, random(0,20), random(0,20));
 
  }
  
  

 

  if ((x > width) || (x < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y > height) || (y < 0)) {
    yspeed = yspeed * -1;
    
  }



  // Display circle at x location
  stroke(0);
  strokeWeight(2);
  
  ellipseMode (CENTER);
  println (mouseX);
  noStroke ();
  fill (100);
  //sombra
  ellipse (250,450,190,40);
  stroke (0);
  strokeWeight (4);
  line (220,370,220,450);  //Beine
  line (280,370,280,450);
  //line (210,450,220,450);
  //line (280,450,290,450); 
  fill (#DEFF27);           //Körper
  //cuerpo
  ellipse (250,280,160,220);
  line (330,280,330,360);  //Arme
 
  line (170,280,170,360);
  fill(0);                 //Augen
  ellipse (210+mouseX*0.05,250+mouseY*0.05,5,10);
  ellipse (270+mouseX*0.05,250+mouseY*0.05,5,10);  
  ellipse (240+mouseX*0.05,290+mouseY*0.05,100,20);  //Mund
  fill (#F0A330);
  noStroke();
  ellipse (240+mouseX*0.05,289+mouseY*0.05,106,24);
  stroke (0);
  fill(#F0A330);
  rect (400,100,50,50);
  fill (0);
  PFont myFont;
  myFont = createFont("Georgia", 22);
  textFont(myFont);
  textAlign(CENTER,CENTER);
  text("Do not", 425,80);
  text ("Press", 425,170);
   
  if (mouseX>400&&mouseX<450&&mouseY>100&&mouseY<150&&mousePressed==true)
  {
    background (#9CFAEE);
    for (int i=170;i<330;i+=2)
  {
    strokeWeight (1);
    stroke (250,250,0);
    line (i,265,i+sin(millis()/100.0+i)*10,140+random (40));
  }
   for (int i=171;i<330;i+=2)
  {
    stroke (250,0,0);
    line (i,265,i+sin(millis()/100.0+i)*10,140+random(50));
  }
  noStroke ();
  fill (#DEFF27);
  ellipse (250,450,130+random(20),20+random(10));
  stroke (0);
  strokeWeight (4);
  line (220,370,220,450-random (30));  //Beine
  line (280,370,280,450-random (30));
  //line (210,450,220,450);
  //line (280,450,290,450); 
  fill (#DEFF27);           //Körper
  ellipse (250,280,160,220);
  line (330,280,330+random(20),220+random(10));  //Arme
  line (170,280,150+random(20),220+random (10));
  fill(0);                 //Augen
  ellipse (220,250,5+random(3),10+random(4));
  ellipse (280,250,5+random(3),10+random(4));  
  fill (#DEFF27);
  noStroke ();
  ellipse (250,258,120,10);
  fill (0);
  ellipse (250,300,30+random(8),40+random(10));
  stroke (0);
  fill(255,0,0);
  rect (400,100,50,50);
  fill (0);
  
  }
}
void mousePressed()
{
mouseIsDown = true;
println("Mouse was pressed");
}
void mouseReleased()
{
  mouseIsDown = false;
  println("Mouse was released");
}



