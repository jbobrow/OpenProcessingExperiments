
void setup ()
{
  size (200,200);
  background (118,6,92);
  /*line (20,100,70,63);
   line (180,100,130,65);
   curve (20,100,70,63,98,65,150,100);
   curve (180,100,130,65,98,65,50,100);
   cu  rve (20,100,20,100,75,130,180,125);
   curve (20,100,75,130,120,133,180,125);
   curve (180,100,180,100,120,133,20,110);
   curve (10,190,25,100,175,100,190,190);
   curve (10,60,25,100,175,100,190,60);*/
}


void draw()
{
  background (118,6,92);
  strokeWeight (4);
  //oberlippe
  fill (220,0,20);
  beginShape ();
  curveVertex (20,100);
  curveVertex (20,100);
  curveVertex (70,63);
  curveVertex (98,65);
  curveVertex (98,65);
  curveVertex (130,64);
  curveVertex (180,100);
  curveVertex (180,100);
  endShape ();
  //unterlippe
  fill (220,0,20);
  beginShape();
  curveVertex (20,100);
  curveVertex (20,100);
  curveVertex (65,140);
  curveVertex (100,145);
  curveVertex (135,140);
  curveVertex (180,100);
  curveVertex (180,100);
  endShape();
  //oben
  strokeWeight (2);
  fill(0);
  curve (10,190,27,100,175,100,190,190);
  //unten
  strokeWeight (4);
  curve (30,10,40,100,160,100,170,10);
  
  //zähne
  fill (255);
  strokeWeight (1);
  //schneidezähne
  rect (78, 88, 20, 18);
  rect (99, 88, 20, 18);
  //zähne rechts
  rect (120, 89, 17, 15);
  rect (137, 91, 14, 10);
  rect (151, 93, 13, 6);
  //zähne links
  rect (60, 89, 17, 15);
  rect (46, 91, 14, 10);
  rect (33, 95, 13, 4);
  
  //unterer rand oberer lippe wiederholen um zähne zu übermalen
  noFill();
  strokeWeight(3);
  curve (10,190,27,100,175,100,190,190);
 
 //koordinaten finden
 if (mousePressed)
  { 
    println (""+mouseX+"+"+mouseY+"");
  }
  
  //kuss
  if (mousePressed)
  {
     background (118,6,92);
    strokeWeight (4);
  //oberlippe
  fill (220,0,20);
  beginShape ();
  curveVertex (50,100);
  curveVertex (50,100);
  curveVertex (75,63);
  curveVertex (98,65);
  curveVertex (98,65);
  curveVertex (125,64);
  curveVertex (150,100);
  curveVertex (150,100);
  endShape ();
  //unterlippe
  fill (220,0,20);
  beginShape();
  curveVertex (50,100);
  curveVertex (50,100);
  curveVertex (70,140);
  curveVertex (100,145);
  curveVertex (130,140);
  curveVertex (150,100);
  curveVertex (150,100);
  endShape();
   
   //oben
    strokeWeight (4);
    fill(0);
    curve (10,150,65,100,135,100,190,150);
    //unten
    strokeWeight (4);
    curve (30,50,75,100,125,100,170,50);
    line (90,106,75,120);
    line (110,106,125,120);
    line (90,93,80,80);
    line (110,93,120,80);
    line (100,106,100,130);
  }
  
  else if (keyPressed)
  {
    if (key == CODED)
    {
     if (keyCode == RIGHT)
     {
        fill (247,167,167);
        beginShape();
        curveVertex (60,110);
        curveVertex (62,109);
        curveVertex (110,100);
        curveVertex (140,65);
        curveVertex (158,65);
        curveVertex (170,95);
        curveVertex (160,100);
        curveVertex (160,105);
        endShape(); 
        
        noFill();
        beginShape();
        curveVertex(96,108);
        curveVertex(96,106);
        curveVertex(135,103);
        curveVertex(147,78);
        curveVertex(147,78);
        endShape();
        
        
        
        noFill();
        strokeWeight (4);
        curve (30,10,40,100,160,100,170,10);
      }
    }
  }
}

