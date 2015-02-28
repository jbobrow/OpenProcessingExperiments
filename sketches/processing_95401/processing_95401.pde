
//declaring variables
  float x=0.0;
  float y=0.0;
  float easing=0.04;
  
/*------------------------*/

void setup ( ) {
  println("setup");
  size(300,300);
  smooth();
  strokeWeight (0.5);
    
}

/*------------------------*/

void draw ( ) {

  background (230, 230, 230);
  
  float targetX=mouseX;
  x+=(targetX-x)*easing;
  float targetY=mouseY;
  y+=(targetY-y)*easing;

  float remapX=map(mouseX, 0,width,255,0);
  float remapY= map(mouseY,0,height,0,255);
  println("mouseX:"+mouseX + "mouseY:"+mouseY);
  
      /*------------------------*/
  
  if (mousePressed) {
    
  //1 
    int o = 20*mouseY/100;
    int p = 50*mouseX/100;
    noStroke();
    
  triangle (x-30-p-o,y-50,x-20-p-o,y-50,x-30-p-o,y-20);
  triangle (x-30,y-50-o+p,x,y-55-o+p,x-20,y-50-o+p);
  triangle (x-20+p,y-50,x+p,y-55,x+10+p,y-50);
  triangle (x-20,y-50+p,x-20,y-40+p,x-30,y-20+p);
  
  //5
  triangle (x-20-o, y-50, x-20-o, y-40, x-10-o, y-40);
  triangle (x-20, y-40-p-o, x-30, y-20-p-o, x-10, y-40-p-o);
  triangle (x-20-o, y-50-p, x-o, y-50-p, x-10-o, y-40-p);
  triangle (x, y-50-p, x-20, y-30-p, x, y-30-p);
  triangle (x-20+o, y-30, x-30+o, y-20, x-20+o, y-10);
  
//10
  triangle (x-20+p, y-30, x-10+p, y-20, x-20+p, y-10);
  triangle (x-20, y-30+p-o, x-10, y-30+p-o, x-10, y-20+p-o);
  triangle (x-10+p, y-30+p, x-10+p, y-20+p, x+p, y-30+p);
  triangle (x-o-o, y-50, x-o-o, y-30, x+10-o-o, y-40);
  triangle (x, y-50-p, x+20, y-50-p, x+20, y-40-p);
  
//15
  triangle (x-p-p, y-50, x+20-p-p, y-30, x+20-p-p, y-40);
  triangle (x+20, y-50+o, x+20, y-40+o, x+30, y-40+o);
  triangle (x+20+o, y-30, x+20+o, y-40, x+30+o, y-40);
  triangle (x+20-p, y-50-p, x+40-p, y-50-p, x+40-p, y-30-p);
  triangle (x+20+o+o, y-30+o+o, x+30+o+o, y-40+o+o, x+30+o+o, y-20+o+o);

//20
  triangle (x+30+o+p, y-40+o+p, x+40+o+p, y-30+o+p, x+30+o+p, y-20+o+p);
  triangle (x+40+o-p, y-40+o-p, x+50+o-p, y-30+o-p, x+40+o-p, y-30+o-p);
  triangle (x+10+p, y-40, x+10+p, y-20, x+30+p, y-20);
  triangle (x, y-30+p+p, x+10, y-40+p+p, x+10, y-30+p+p);
  quad (x-o, y-30-o, x-o, y-20-o, x+10-o, y-20-o, x+10-o, y-30-o);
  
//25
  triangle (x-o-o, y-30-o-o, x-10-o-o, y-20-o-o, x-o-o, y-o-o);
  triangle (x-10-o-p, y-20-o-p, x-10-o-p, y-o-p, x-o-p, y-o-p);
  triangle (x-10-p-p, y-20-p-p, x-10-p-p, y-p-p, x-20-p-p, y-10-p-p);
  triangle (x-20+o+o, y-10+o+o, x-10+o+o, y+20+o+o, x-10+o+o, y+o+o);
  triangle (x-20, y-10+o+o, x-13, y+10+o+o, x-30, y+o+o);
  
//30
  triangle (x-30-p, y, x-13-p, y+10, x-10-p, y+20);
  triangle (x-30, y-p, x-20, y+20-p, x-10, y+20-p);
  triangle (x-20, y+20-p-p, x-20, y+30-p-p, x-10, y+20-p-p);
  triangle (x-10+o+o, y, x-10+o+o, y+20, x+o+o, y+7);
  triangle (x, y+7+o+o, x-10, y+20+o+o, x, y+20+o+o);
  
//35
  triangle (x-10-p, y+20-p, x-p, y+20-p, x-p, y+30-p);
  triangle (x-10+o, y-p-p, x+o, y-p-p, x+20+o, y+20-p-p);
  triangle (x+10+o, y-20+o, x+20+o, y-20+o, x+o, y+o);
  triangle (x+20, y-20+o+o, x+20, y-10+o+o, x+10, y-10+o+o);
  triangle (x+10-o-o, y-10, x+20-o-o, y-10, x-o-o, y);
  
//37,38 repeat
  triangle (x, y-20-o-o-o-o, x+10, y-20-o-o-o-o, x+5, y-10-o-o-o-o);
  triangle (x-o-o, y-20-o-o, x+5-o-o, y-10-o-o, x-o-o, y-o-o);
  
//40
  triangle (x+p, y+p, x+20+p, y-10+p, x+30+p, y+p);
  triangle (x+20+p+o, y-20+p+o, x+30+p+o, y-10+p+o, x+20+p+o, y-10+p+o);
  triangle (x+20-p-o, y-10, x+30-p-o, y-10, x+30-p-o, y);
  triangle (x+20, y-20-p-o, x+30, y-20-p-o, x+40, y-p-o);
  triangle (x+30-p-o-p, y-10, x+30-p-o-p, y, x+40-p-o-p, y);
  
//45
  triangle (x+30+o, y-20+o, x+50+o, y+o, x+40+o, y+o);
  triangle (x+30+o+o, y-20+o+o, x+40+o+o, y-30+o+o, x+40+o+o, y-10+o+o);

  quad (x+40+o, y-30+o, x+40+o, y-20+o, x+50+o, y-15+o, x+50+o, y-20+o);
  triangle (x+50-p, y-20, x+40-p, y-30, x+50-p, y-30);
  quad (x+40, y-20-p, x+50, y-15-p, x+50, y-p, x+40, y-10-p);
//50
  triangle (x+50-p, y-15-p, x+55-p, y-10-p, x+50-p, y+20-p);
  triangle (x+o+p, y+o+p, x+20+o+p, y+o+p, x+20+o+p, y+20+o+p);
  triangle (x+20-o-p, y-o-p, x+25-o-p, y+10-o-p, x+20-o-p, y+20-o-p);
  triangle (x+20-o, y-o, x+30-o, y-o, x+25-o, y+10-o);
  triangle (x+20-o-o, y+20-o-o, x+30-o-o, y-o-o, x+40-o-o, y-o-o);
//55
  triangle (x+40+o+o, y+o+o, x+50+o+o, y+o+o, x+50+o+o, y+20+o+o);
  triangle (x+30-o-p, y+20-o-p, x+40-o-p, y-o-p, x+50-o-p, y+20-o-p);
  triangle (x+20, y+20+p, x+40, y+p, x+30, y+20+p);
  triangle (x+p+p+p, y+7, x+p+p+p, y+30, x+20+p+p+p, y+20);
  triangle (x+20, y+20-o, x+20, y+30-o, x, y+30-o);
  
//60
  triangle (x+20-o-o, y+20, x+30-o-o, y+20, x+20-o-o, y+30);
  triangle (x+20+p-o, y+30+p-o, x+30+p-o, y+20+p-o, x+40+p-o, y+30+p-o);
  triangle (x+30+p+p, y+20+p+p, x+50+p+p, y+20+p+p, x+40+p+p, y+30+p+p);
  triangle (x+40-o, y+30-o, x+50-o, y+20-o, x+50-o, y+35-o);
  triangle (x+20+o+o, y+30+o+o, x+20+o+o, y+35+o+o, x+o+o, y+30+o+o);
  }
  
  /*------------------------*/

else { 
 //1
    fill (200,40,0,remapX);
    stroke(255,255,255,remapX);
  triangle (x-30,y-50,x-20,y-50,x-30,y-20);
      fill (255,remapY,0);
  triangle (x-30,y-50,x,y-55,x-20,y-50);
    fill (200,40,0,remapX);
  triangle (x-20,y-50,x,y-55,x+10,y-50);
      fill (255,remapY,0);
  triangle (x-20,y-50,x-20,y-40,x-30,y-20);
//5
    fill (200,40,0,remapX);
  triangle (x-20, y-50, x-20, y-40, x-10, y-40);
       fill (255,remapY,0);
  triangle (x-20, y-40, x-30, y-20, x-10, y-40);
    fill (200,40,0,remapX);
  triangle (x-20, y-50, x, y-50, x-10, y-40);
   fill (255,remapY,0);
  triangle (x, y-50, x-20, y-30, x, y-30);
    fill (200,40,0,remapX);
  triangle (x-20, y-30, x-30, y-20, x-20, y-10);
//10
   fill (255,remapY,0);
  triangle (x-20, y-30, x-10, y-20, x-20, y-10);
    fill (200,40,0,remapX);
  triangle (x-20, y-30, x-10, y-30, x-10, y-20);
   fill (255,remapY,0);
  triangle (x-10, y-30, x-10, y-20, x, y-30);
    fill (200,40,0,remapX);
  triangle (x, y-50, x, y-30, x+10, y-40);
   fill (255,remapY,0);
  triangle (x, y-50, x+20, y-50, x+20, y-40);
//15
  fill (200,40,0,remapX);
  triangle (x, y-50, x+20, y-30, x+20, y-40);
   fill (255,remapY,0);
  triangle (x+20, y-50, x+20, y-40, x+30, y-40);
  fill (200,40,0,remapX);
  triangle (x+20, y-30, x+20, y-40, x+30, y-40);
   fill (255,remapY,0);
  triangle (x+20, y-50, x+40, y-50, x+40, y-30);
  fill (200,40,0,remapX);
  triangle (x+20, y-30, x+30, y-40, x+30, y-20);
//20
   fill (255,remapY,0);
  triangle (x+30, y-40, x+40, y-30, x+30, y-20);
  fill (200,40,0,remapX);
  triangle (x+40, y-40, x+50, y-30, x+40, y-30);
   fill (255,remapY,0);
  triangle (x+10, y-40, x+10, y-20, x+30, y-20);
  fill (200,40,0,remapX);
  triangle (x, y-30, x+10, y-40, x+10, y-30);
   fill (255,remapY,0);
  quad (x, y-30, x, y-20, x+10, y-20, x+10, y-30);
//25
  fill (200,40,0,remapX);
  triangle (x, y-30, x-10, y-20, x, y);
   fill (255,remapY,0);
  triangle (x-10, y-20, x-10, y, x, y);
  fill (200,40,0,remapX);
  triangle (x-10, y-20, x-10, y, x-20, y-10);
   fill (255,remapY,0);
  triangle (x-20, y-10, x-10, y+20, x-10, y);
  fill (200,40,0,remapX);
  triangle (x-20, y-10, x-13, y+10, x-30, y);
//30
   fill (255,remapY,0);
  triangle (x-30, y, x-13, y+10, x-10, y+20);
  fill (200,40,0,remapX);
  triangle (x-30, y, x-20, y+20, x-10, y+20);
   fill (255,remapY,0);
  triangle (x-20, y+20, x-20, y+30, x-10, y+20);
  fill (200,40,0,remapX);
  triangle (x-10, y, x-10, y+20, x, y+7);
   fill (255,remapY,0);
  triangle (x, y+7, x-10, y+20, x, y+20);
//35
  fill (200,40,0,remapX);
  triangle (x-10, y+20, x, y+20, x, y+30);
   fill (255,remapY,0);
  triangle (x-10, y, x, y, x+20, y+20);
  fill (200,40,0,remapX);
  triangle (x+10, y-20, x+20, y-20, x, y);
   fill (255,remapY,0);
  triangle (x+20, y-20, x+20, y-10, x+10, y-10);
  fill (200,40,0,remapX);
  triangle (x+10, y-10, x+20, y-10, x, y);
//37,38 repeat
   fill (255,remapY,0);
  triangle (x, y-20, x+10, y-20, x+5, y-10);
  fill (200,40,0,remapX);
  triangle (x, y-20, x+5, y-10, x, y);
//40
   fill (255,remapY,0);
  triangle (x, y, x+20, y-10, x+30, y);
  fill (200,40,0,remapX);
  triangle (x+20, y-20, x+30, y-10, x+20, y-10);
   fill (255,remapY,0);
  triangle (x+20, y-10, x+30, y-10, x+30, y);
  fill (200,40,0,remapX);
  triangle (x+20, y-20, x+30, y-20, x+40, y);
   fill (255,remapY,0);
  triangle (x+30, y-10, x+30, y, x+40, y);
//45
  fill (200,40,0,remapX);
  triangle (x+30, y-20, x+50, y, x+40, y);
   fill (255,remapY,0);
  triangle (x+30, y-20, x+40, y-30, x+40, y-10);
  fill (200,40,0,remapX);
  quad (x+40, y-30, x+40, y-20, x+50, y-15, x+50, y-20);
   fill (255,remapY,0);
  triangle (x+50, y-20, x+40, y-30, x+50, y-30);
  fill (200,40,0,remapX);
  quad (x+40, y-20, x+50, y-15, x+50, y, x+40, y-10);
//50
   fill (255,remapY,0);
  triangle (x+50, y-15, x+55, y-10, x+50, y+20);
  fill (200,40,0,remapX);
  triangle (x, y, x+20, y, x+20, y+20);
   fill (255,remapY,0);
  triangle (x+20, y, x+25, y+10, x+20, y+20);
  fill (200,40,0,remapX);
  triangle (x+20, y, x+30, y, x+25, y+10);
   fill (255,remapY,0);
  triangle (x+20, y+20, x+30, y, x+40, y);
//55
  fill (200,40,0,remapX);
  triangle (x+40, y, x+50, y, x+50, y+20);
   fill (255,remapY,0);
  triangle (x+30, y+20, x+40, y, x+50, y+20);
  fill (200,40,0,remapX);
  triangle (x+20, y+20, x+40, y, x+30, y+20);
   fill (255,remapY,0);
  triangle (x, y+7, x, y+30, x+20, y+20);
  fill (200,40,0,remapX);
  triangle (x+20, y+20, x+20, y+30, x, y+30);
//60
   fill (255,remapY,0);
  triangle (x+20, y+20, x+30, y+20, x+20, y+30);
  fill (200,40,0,remapX);
  triangle (x+20, y+30, x+30, y+20, x+40, y+30);
   fill (255,remapY,0);
  triangle (x+30, y+20, x+50, y+20, x+40, y+30);
  fill (200,40,0,remapX);
  triangle (x+40, y+30, x+50, y+20, x+50, y+35);
   fill (255,remapY,0);
  triangle (x+20, y+30, x+20, y+35, x, y+30);
  }
}


