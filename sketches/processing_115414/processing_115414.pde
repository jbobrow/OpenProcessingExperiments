
//A cimple class to draw shapes on a PGraphics

static class Shape 
{  
    static final PVector triangleLUT[] = new PVector[] {new PVector(cos(TWO_PI/3), sin(TWO_PI/3)), new PVector(cos(.666 * TWO_PI), sin(.666 * TWO_PI)), new PVector(cos(TWO_PI), sin(TWO_PI))}; 
  
    static void drawTriangle(PGraphics canvas, int x, int y, int c, int r)
    {   
        if (x<0 || x>canvas.width || y<0 || y > canvas.height) return;
        canvas.beginDraw();
        canvas.fill(c);
        canvas.beginShape();
          for (int i = 0; i < 3; i++) canvas.vertex(x + triangleLUT[i].x * r, y + triangleLUT[i].y * r);     
        canvas.endShape(CLOSE);
        canvas.endDraw();
    }
}

