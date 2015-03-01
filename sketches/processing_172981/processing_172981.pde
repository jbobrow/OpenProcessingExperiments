
void setup ()
{
   smooth();
  colorMode (HSB,360,100,100);
  
  size (800,500);
  
}

void draw ()
{
  stroke(0);
  strokeWeight (1);
  translate (width/2, height/2);
  rectMode (CENTER);
  ellipseMode (CENTER);
  println (mouseX);
 
  background (47,51,91-mouseX*0.12);
      fill (30,85,45-mouseX*0.08);
      rect (-400,170,1820,200);   //Tisch
      fill (30,85,51-mouseX*0.08);
      rect (-400,130,1820,130);
    
      fill (200,90,55-mouseX*0.07);         //Bücher
      rect (325,60,30,150);
      rect (385,60,30,150);
      fill (133,90,55-mouseX*0.07);
      rect (355,60,30,150);
      
      fill (30,85,51-mouseX*0.08);
      rect (-280,-130,160,100); 
      fill (34,0,99-mouseX*0.13);                          //Bild
      rect (-280,-130,140,80);
      fill (133,90,55-mouseX*0.07);
      rect (-280,-95,140,15);
      fill (306,45,99-mouseX*0.13);
      ellipse (-300,-114,25,45);
      ellipse (-300,-140,25,25);
      ellipse (-302,-140,2,2);
      ellipse (-298,-140,2,2);
      ellipse (-310,-98,15,15);
      ellipse (-290,-98,15,15);
      ellipse (-310,-117,10,15);
      ellipse (-290,-117,10,15);
      ellipse (-310,-135,10,30);
      ellipse (-290,-135,10,30);
      
      
      
      
      fill (46,99,89-mouseX*0.12);
      ellipse (0,60,160,180);   //Körper
      ellipse (45,-98,50,50);  //Ohren
      ellipse (-45,-98,50,50);  //Ohren
      ellipse (0,-45,120,120);   // Kopf
      ellipse (0,-15,80,60);    //Maul
      ellipse (50,130,60,60);   //Beine
      ellipse (-50,130,60,60); 
      ellipse (65,35,55,55);    //Arme
      ellipse (-65,35,55,55);
      fill (58,0+mouseX/10,100);
      ellipse ( 30,-52,20,20);  //Augen
      ellipse (-30,-52,20,20);
      fill (0,0,0);
      ellipse (25+mouseX/60,-56+mouseY/60,5,5);
      ellipse (-35+mouseX/60,-56+mouseY/60,5,5);
      ellipse (0,-30,5,5);      //Nase   
     
     if (mouseX< width/2-50 && mousePressed == true)
    { 
      noStroke();
      fill (312,63,98);
      triangle (-420+mouseX,-240+mouseY,-420+mouseX+40,-240+mouseY,-420+mouseX+20,-240+mouseY+40);
      arc (-420+mouseX+10,-240+mouseY,20,20,PI,TWO_PI);
      arc (-420+mouseX+30,-240+mouseY,20,20,PI,TWO_PI);
      ellipse (-30,-35,30,10);
      ellipse (30,-35,30,10);
     }
     if (mouseX>width/2+50 && mousePressed == true)
     {
       strokeWeight (6);
       line (-38,-62,-18,-57);
       line (38,-62,18,-57);
     }
     if (mouseX>40&&mouseX<200&&mouseY>70&&mouseY<170)
     {
       PFont myFont;
       myFont = createFont("Georgia", 22);
       textFont(myFont);
       textAlign(CENTER, CENTER);
       text("Hallo", -250, -140);
     }
     if (mouseX==399&&mouseY==219)
     {
       PFont myFont;
       myFont = createFont("Georgia", 32);
       textFont(myFont);
       textAlign(CENTER, CENTER);
       text("Hi", -80, -30);
     }
}
