
/**********************************************************************/
/* adapted slightly from                                              */
/* http://www.geocomputing.co.uk/getpage.php?type=page&page=scene3d   */
/* to not stall in processing 2 on desktop running in Java mode       */
/* rlutz 06/24/2013                                                   */
/*                                               */
/* 3D Anaglyph in Processing, A Thomas, 2010     */
/*                                               */
/* This program is free software: you can        */
/* redistribute it and/or modify it under the    */
/* terms of the GNU General Public License       */
/* as published by the Free Software Foundation, */
/* either version 3 of the License, or (at your  */
/* option) any later version.                    */
/*                                               */
/* This program is distributed in the hope that  */
/* it will be useful, but WITHOUT ANY            */
/* WARRANTY; without even the implied            */
/* warranty of MERCHANTABILITY or FITNESS        */
/* FOR A PARTICULAR PURPOSE.  See the            */
/* GNU General Public License for more details.  */
/*                                               */
/* See http://www.gnu.org/licenses/ for full     */
/* details of licenses.                          */
/*************************************************/



float xang=0;
float zang=0;
//float yoffset=500;
float yoffset=515;
float zoffset=0;
float fps=20;
float eyemove=1;
PGraphics left,right;

PImage redimg;
PImage cyanimg;

void setup()
{
  size(500,500,P3D);
  left=createGraphics(width,height,P3D);
  right=createGraphics(width,height,P3D);
  
  // add the following two images to be used as red/cyan masks
  redimg = createImage(500, 500, RGB);
  cyanimg = createImage(500, 500, RGB);
  redimg.loadPixels();
  cyanimg.loadPixels();
  for (int i = 0; i < redimg.pixels.length; i++) {
    redimg.pixels[i] = color(255, 0, 0); 
    cyanimg.pixels[i] = color(0, 255, 255);
  }
  redimg.updatePixels();
  cyanimg.updatePixels();
  
  frameRate(fps);
  noStroke();
  fill(204, 204);
}

void keyPressed()
{
  if(keyCode == UP && eyemove<2.5) eyemove+=0.1;
  if(keyCode == DOWN && eyemove>0) eyemove-=0.1;
}

void scene(PGraphics pg,float em)
{
  pg.beginDraw();
  pg.camera((width/2.0)+em, height/2.0, (height/2.0) / tan(PI*60.0 / 360.0), width/2.0, height/2.0, yoffset, 0, -1, 0);
  pg.lights();
  pg.background(255,255,255);
  pg.strokeWeight(2);
  pg.translate(width/2,height/2);
  pg.pushMatrix();
  pg.translate(0,zoffset,yoffset);
  pg.rotateY(xang);
  pg.rotateZ(zang);
  pg.stroke(0,0,0);
  pg.fill(200,200,200);
  pg.box(25,25,25);
  pg.box(80,5,5);
  pg.box(5,80,5);
  pg.box(5,5,80);
  pg.popMatrix();
  pg.pushMatrix();
  pg.translate(0,zoffset,yoffset);
  pg.rotateY(2*PI-xang);
  pg.rotateZ(2*PI-zang);
  pg.stroke(0,0,0);
  pg.strokeWeight(3);
  pg.noFill();
  pg.scale(1,1,1);
  pg.box(45,45,45);
  pg.popMatrix();
  pg.endDraw();
}

void draw()
{
  color lc,rc,nc;
  int vv,hh;
  scene(left,-eyemove);
  scene(right,eyemove);
  
  // following nested for loops in original code
  //for(hh=1; hh<=left.width; hh++) // these loops consumed my CPU (2.3GHz Intel i5 MacBook Pro)
  //{                               //
  //  for(vv=1; vv<=left.height; vv++)
  //  {
  //    lc=left.get(hh,vv);
  //    rc=right.get(hh,vv);
  //    nc=color(red(lc),green(rc),blue(rc));
  //    right.set(hh,vv,nc);
  //  }
  //}
  //image(right,0,0);

  // following red/cyan masks ok for desktop java
  PImage r = right.get();
  r.blend(redimg, 0, 0, 500, 500, 0, 0, 500, 500, SUBTRACT);
  PImage l = left.get();
  l.blend(cyanimg, 0, 0, 500, 500, 0, 0, 500, 500, SUBTRACT);
  
  image(r,0,0);
  blend(l, 0, 0, 500, 500, 0, 0, 500, 500, ADD);
  
  zang+=0.01;
  if(zang>PI*2) zang=zang-PI*2;
  xang+=0.01;
  if(xang>PI*2) xang=xang-PI*2;
}





