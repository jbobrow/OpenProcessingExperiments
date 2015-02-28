

/**
 *
 * @author Noah Buddy
 */

/*
 *  Each of the shadeTri/Circ/Rect() methods find the relative position of the mouse and
 *    each point of the shape then finds the point on a line at the edge of the window:
 *    drawn from the mouse, through the tested point, and to the opposite side.
 *
 *  I took the long way going about this, beginning from trig functions and found that I only
 *    needed to use the method of finding the "Y intercept" from a line.
 *
 *  If you would like further explaination, please contact me: buddy.noah@gmail.com
 *
 */

//Just filled in some stuff to test
Rectangle[] area = { new Rectangle(10,10,20,500),
                 new Rectangle(30,10,700,20),
                 new Rectangle(30,500,600,20),
                 new Rectangle(710,30,20,480),

                 new Rectangle(250,280,20,20),
                 new Rectangle(290,280,20,20) };

Circle[] pillars = { new Circle(200,300,20),
                 new Circle(400,300,20),
                  new Circle(600,300,20),
                  new Circle(200,150,20),
                 new Circle(400,150,20),
                 new Circle(600,150,20) };

Triangle[] tris = { new Triangle(500,50, 510,70, 530,45) };



//A triangle. This was actually the hardest of the three basic shapes to get working just right
class Triangle {
  int posx1=0, posx2=0, posx3=0;
  int posy1=0, posy2=0, posy3=0;

  Triangle(int x1, int y1, int x2, int y2, int x3, int y3) {
    posx1=x1;
    posx2=x2;
    posx3=x3;

    posy1=y1;
    posy2=y2;
    posy3=y3;
  }

  //Called from within a begin- endShape() block during draw()
  public void show() {
    //triangle(posx1, posy1, posx2, posy2, posx3, posy3);
    vertex(posx1, posy1);
    vertex(posx2, posy2);
    vertex(posx3, posy3);
  }

}


//Does not work with ovals.
class Circle {
  int posx=0, posy=0;
  int radius = 1;

  Circle(int x, int y, int rad) {
    radius = rad;
    posx = x;
    posy = y;
  }

  //DO NOT call inside of a begin- endShape() block
  public void show() {
    ellipse(posx, posy, 2*radius, 2*radius);
  }
}

//Your basic rectangle
class Rectangle {
  int top = 425; //just some defaults
  int left = 300;
  int wid = 100;
  int hi = 210;

  Rectangle() {}

  Rectangle(int L, int T, int W, int H) {
    top = T;
    left = L;
    wid = W;
    hi = H;

  }

  //Called from within a begin- endShape() block during draw()
  public void show() {
      vertex(left,      top);
      vertex(left+wid,  top);
      vertex(left+wid,  top+hi);
      vertex(left,      top+hi);
  }

}

public void setup() {
  size(800,600,P3D); //OPENGL is highly recommended if you add more shapes

  //I tried to reduce calculations here
  hint(DISABLE_DEPTH_TEST);
  hint(DISABLE_OPENGL_2X_SMOOTH);
  noSmooth();


  //I have tested this with over 1000 objects. Speed was OK but not great.

  //Fill in a bunch of objects
  pillars = new Circle[200];
  for (int i=0; i<pillars.length; i++) {
    pillars[i] = new Circle( (int)random(width), (int)random(height), 10+(int)random(10) );
  }
  area = new Rectangle[200];
  for (int i=0; i<area.length; i++) {
    area[i] = new Rectangle( (int)random(width), (int)random(height), 10+(int)random(10), 10+(int)random(10));
  }

  tris = new Triangle[200];
  for (int i=0; i<tris.length; i++) {
    int tx = (int)random(width);
    int ty = (int)random(height);
    tris[i] = new Triangle( tx-(int)random(10), ty-(int)random(10),
                            tx-(int)random(10), ty+(int)random(10),
                            tx+(int)random(10), ty+(int)random(10));
  }

  ellipseMode(CENTER);
  noStroke();
  
  //Update on user input of mouse
  noLoop();
}


public void mouseMoved() {
  redraw();
}


public void draw() {
  background(255);

  //all shadows are drawn as QUADS, so this should speed things up... I think

  //Why use three for() loops? CPU's like doing the same thing over and again as
  //    they can cache code. In this case, the data is accessed sequentially
  //    instead of switching between arrays.
  //Does it make it faster? In theory...
  //
  

  //Shadows
  //Each object contains a show() method that adds vertecies to the renderer.
  fill(0);
  beginShape(QUADS);
      for (int i=0; i<area.length; i++) {
        shadeRect(area[i]);
      }
  
      for (int i=0; i<pillars.length; i++) {
        shadeCirc(pillars[i]);
      }
  
      for (int i=0; i<tris.length; i++) {
        shadeTri(tris[i]);
      }
  endShape();


  //COLORS!
  fill(64,64,128);


  beginShape(QUADS);
      for (int i=0; i<area.length; i++) {
        area[i].show();
      }
  endShape(CLOSE);

  //Not vertex based, do not use beginShape(), etc.
  //  could be replaced with circles built from triangles
  for (int i=0; i<pillars.length; i++) {
    pillars[i].show();
  }

  beginShape(TRIANGLES);
    for (int i=0; i<tris.length; i++) {
      tris[i].show();
    }
  endShape(CLOSE);

}



public void shadeCirc(Circle c) {

  //get two points on outside of circle draw lines from there
  int mex = mouseX;
  int mey = mouseY;


  float dx = mouseX - c.posx;
  float dy = mouseY - c.posy;


  PVector v = new PVector(dx, dy);
  PVector reference = new PVector(0, c.radius);

  float ang = PVector.angleBetween(v, reference);

  PVector rightangh = new PVector(cos(ang), sin(ang));
  PVector rightangl = rightangh.get();


  rightangl.mult(-c.radius);
  rightangh.mult(c.radius);

  int px1 = 0;
  int px2 = 0;
  int py1 = 0;
  int py2 = 0;

  if (dx > 0) {
    px1 = (int)(c.posx + rightangh.x);
    px2 = (int)(c.posx + rightangl.x);
    py1 = (int)(c.posy - rightangh.y);
    py2 = (int)(c.posy - rightangl.y);

  } else {
    px1 = (int)(c.posx + rightangh.x);
    px2 = (int)(c.posx + rightangl.x);
    py1 = (int)(c.posy + rightangh.y);
    py2 = (int)(c.posy + rightangl.y);

  }


   int[][] shadow = null;

   int n1dx = (int)px1 - mex;
   int n1dy = (int)py1 - mey;
   int n2dx = px2 - mex;
   int n2dy = py2 - mey;


   if ( (n1dx > 0) && (n2dx > 0) ) { //mouse on left


      float n1ratz = (float)n1dy / n1dx;
      int n1dw = width - px1;
      int n1rangey = py1+(int)(n1dw*n1ratz);

      float n2ratz = (float)n2dy / n2dx;
      int n2dw = width - px2;
      int n2rangey = py2+(int)(n2dw*n2ratz);

      shadow = new int[][]{ {px1,    py1},
                            {px2,    py2},
                            {width, n1rangey},
                            {width, n2rangey}};

   } else if ( (n1dx < 0) && (n2dx < 0) ) { //mouse on right

      float n1ratz = (float)n1dy / n1dx;
      int n1dw = px1;
      int n1rangey = py1-(int)(n1dw*n1ratz);

      float n2ratz = (float)n2dy / n2dx;
      int n2dw = px2;
      int n2rangey = py2-(int)(n2dw*n2ratz);

      shadow = new int[][]{ {px1,    py1},
                            {px2,    py2},
                            {0, n1rangey},
                            {0, n2rangey}};

   } else if ( (n1dy > 0) && (n2dy > 0) ) { //mouse on top

      float n1ratz = (float)n1dx / n1dy;
      int n1dh = height - py1;
      int n1rangex = px1+(int)(n1dh*n1ratz);

      float n2ratz = (float)n2dx / n2dy;
      int n2dh = height - py2;
      int n2rangex = px2+(int)(n2dh*n2ratz);

      shadow = new int[][]{ {px1,    py1},
                            {px2,    py2},
                            {n1rangex, height},
                            {n2rangex, height} };


   } else if ( (n1dy < 0) && (n2dy < 0) ) { //mouse on bottom

       float n1ratz = (float)n1dx / n1dy;
      int n1dh = py1;
      int n1rangex = px1-(int)(n1dh*n1ratz);

      float n2ratz = (float)n2dx / n2dy;
      int n2dh = py2;
      int n2rangex = px2-(int)(n2dh*n2ratz);

      shadow = new int[][]{ {px1,    py1},
                            {px2,    py2},
                            {n1rangex, 0},
                            {n2rangex, 0} };

   }

  //Draw the shadow
  if ( shadow != null) {
    vertex(shadow[0][0], shadow[0][1]);
    vertex(shadow[1][0], shadow[1][1]);
    vertex(shadow[3][0], shadow[3][1]);
    vertex(shadow[2][0], shadow[2][1]);
  }

}



public void shadeTri(Triangle t) {

   int mex = mouseX;
   int mey = mouseY;

   int[][] shadow1 = null;
   int[][] shadow2 = null;

   int n1dx = t.posx1 - mex;
   int n1dy = t.posy1 - mey;
   int n2dx = t.posx2 - mex;
   int n2dy = t.posy2 - mey;
   int n3dx = t.posx3 - mex;
   int n3dy = t.posy3 - mey;

   
   //
   //Use up/down/left/right box bounds to limit number PVector calculations
   //
   if ( (n1dx > 0) && (n2dx > 0) && (n3dx > 0) ) { //mouse on left

      float n1ratz = (float)n1dy / n1dx;
      int n1dw = width - t.posx1;
      int n1rangey = t.posy1+(int)(n1dw*n1ratz);

      float n2ratz = (float)n2dy / n2dx;
      int n2dw = width - t.posx2;
      int n2rangey = t.posy2+(int)(n2dw*n2ratz);

      float n3ratz = (float)n3dy / n3dx;
      int n3dw = width - t.posx3;
      int n3rangey = t.posy3+(int)(n3dw*n3ratz);

      shadow1 = new int[][]{ {t.posx1,    t.posy1},
                            {t.posx2,    t.posy2},
                            {width, n1rangey},
                            {width, n2rangey}};

      shadow2 = new int[][]{ {t.posx2,    t.posy2},
                            {t.posx3,    t.posy3},
                            {width, n2rangey},
                            {width, n3rangey}};

   } else if ( (n1dx < 0) && (n2dx < 0)  && (n3dx < 0)) { //mouse on right

      float n1ratz = (float)n1dy / n1dx;
      int n1dw = t.posx1;
      int n1rangey = t.posy1-(int)(n1dw*n1ratz);

      float n2ratz = (float)n2dy / n2dx;
      int n2dw = t.posx2;
      int n2rangey = t.posy2-(int)(n2dw*n2ratz);

      float n3ratz = (float)n3dy / n3dx;
      int n3dw = t.posx3;
      int n3rangey = t.posy3-(int)(n3dw*n3ratz);

      shadow1 = new int[][]{ {t.posx1,    t.posy1},
                            {t.posx2,    t.posy2},
                            {0, n1rangey},
                            {0, n2rangey}};

      shadow2 = new int[][]{ {t.posx2,    t.posy2},
                            {t.posx3,    t.posy3},
                            {0, n2rangey},
                            {0, n3rangey}};

   } else if ( (n1dy > 0) && (n2dy > 0) && (n3dy > 0)) { //mouse on top

      float n1ratz = (float)n1dx / n1dy;
      int n1dh = height - t.posy1;
      int n1rangex = t.posx1+(int)(n1dh*n1ratz);

      float n2ratz = (float)n2dx / n2dy;
      int n2dh = height - t.posy2;
      int n2rangex = t.posx2+(int)(n2dh*n2ratz);

      float n3ratz = (float)n3dx / n3dy;
      int n3dh = height - t.posy3;
      int n3rangex = t.posx3+(int)(n3dh*n3ratz);

      shadow1 = new int[][]{ {t.posx1,    t.posy1},
                            {t.posx2,    t.posy2},
                            {n1rangex, height},
                            {n2rangex, height} };

      shadow2 = new int[][]{ {t.posx2,    t.posy2},
                            {t.posx3,    t.posy3},
                            {n2rangex, height},
                            {n3rangex, height} };

   } else if ( (n1dy < 0) && (n2dy < 0) && (n3dy < 0) ) { //mouse on bottom

      float n1ratz = (float)n1dx / n1dy;
      int n1dh = t.posy1;
      int n1rangex = t.posx1-(int)(n1dh*n1ratz);

      float n2ratz = (float)n2dx / n2dy;
      int n2dh = t.posy2;
      int n2rangex = t.posx2-(int)(n2dh*n2ratz);

      float n3ratz = (float)n3dx / n3dy;
      int n3dh = t.posy3;
      int n3rangex = t.posx3-(int)(n3dh*n3ratz);

      shadow1 = new int[][]{ {t.posx1,    t.posy1},
                            {t.posx2,    t.posy2},
                            {n1rangex, 0},
                            {n2rangex, 0} };

      shadow2 = new int[][]{ {t.posx2,    t.posy2},
                            {t.posx3,    t.posy3},
                            {n2rangex, 0},
                            {n3rangex, 0} };


   } else {   //Within the rectangle bounds of the triangle

       //create PVectors for each point on tri and cast rays out to maxrange
       //Much simpler than prior calculations but at cost of object creation/calculation time
       //  only used on triangles that the mouse is next to
       int maxrange = (width > height) ? width : height;

       PVector dest1 = new PVector(n1dx, n1dy);
       PVector dest2 = new PVector(n2dx, n2dy);
       PVector dest3 = new PVector(n3dx, n3dy);

       dest1.normalize();
       dest2.normalize();
       dest2.normalize();

       dest1.mult(maxrange);
       dest2.mult(maxrange);
       dest3.mult(maxrange);

       shadow1 = new int[][]{ {t.posx1,    t.posy1},
                            {t.posx2,    t.posy2},
                            {(int)dest1.x, (int)dest1.y},
                            {(int)dest2.x, (int)dest2.y} };

       shadow2 = new int[][]{ {t.posx2,    t.posy2},
                            {t.posx3,    t.posy3},
                            {(int)dest2.x, (int)dest2.y},
                            {(int)dest3.x, (int)dest3.y} };
  }
        

  if ( (shadow1 != null) && (shadow1 != null)) {
    vertex(shadow1[0][0], shadow1[0][1]);
    vertex(shadow1[1][0], shadow1[1][1]);
    vertex(shadow1[3][0], shadow1[3][1]);
    vertex(shadow1[2][0], shadow1[2][1]);

    vertex(shadow2[0][0], shadow2[0][1]);
    vertex(shadow2[1][0], shadow2[1][1]);
    vertex(shadow2[3][0], shadow2[3][1]);
    vertex(shadow2[2][0], shadow2[2][1]);
  }
}


public void shadeRect(Rectangle building) {

  int mex = mouseX;
  int mey = mouseY;

  int[][] shadow = null;

   if ( (mey >= building.top) && (mey <= (building.top + building.hi))) { //middle, vertically

      if (mex < building.left) { //left side
        int n1dx = building.left - mex;
        int n1dy = building.top - mey;
        float n1ratz = (float)n1dy / n1dx;
        int n1dw = width - building.left;
        int n1rangey = building.top+(int)(n1dw*n1ratz);

        int n2dx = building.left - mex;
        int n2dy = (building.top+building.hi) - mey;
        float n2ratz = (float)n2dy / n2dx;
        int n2dw = width - building.left;
        int n2rangey = (building.top+building.hi)+(int)(n2dw*n2ratz);

        shadow = new int[][]{ {building.left,    building.top},
                              {building.left,    building.top+building.hi},
                              {width, n1rangey},
                              {width, n2rangey}};

      } else if (mex > (building.left+building.wid)) { //right side
        int n1dx = (building.left+building.wid) - mex;
        int n1dy = building.top - mey;
        float n1ratz = (float)n1dy / n1dx;
        int n1dw = (building.left+building.wid);
        int n1rangey = building.top-(int)(n1dw*n1ratz);

        int n2dx = (building.left+building.wid) - mex;
        int n2dy = (building.top+building.hi) - mey;
        float n2ratz = (float)n2dy / n2dx;
        int n2dw = (building.left+building.wid);
        int n2rangey = (building.top+building.hi)-(int)(n2dw*n2ratz);

        shadow = new int[][]{ {building.left+building.wid,    building.top},
                              {building.left+building.wid,    building.top+building.hi},
                              {0, n1rangey},
                              {0, n2rangey}};

      }

    } else if (mey < building.top) {

      if (mex < building.left) { //upper left
        int n1dx = building.left - mex;
        int n1dy = (building.top+building.hi) - mey;
        float n1ratz = (float)n1dx / n1dy;
        int n1dh = height - (building.top+building.hi);
        int n1rangex = building.left+(int)(n1dh*n1ratz);

        int n2dx = (building.left+building.wid) - mex;
        int n2dy = building.top - mey;
        float n2ratz = (float)n2dx / n2dy;
        int n2dh = height - building.top;
        int n2rangex = (building.left+building.wid)+(int)(n2dh*n2ratz);

        shadow = new int[][]{ {building.left,    building.top+building.hi},
                              {building.left+building.wid,    building.top},
                              {n1rangex, height},
                              {n2rangex, height}};


      } else if (mex > (building.left+building.wid)) { //upper right
        int n1dx = building.left - mex;
        int n1dy = building.top - mey;
        float n1ratz = (float)n1dx / n1dy;
        int n1dh = height - building.top;
        int n1rangex = building.left+(int)(n1dh*n1ratz);

        int n2dx = (building.left+building.wid) - mex;
        int n2dy = (building.top+building.hi) - mey;
        float n2ratz = (float)n2dx / n2dy;
        int n2dh = height - (building.top+building.hi);
        int n2rangex = (building.left+building.wid)+(int)(n2dh*n2ratz);

        shadow = new int[][]{ {building.left,    building.top},
                              {building.left+building.wid,    building.top+building.hi},
                              {n1rangex, height},
                              {n2rangex, height}};


      } else { //above middle
        int n1dx = building.left - mex;
        int n1dy = building.top - mey;
        float n1ratz = (float)n1dx / n1dy;
        int n1dh = height - building.top;
        int n1rangex = building.left+(int)(n1dh*n1ratz);

        int n2dx = (building.left+building.wid) - mex;
        int n2dy = building.top - mey;
        float n2ratz = (float)n2dx / n2dy;
        int n2dh = height - building.top;
        int n2rangex = (building.left+building.wid)+(int)(n2dh*n2ratz);

        shadow = new int[][]{ {building.left,    building.top},
                              {building.left+building.wid,    building.top},
                              {n1rangex, height},
                              {n2rangex, height}};

      }


    } else if (mey > (building.top+building.hi)) {


      if (mex < building.left) { //bottom left
        int n1dx = building.left - mex;
        int n1dy = building.top - mey;
        float n1ratz = (float)n1dx / n1dy;
        int n1dh = building.top;
        int n1rangex = building.left-(int)(n1dh*n1ratz);

        int n2dx = (building.left+building.wid) - mex;
        int n2dy = (building.top+building.hi) - mey;
        float n2ratz = (float)n2dx / n2dy;
        int n2dh = (building.top+building.hi);
        int n2rangex = (building.left+building.wid)-(int)(n2dh*n2ratz);

        shadow = new int[][]{ {building.left,    building.top},
                              {building.left+building.wid,    building.top+building.hi},
                              {n1rangex, 0},
                              {n2rangex, 0}};

      } else if (mex > (building.left+building.wid)) { //bottom right
        int n1dx = building.left - mex;
        int n1dy = (building.top+building.hi) - mey;
        float n1ratz = (float)n1dx / n1dy;
        int n1dh = (building.top+building.hi);
        int n1rangex = building.left-(int)(n1dh*n1ratz);

        int n2dx = (building.left+building.wid) - mex;
        int n2dy = building.top - mey;
        float n2ratz = (float)n2dx / n2dy;
        int n2dh = building.top;
        int n2rangex = (building.left+building.wid)-(int)(n2dh*n2ratz);

        shadow = new int[][]{ {building.left,    building.top+building.hi},
                              {building.left+building.wid,    building.top},
                              {n1rangex, 0},
                              {n2rangex, 0}};

      } else { //below middle
        int n1dx = building.left - mex;
        int n1dy = (building.top+building.hi) - mey;
        float n1ratz = (float)n1dx / n1dy;
        int n1dh = (building.top+building.hi);
        int n1rangex = building.left-(int)(n1dh*n1ratz);

        int n2dx = (building.left+building.wid) - mex;
        int n2dy = (building.top+building.hi) - mey;
        float n2ratz = (float)n2dx / n2dy;
        int n2dh = (building.top+building.hi);
        int n2rangex = (building.left+building.wid)-(int)(n2dh*n2ratz);

        shadow = new int[][]{ {building.left,    building.top+building.hi},
                              {building.left+building.wid,    building.top+building.hi},
                              {n1rangex, 0},
                              {n2rangex, 0}};

      }

    }


    if ( shadow != null) {
      vertex(shadow[0][0], shadow[0][1]);
      vertex(shadow[1][0], shadow[1][1]);
      vertex(shadow[3][0], shadow[3][1]);
      vertex(shadow[2][0], shadow[2][1]);
    }
}


