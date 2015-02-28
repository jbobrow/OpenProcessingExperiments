
void setup ()
{

  size (1000, 500);
  smooth ();
}

void draw ()
{

  //   INT


  //   épaisseur traits (ept) et points (ept), plus la valeur est grande, plus les traits sont fins.
  int eptl;
  eptl = 150;
  int eptc;
  eptc = 150;
  int epp;
  epp = 200;

  //   vibrations traits (vibl  et   viblc) et forme ellipse (vibc) et rect (vibr)
  int vibl;
  vibl = 2+mouseX/50;   // JAMAIS 0
  int viblc;
  viblc = 2+mouseX/50;  // JAMAIS 0
  int vibc;
  vibc = 2+mouseX/50;
  int vibr;
  vibr = 2+mouseX/50;

  //   décalage  horizontal  vertical
  int dech;
  dech = -width/250;
  int decv;
  decv = -height/250;



  background (random (240, 255), random (175, 205), random (40, 70));

  stroke (random (250, 255), random (250, 255), random (240, 245));
  strokeWeight (random (((width/2)+(height/2))/epp/vibl, ((width/2)+(height/2))/epp));

  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));

  stroke (random (155, 185), random (50, 80), random (0, 15));

  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));
  point (random (0, width), random (0, height));



  noFill ();
  stroke (random (250, 255), random (250, 255), random (240, 245));
  strokeWeight (random (((width/2)+(height/2))/eptc/viblc+1, ((width/2)+(height/2))/eptc+1));

  ellipse (width/2, height/2, (width/10*1)+random(0, vibc), (width/10*1)+random(0, vibc));
  ellipse (width/2, height/2, (width/10*2)+random(0, vibc), (width/10*2)+random(0, vibc));
  ellipse (width/2, height/2, (width/10*4)+random(0, vibc), (width/10*4)+random(0, vibc));
  ellipse (width/2, height/2, (width/10*6)+random(0, vibc), (width/10*6)+random(0, vibc));
  ellipse (width/2, height/2, (width/10*8)+random(0, vibc), (width/10*8)+random(0, vibc));
  ellipse (width/2, height/2, (width/10*10)+random(0, vibc), (width/10*10)+random(0, vibc));
  ellipse (width/2, height/2, (width/10*12)+random(0, vibc), (width/10*12)+random(0, vibc));
  ellipse (width/2, height/2, (width/10*14)+random(0, vibc), (width/10*14)+random(0, vibc));

  stroke (random (250, 255), random (250, 255), random (240, 245));
  strokeWeight (random (((width/2)+(height/2))/eptl/vibl+1, ((width/2)+(height/2))/eptl+1));

  rect (width/2-(width/10*1)/2+random(0, vibr/2)+dech, height/2-(height/10*1)/2+random(0, vibr/2)+decv, (width/10*1)+random(0, vibr/2), (height/10*1)+random(0, vibr/2));
  rect (width/2-(width/10*2)/2+random(0, vibr/2)+dech, height/2-(height/10*2)/2+random(0, vibr/2)+decv, (width/10*2)+random(0, vibr/2), (height/10*2)+random(0, vibr/2));
  rect (width/2-(width/10*3)/2+random(0, vibr/2)+dech, height/2-(height/10*3)/2+random(0, vibr/2)+decv, (width/10*3)+random(0, vibr/2), (height/10*3)+random(0, vibr/2));
  rect (width/2-(width/10*4)/2+random(0, vibr/2)+dech, height/2-(height/10*4)/2+random(0, vibr/2)+decv, (width/10*4)+random(0, vibr/2), (height/10*4)+random(0, vibr/2));
  rect (width/2-(width/10*5)/2+random(0, vibr/2)+dech, height/2-(height/10*5)/2+random(0, vibr/2)+decv, (width/10*5)+random(0, vibr/2), (height/10*5)+random(0, vibr/2));
  rect (width/2-(width/10*6)/2+random(0, vibr/2)+dech, height/2-(height/10*6)/2+random(0, vibr/2)+decv, (width/10*6)+random(0, vibr/2), (height/10*6)+random(0, vibr/2));
  rect (width/2-(width/10*7)/2+random(0, vibr/2)+dech, height/2-(height/10*7)/2+random(0, vibr/2)+decv, (width/10*7)+random(0, vibr/2), (height/10*7)+random(0, vibr/2));
  rect (width/2-(width/10*8)/2+random(0, vibr/2)+dech, height/2-(height/10*8)/2+random(0, vibr/2)+decv, (width/10*8)+random(0, vibr/2), (height/10*8)+random(0, vibr/2));
  rect (width/2-(width/10*9)/2+random(0, vibr/2)+dech, height/2-(height/10*9)/2+random(0, vibr/2)+decv, (width/10*9)+random(0, vibr/2), (height/10*9)+random(0, vibr/2));
  rect (width/2-(width/10*10)/2+random(0, vibr/2)+dech, height/2-(height/10*10)/2+random(0, vibr/2)+decv, (width/10*10)+random(0, vibr/2), (height/10*10)+random(0, vibr/2));

  /*stroke (random (200,210),random (175,185),random (130,140));
   strokeWeight (1);
   
   rect (width/2-(width/10*1)/2,height/2-(height/10*1)/2,(width/10*1),(height/10*1));
   rect (width/2-(width/10*2)/2,height/2-(height/10*2)/2,(width/10*2),(height/10*2));
   rect (width/2-(width/10*3)/2,height/2-(height/10*3)/2,(width/10*3),(height/10*3));
   rect (width/2-(width/10*4)/2,height/2-(height/10*4)/2,(width/10*4),(height/10*4));
   rect (width/2-(width/10*5)/2,height/2-(height/10*5)/2,(width/10*5),(height/10*5));
   rect (width/2-(width/10*6)/2,height/2-(height/10*6)/2,(width/10*6),(height/10*6));
   rect (width/2-(width/10*7)/2,height/2-(height/10*7)/2,(width/10*7),(height/10*7));
   rect (width/2-(width/10*8)/2,height/2-(height/10*8)/2,(width/10*8),(height/10*8));
   rect (width/2-(width/10*9)/2,height/2-(height/10*9)/2,(width/10*9),(height/10*9));
   rect (width/2-(width/10*10)/2,height/2-(height/10*10)/2,(width/10*10),(height/10*10));
   */
}



