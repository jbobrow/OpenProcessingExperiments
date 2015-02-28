
// © Laura Tjho Jan 22 2013
// 60-257 Hw Assignment 2

size(400, 400);
smooth();
background(138, 197, 191);
float x, y , wd, ht;

//entire image
x=100;
y=10;
wd=200;
ht=380;

noFill();
strokeWeight(3);
stroke(240, 143, 143);
//rect(x, y, wd, ht);

//glasses
//rect(x, y+(.3026*ht), (.45*wd), (.2632*ht) );
//rect(x+(.55*wd), y+(.3026*ht), (.45*wd), (.2632*ht) );

ellipse(x+(wd*.225), y+(.3026*ht)+(ht*.13), (.45*wd), (.2632*ht));
ellipse(x+(.55*wd)+(wd*.225), y+(.3026*ht)+(ht*.13), (.45*wd), (.2632*ht));

  //pointplotting 
  //strokeWeight(5);
  //stroke(240, 143, 143);
  //point(x-(.1125*wd), (y+115)+(.1974*ht)); //controlpoint
  
  //stroke(121, 122, 160);
  //point(x, (y+115)+(.1316*ht));
  //point(x+(.1575*wd), (y+115)+(.0658*ht));
  //point(x+(.3375*wd), (y+115)+(.0263*ht));
  //point(x+(.225*wd), (y+115)+(.1184*ht));
  //point(x+(.045*wd), (y+115)+(.2026*ht));
  
  //strokeWeight(5);
  //stroke(240, 143, 143);
  //point(x-(.1125*wd), (y+115)+(.2632*ht)); //controlpoint


strokeWeight(1);
stroke(225, 225, 225);

beginShape();
curveVertex(x-(.1125*wd), y+(.3026*ht)+(.1974*ht)); //controlpoint

curveVertex(x, y+(.3026*ht)+(.1316*ht));
curveVertex(x+(.1575*wd), y+(.3026*ht)+(.0658*ht));
curveVertex(x+(.3375*wd), y+(.3026*ht)+(.0263*ht));
curveVertex(x+(.225*wd), y+(.3026*ht)+(.1184*ht));
curveVertex(x+(.045*wd), y+(.3026*ht)+(.2026*ht));

curveVertex(x-(.1125*wd), y+(.3026*ht)+(.2632*ht)); //controlpoint

endShape();

  //pointplotting
  //strokeWeight(5);
  //stroke(240, 143, 143);
  //point((x+110)-(.1125*wd), (y+115)+(.1974*ht)); //controlpoint
  
  //stroke(121, 122, 160);
  //point(x+110, (y+115)+(.1316*ht));
  //point((x+110)+(.1575*wd), (y+115)+(.0658*ht));
  //point((x+110)+(.3375*wd), (y+115)+(.0263*ht));
  //point((x+110)+(.225*wd), (y+115)+(.1184*ht));
  //point((x+110)+(.045*wd), (y+115)+(.2026*ht));
  
  //strokeWeight(5);
  //stroke(240, 143, 143);
  //point((x+110)-(.1125*wd), (y+115)+(.2632*ht)); //controlpoint
  
strokeWeight(1);
stroke(225, 225, 225);

beginShape();
curveVertex(x+(.55*wd)-(.1125*wd), y+(.3026*ht)+(.1974*ht)); //controlpoint

curveVertex(x+(.55*wd), y+(.3026*ht)+(.1316*ht));
curveVertex(x+(.55*wd)+(.1575*wd), y+(.3026*ht)+(.0658*ht));
curveVertex(x+(.55*wd)+(.3375*wd), y+(.3026*ht)+(.0263*ht));
curveVertex(x+(.55*wd)+(.225*wd), y+(.3026*ht)+(.1184*ht));
curveVertex(x+(.55*wd)+(.045*wd), y+(.3026*ht)+(.2026*ht));

curveVertex(x+(.55*wd)-(.1125*wd), y+(.3026*ht)+(.2632*ht)); //controlpoint

endShape();

strokeWeight(3);
stroke(240, 143, 143);
point(x+(.5*wd), y+(ht*.44) );
arc( x+(.5*wd), y+(ht*.44), (.1*wd), (.1*wd), PI, TWO_PI );

//initials
ellipseMode(CENTER);
stroke(225, 225, 225);
strokeWeight(1);
fill(240, 143, 143, 70);
ellipse(x+(wd*.225), y+(.3026*ht)+(ht*.13), (.35*wd), (.35*wd));
ellipse(x+(.55*wd)+(wd*.225), y+(.3026*ht)+(ht*.13), (.35*wd), (.35*wd));

noFill();
strokeWeight(5);
stroke(240, 143, 143);
  //pointplotting
  //point( x+(wd*.225), y+(.3026*ht)+(ht*.13) ); //controlpoint
  
  //point( x+(wd*.28), y+(.3026*ht)+(ht*.1) );
  //point( x+(wd*.3), y+(.3026*ht)+(ht*.05) );
  //point( x+(wd*.225), y+(.3026*ht)+(ht*.04) );
  //point( x+(wd*.15), y+(.3026*ht)+(ht*.1) );
  //point( x+(wd*.08), y+(.3026*ht)+(ht*.18) );
  //point( x+(wd*.225), y+(.3026*ht)+(ht*.16) );
  //point( x+(wd*.35), y+(.3026*ht)+(ht*.18) );
  
  //point( x+(wd*.45), y+(.3026*ht)+(ht*.2) ); //controlpoint

strokeWeight(2); 
stroke(112, 114, 170);
beginShape();
curveVertex( x+(wd*.225), y+(.3026*ht)+(ht*.13) ); //controlpoint

curveVertex( x+(wd*.28), y+(.3026*ht)+(ht*.1) );
curveVertex( x+(wd*.3), y+(.3026*ht)+(ht*.05) );
curveVertex( x+(wd*.225), y+(.3026*ht)+(ht*.04) );
curveVertex( x+(wd*.15), y+(.3026*ht)+(ht*.1) );
curveVertex( x+(wd*.08), y+(.3026*ht)+(ht*.18) );
curveVertex( x+(wd*.225), y+(.3026*ht)+(ht*.16) );
curveVertex( x+(wd*.35), y+(.3026*ht)+(ht*.18) );

curveVertex( x+(wd*.45), y+(.3026*ht)+(ht*.2) ); //controlpoint
endShape();

  //pointplotting
  //strokeWeight(5);
  //point( x+(.55*wd)+(wd*.08), y+(.3026*ht)+(ht*.1) ); //controlpoint
  
  //point( x+(.55*wd)+(wd*.1), y+(.3026*ht)+(ht*.07) );
  //point( x+(.55*wd)+(wd*.225), y+(.3026*ht)+(ht*.04) );
  //point( x+(.55*wd)+(wd*.35), y+(.3026*ht)+(ht*.07) );
  
  //point( x+(.55*wd)+(wd*.38), y+(.3026*ht)+(ht*.1) ); //controlpoint
  
strokeWeight(2);
stroke(12, 83, 95);
beginShape();
curveVertex( x+(.55*wd)+(wd*.08), y+(.3026*ht)+(ht*.1) ); //controlpoint

curveVertex( x+(.55*wd)+(wd*.1), y+(.3026*ht)+(ht*.07) );
curveVertex( x+(.55*wd)+(wd*.225), y+(.3026*ht)+(ht*.04) );
curveVertex( x+(.55*wd)+(wd*.35), y+(.3026*ht)+(ht*.07) );

curveVertex( x+(.55*wd)+(wd*.38), y+(.3026*ht)+(ht*.1) ); //controlpoint
endShape();

line( x+(.55*wd)+(wd*.225), y+(.3026*ht)+(ht*.04),  x+(.55*wd)+(wd*.225), y+(.3026*ht)+(ht*.22) );

//nose
noFill();
strokeWeight(2);
stroke(225, 225, 225);

//rect(x+(.225*wd), y+(.5658*ht), wd-(.45*wd), ht-(.8947*ht) );

  //pointplotting
  strokeWeight(5);
  //stroke(240, 143, 143);
  //point((x+45)+(.6875*wd), (y+215)+(.0263*ht)); //controlpoint
  
  //stroke(121, 122, 160);
  point((x+45)+(.1375*wd), (y+215)+(.0894*ht));
  //point((x+45), (y+215)+(.0526*ht));
  //point((x+45)+(.1375*wd), (y+215));
  
  //point((x+45)+(.275*wd), (y+215)+(.1053*ht));
  
  //point((x+45)+(.4125*wd), (y+215));
  //point((x+45)+(.55*wd), (y+215)+(.0526*ht));
  point((x+45)+(.4125*wd), (y+215)+(.0894*ht));

  //strokeWeight(5);
  //stroke(240, 143, 143);
  //point((x+45)-(.1375*wd), (y+215)+(.0263*ht)); //controlpoint

strokeWeight(2);
stroke(225, 225, 225);

beginShape();
curveVertex(x+(.225*wd)+(.6875*wd),  y+(.5658*ht)+(.0263*ht)); //controlpoint

curveVertex(x+(.225*wd)+(.1375*wd),  y+(.5658*ht)+(.0894*ht));
curveVertex(x+(.225*wd),  y+(.5658*ht)+(.0526*ht));
curveVertex(x+(.225*wd)+(.1375*wd),  y+(.5658*ht));
curveVertex(x+(.225*wd)+(.275*wd),  y+(.5658*ht)+(.1053*ht));
curveVertex(x+(.225*wd)+(.4125*wd),  y+(.5658*ht));
curveVertex(x+(.225*wd)+(.55*wd),  y+(.5658*ht)+(.0526*ht));
curveVertex(x+(.225*wd)+(.4125*wd),  y+(.5658*ht)+(.0894*ht));

curveVertex(x+(.225*wd)-(.1375*wd),  y+(.5658*ht)+(.0263*ht)); //controlpoint

endShape();

//moustache
//rect(x+20, y+255, wd-40, ht-320);
//rect(x+(.1*wd), y+(.67105*ht), .8*wd, .1579*ht );

  //pointplotting
  //strokeWeight(5);
  //stroke(240, 143, 143);
  //point( (x+20)+(.75*(wd-40)), (y+255)+(.2*(ht-320)) ); //controlpoint
  
  //stroke(121, 122, 160);
  //point( (x+20)+(.5*(wd-40)), (y+255)+(.5*(ht-320)) );
 
  //point(x+20, (y+255)+(ht-320));
  point( (x+20)+(.25*(wd-40)), (y+225)+(.75*(ht-320)) );
  
  //point( (x+20)+(.5*(wd-40)), y+255);
  
  //point( (x+20)+(.75*(wd-40)), (y+255)+(.25*(ht-320)) );
  //point( (x+20)+(wd-40), (y+255)+(ht-320) );
  
  //strokeWeight(5);
  //stroke(240, 143, 143);
  //point( (x+20)+(.25*(wd-40)), (y+255)+(.2*(ht-320)) ); //controlpoint

strokeWeight(2);
stroke(225, 225, 225);
fill(240, 143, 143, 70);
beginShape();
curveVertex( x+(.1*wd)+(.25*(.8*wd)), y+(.67105*ht)+(.2*(.1579*ht)) ); //controlpoint

curveVertex( x+(.1*wd)+(.5*(.8*wd)), y+(.67105*ht)+(.5*(.1579*ht)) );
curveVertex( x+(.1*wd), y+(.67105*ht)+(.1579*ht));

curveVertex( (x+20)+(.25*(wd-40)), (y+225)+(.75*(ht-320)) );
//curveVertex( x+(.1*wd)+(.25*(.8*wd)), y+(.67105*ht)+(.75*(.1579*ht)) );

curveVertex( x+(.1*wd)+(.5*(.8*wd)), y+(.67105*ht));
curveVertex( x+(.1*wd)+(.75*(.8*wd)), y+(.67105*ht)+(.25*(.1579*ht)) );
curveVertex( x+(.1*wd)+(.8*wd), y+(.67105*ht)+(.1579*ht) );
curveVertex( x+(.1*wd)+(.5*(.8*wd)), y+(.67105*ht)+(.5*(.1579*ht)) );

curveVertex( x+(.1*wd)+(.75*(.8*wd)), y+(.67105*ht)+(.2*(.1579*ht)) ); //controlpoint
endShape();

//eyebrows
stroke(255, 228, 228);
fill(225, 225, 225);
triangle( x, y+(.25*ht), x+(.45*wd), y+(.25*ht), x+(.1*wd), y+(.2*ht) );
triangle( x+(.6*wd), y+(.3*ht), x+wd, y+(.3*ht), x+(.9*wd), y+(.25*ht) );

saveFrame("hw2.jpg");


