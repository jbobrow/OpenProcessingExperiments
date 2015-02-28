
void setup() {
  size(800,300);
  smooth();
}

void draw() {
  println("the mouseX=" +mouseX);
  println("the mouseY=" +mouseY);

  {
    if(mousePressed == true) {   //al mover el curso y apretar click, desprenden los globos.
      noCursor();
    } 
    else {
      cursor(HAND);
    }
  }

  background(50,92,128); //COLOR DEL CIELO

  //NUBE 1 (LA MAS GRANDE)
  noStroke();
  fill(245,245,245);
  ellipse(nube1a,nube1b,200,50);
  ellipse(nube1c,nube1d,200,50);
  ellipse(nube1g,nube1h,130,30);
  ellipse(nube1e,nube1f,145,50);

  //NUBE 2
  fill(245,245,245);
  ellipse(nube2a,nube2b,75,30);
  ellipse(nube2c,nube2d,100,40);
  ellipse(nube2e,nube2f,65,50);

  //NUBE 3
  ellipse(nube3a,nube3b,70,25);
  ellipse(nube3c,nube3d,90,20);
  ellipse(nube3e,nube3f,50,50); 

  //MOVIMIENTO DE LAS NUBES
  nube1a = nube1a - speedX;     
  nube1c = nube1c - speedX;
  nube1e = nube1e - speedX;
  nube1g = nube1g - speedX;

  nube2a = nube2a - speedX;
  nube2c = nube2c - speedX;
  nube2e = nube2e - speedX;

  nube3a = nube3a - speedX;
  nube3c = nube3c - speedX;
  nube3e = nube3e - speedX;

  if((nube1e+90) < 0)     
  {
    nube1a = nube1a+width+200;
    nube1c += width+200;
    nube1e += width+200;
    nube1g += width+200;
  }

  if((nube2a+37.5) < 0)     
  {
    nube2a += width+200;
    nube2c += width+200;
    nube2e += width+200;
  }

  if((nube3a+35) < 0)     
  {
    nube3a += width+200;
    nube3c += width+200;
    nube3e += width+200;
  }


  //AVIONCITO DE PAPEL
  noFill();
  fill(211,211,211);
  noStroke();
  triangle(mouseX-115,mouseY+6,mouseX,mouseY,mouseX-118,mouseY);
  triangle(mouseX-107,mouseY+25,mouseX,mouseY,mouseX-100,mouseY+37);
  noFill();
  fill(255,255,240);
  triangle(mouseX-122,mouseY-23,mouseX,mouseY,mouseX-118,mouseY);
  triangle(mouseX-119,mouseY+5, mouseX,mouseY,mouseX-131,mouseY+32);


  //Globos kaboom
  noFill();
  stroke(105,105,105);
  strokeWeight(1);
  bezier(b1string1, b1string2, b1string3+random(-3,3), b1string4+random(-3,3), b1string5, b1string6, b1string7, b1string8);
  bezier(b2string1, b2string2, b2string3+random(-3,3), b2string4+random(-3,3), b2string5, b2string6, b2string7, b2string8);
  bezier(b3string1, b3string2, b3string3+random(-3,3), b3string4+random(-3,3), b3string5, b3string6, b3string7, b3string8);


  //GLOBOS
  noFill();
  noStroke();
  fill(182,42,42);
  bezier(globos1x,globos1y,globos1a+random(-4,4),globos1b,globos1c+random(-2,2),globos1d,globos1x,globos1y);
  triangle(b1triangle1x,b1triangle1y,b1triangle2x,b1triangle2y,b1triangle3x,b1triangle3y);

  noFill();
  noStroke();
  fill(229,93,2);
  bezier(globos2x,globos2y,globos2a+random(-2,2),globos2b,globos2c+random(-2,2),globos2d,globos2x,globos2y);
  triangle(b2triangle1x,b2triangle1y,b2triangle2x,b2triangle2y,b2triangle3x,b2triangle3y);

  noFill();
  noStroke();
  fill(240,224,52);
  bezier(globos3x,globos3y,globos3a+random(-2,2),globos3b,globos3c+random(-2,2),globos3d,globos3x,globos3y);  
  triangle(b3triangle1x,b3triangle1y,b3triangle2x,b3triangle2y,b3triangle3x,b3triangle3y);


  

