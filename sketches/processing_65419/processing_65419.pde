
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65410*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
/*
© 2012 Luis Correia

The nine block is a common design pattern among quilters.
It's construction methods and primitive building shapes are simple,
yet produce millions of interesting variations.

Individual blocks are composed of shapes in a 3x3 grid, from a set
of 16 primitive shapes.

Blocks are radially symmetric, so the shape and rotation for only
three grid cells need be specified. These three cells are the
center, the edge, and the corner. All other cells can be derived
from these three.

Based on the Adobe Flash® program made by Jared Tarbell:

http://www.complexification.net/gallery/machines/nineblock/

*/
int i, j, r;
PImage shapes;
PGraphics pg;

void setup() {
  size(460, 460);
  shapes=loadImage("shapes.png");
  pg=createGraphics(width, height, P2D);
  draw_blocks();
}

void draw() {
  image(pg, 0, 0);
  //if(mousePressed || keyPressed) {
    //if(key=='s' || key=='S') {
    //  save("nine_block.png");
    //}
    //else {
    //  draw_blocks();
    //}
  //}
}

void mousePressed() {
  draw_blocks();
}

void keyPressed() {
  //if(key=='s' || key=='S') {
  //  save("nine_block.png");
  //}
  //else {
      draw_blocks();
  //}
}

void draw_blocks() {
  pg.beginDraw();
  pg.background(255);
  for(i=0; i<width/(shapes.height)/3; i++) {
    for(j=0; j<height/(shapes.height)/3; j++) {
      draw_nine_block(pg, i*(shapes.height)*3+1, j*(shapes.height)*3+1, int(random(4)), int(random(4)), int(random(16)), int(random(16)), int(random(4)));
    }
  }
  pg.endDraw();
}

void draw_nine_block(PImage a, int x, int y, int edge_rot, int corner_rot, int edge_shape, int corner_shape, int center_shape) {
  int i, x1, y1;
  PImage tmp=createImage(shapes.height, shapes.height, RGB);
  tmp.copy(shapes, edge_shape*(shapes.height-1), 0, shapes.height, shapes.height, 0, 0, tmp.width, tmp.height);
  if(edge_shape%4!=0) {
    rotate_image(tmp, edge_rot);
  }
  for(i=0; i<4; i++) {
    if(i==0) {
      x1=0;
      y1=tmp.height-1;
    }
    else {
      if(i==1) {
        x1=tmp.width-1;
        y1=0;
      }
      else {
        if(i==2) {
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
  tmp.copy(shapes, corner_shape*(shapes.height-1), 0, shapes.height, shapes.height, 0, 0, tmp.width, tmp.height);
  if(corner_shape%4!=0) {
    rotate_image(tmp, corner_rot);
  }
  for(i=0; i<4; i++) {
    if(i==0) {
      x1=0;
      y1=0;
    }
    else {
      if(i==1) {
        x1=tmp.width*2-2;
        y1=0;
      }
      else {
        if(i==2) {
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
  a.copy(shapes, center_shape*4*(shapes.height-1), 0, shapes.height, shapes.height, x+shapes.height-1, y+shapes.height-1, shapes.height, shapes.height);
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


