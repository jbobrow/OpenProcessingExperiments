
float g=255;
float b=255;
float gg=255;
void setup ()
{
  size (400,400);
}
void draw ()       
{
  fill(0,gg,b);
  rect(0,0,400,400);
  if (mousePressed){
  b=b-3.5;
  gg=gg-7.5;
  fill(0,gg,b);
  rect(0,0,400,400);
}
 
  if (b<2.9){
  fill(#C1B9B9);
  ellipse (340,mouseY,130,130);
  noStroke();
  fill(#7C7272);
  ellipse (350,mouseY, 30,30);
  ellipse (310,mouseY-20,25,25);
  ellipse (305,mouseY+20,10,10);
  ellipse (358,mouseY-30,15,15);
  ellipse (348,mouseY+31,17,17);
  ellipse (395,mouseY+5,20,20);
  fill(#C1B9B9);
  ellipse (350,mouseY,25,25);
  ellipse (310,mouseY-20,20,20);
  ellipse (305,mouseY+20,5,5);
  ellipse (358,mouseY-30,10,10);
  ellipse (348,mouseY+31,12,12);
  ellipse (395,mouseY+5,15,15);
  }
  stroke(1);
    
  fill (#BF8437);
  triangle (150,380,220,15,380,380);
  triangle (260,380,370,70,400,380);
  triangle (0,380,50,40,200,380);
  
  println ("Thank You for Taking Care of my Kiwi");
  fill (#BD935C);
  if (keyPressed && key==' '){
  ellipse (210,250,100,110);}
  else
  ellipse (210,105,100,110);
  ellipse (115,195,160,170);
  //body and head
 
  fill (#000000);
  if (keyPressed && key==' '){
  ellipse (205,225,30,40);
  triangle (250,275,250,245,325,335);}
  else{
  ellipse (205,80,30,40);
  triangle (250,130,250,100,325,190);}
  //eye and beak

  if (keyPressed && key=='n'){
  noStroke();
  fill (#BD935C);
  ellipse (205,75,30,40);
  }
  
  stroke(1);
  fill (#B37615);
  rect (0,380,400,20);
  //ground
 
  fill (#BFA63F);
  triangle (130,190,130,240,80,220);
  //wing
 
  fill (#82643C);
  noStroke ();
  rect (60,370,50,10);
  rect (80,260,10,130);
  rect (130,370,50,10);
  rect (150,260,10,130);
  //legs
 
  stroke (#000000);
  fill (0,g,0);
  if (keyPressed){
  if (key==' ')
  g=g-1.5 ;}
  if (g>0.0){
  ellipse (290,345,20,70);
  ellipse (330,345,20,70);
  //fruit inside
  fill (#000000);
  ellipse (290,345,20,30);
  ellipse (330,345,20,30);
  fill (#BF8437);
  arc (280,345,70,70,1.35,4.98);
  arc (340,345,70,70,4.555,7.999);}
  
  textSize (10);
  fill (#580E0E);
  text ("1.Hold spacebar, 2.Press 'n', 3. Click mouse, 4. Hold 'n'",60,397);

}


   
