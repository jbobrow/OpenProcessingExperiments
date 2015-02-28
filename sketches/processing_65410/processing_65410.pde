
/*
© 2012 Luis Correia

The nine block is a common design pattern among quilters.
It's construction methods and primitive building shapes are simple,
yet produce millions of interesting variations.

Individual blocks are composed of shapes in a 3x3 grid, from a set
of 16 primitive shapes or more.

Blocks are radially symmetric, so the shape and rotation for only
three grid cells need be specified. These three cells are the
center, the edge, and the corner. All other cells can be derived
from these three.

Based on the Adobe Flash® program made by Jared Tarbell:

http://www.complexification.net/gallery/machines/nineblock/
*/
import processing.pdf.*;

int i, in, j, mg, nsh, r, sh;
PImage shapes;
PGraphics pg;
boolean bw=true, bk=true, neg=true;

void setup() {
  //size((16*3+16)*3*3, (16*3+16)*3*3, P2D);
  size(576, 576, P2D);
  shapes=loadImage("shapes.png");
  //shapes=loadImage("shapes1.png");
  sh=shapes.height-1;
  if((shapes.width-1)%sh!=0) {
    exit();  // exit program because size of shapes bitmap is invalid!
  }
  nsh=(shapes.width-1)/sh;
  mg=sh/2;
  in=sh;
  pg=createGraphics((sh*3+in)*3*3, (sh*3+in)*3*4, P2D);
  //pg=createGraphics((sh*3+in)*3*10, (sh*3+in)*3*6, P2D);
  draw_blocks();
}

void draw() {
  image(pg, 0, 0);
}

void mousePressed() {
  draw_blocks();
}

void keyPressed() {
  switch(key) {
    case 'b':
    case 'B':
      bk=!bk;
      draw_blocks();
      break;
    case 'c':
    case 'C':
      bw=!bw;
      draw_blocks();
      break;
    case 'n':
    case 'N':
      neg=!neg;
      draw_blocks();
      break;
    case 'p':
    case 'P':
      PGraphics pdf=createGraphics(pg.width, pg.height, PDF, "nine_block.pdf");
      pdf.beginDraw();
      pdf.image(pg, 0, 0);
      pdf.dispose();
      pdf.endDraw();
      break;
    case 's':
    case 'S':
      pg.save("nine_block.png");
      break;
    default:
      draw_blocks();
  }
}

void draw_blocks() {
  color c;
  PImage img=createImage(sh*3, sh*3, RGB);
  pg.beginDraw();
  if(bw) {
    pg.background(255);
  }
  else {
    c=color(int(random(256)), int(random(256)), int(random(256)));
    pg.background(c);
  }
  pg.noStroke();
  for(i=0; i<pg.width/(sh*3+in); i++) {
    for(j=0; j<pg.height/(sh*3+in); j++) {
      if(bw) {
        draw_nine_block(pg, i*(sh*3+in)+mg, j*(sh*3+in)+mg, int(random(4)), int(random(4)), int(random(nsh)), int(random(nsh)), int(random(nsh/4)));
      }
      else {
        draw_nine_block(img, 0, 0, int(random(4)), int(random(4)), int(random(nsh)), int(random(nsh)), int(random(nsh/4)));
        c=color(int(random(256)), int(random(256)), int(random(256)), 128+int(random(127)));
        if(bk) {
          if(neg) {
            pg.fill(color(255-red(c), 255-green(c), 255-blue(c), alpha(c)));
          }
          else {
            pg.fill(c);
          }
          pg.rect(i*(sh*3+in), j*(sh*3+in), sh*3+in, sh*3+in);
        }
        pg.tint(c);
        pg.image(img, i*(sh*3+in)+mg, j*(sh*3+in)+mg);
      }
    }
  }
  pg.endDraw();
}

void draw_nine_block(PImage a, int x, int y, int edge_rot, int corner_rot, int edge_shape, int corner_shape, int center_shape) {
  int n, x1, y1;
  PImage tmp=createImage(shapes.height, shapes.height, RGB);
  tmp.copy(shapes, edge_shape*sh, 0, shapes.height, shapes.height, 0, 0, tmp.width, tmp.height);
  if(edge_shape%4!=0) {
    rotate_image(tmp, edge_rot);
  }
  for(n=0; n<4; n++) {
    if(n==0) {
      x1=0;
      y1=tmp.height-1;
    }
    else {
      if(n==1) {
        x1=tmp.width-1;
        y1=0;
      }
      else {
        if(n==2) {
          x1=tmp.width*2-2;
          y1=tmp.height-1;
        }
        else {
          x1=tmp.width-1;
          y1=tmp.height*2-2;
        }
      }
    }
    a.copy(tmp, 0, 0, tmp.width, tmp.height, x+x1, y+y1, tmp.width, tmp.height);
    if(edge_shape%4!=0) {
      rotate_image(tmp, 1);
    }
  }
  tmp.copy(shapes, corner_shape*sh, 0, shapes.height, shapes.height, 0, 0, tmp.width, tmp.height);
  if(corner_shape%4!=0) {
    rotate_image(tmp, corner_rot);
  }
  for(n=0; n<4; n++) {
    if(n==0) {
      x1=0;
      y1=0;
    }
    else {
      if(n==1) {
        x1=tmp.width*2-2;
        y1=0;
      }
      else {
        if(n==2) {
          x1=tmp.width*2-2;
          y1=tmp.height*2-2;
        }
        else {
          x1=0;
          y1=tmp.height*2-2;
        }
      }
    }
    a.copy(tmp, 0, 0, tmp.width, tmp.height, x+x1, y+y1, tmp.width, tmp.height);
    if(corner_shape%4!=0) {
      rotate_image(tmp, 1);
    }
  }
  a.copy(shapes, center_shape*4*sh, 0, shapes.height, shapes.height, x+shapes.height-1, y+shapes.height-1, shapes.height, shapes.height);
}

void rotate_image(PImage b, int rot) {
  if(rot<1 || rot>3 || b.width != b.height) {
    return;
  }
  PImage tmp=createImage(b.width, b.height, RGB);
  tmp.loadPixels();
  color c;
  for(int i=0; i<b.width; i++) {
    for(int j=0; j<b.height; j++) {
      if(rot==3) {
        c=b.pixels[j*b.width+i];
      }
      else {
        if(rot==2) {
          c=b.pixels[(b.width-1-i)*b.width+j];
        }
        else {
          c=b.pixels[(b.width-1-j)*b.width+i];
        }
      }
      tmp.pixels[i*b.width+j]=c;
    }
  }
  tmp.updatePixels();
  b.copy(tmp, 0, 0, tmp.width, tmp.height, 0, 0, b.width, b.height);
}


