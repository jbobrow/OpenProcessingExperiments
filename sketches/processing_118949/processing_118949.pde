
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/117808*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
// DelaunayTriangulator.pde
// A classic one in my own implementation.
// Ale González, 2013
//
// interactivated by Toni Holzer, 2013-11-03
// tags: delaunay, triangle, triangulation, image, image processing

import java.util.List;
import java.util.LinkedList;

String pictures[] = { "1.jpg", "2.jpg", "3.jpg" };
int pictureId = 0;

int W = 800, H = 800;
int[] colors;
ArrayList<Triangle> triangles;

boolean calc = true;
int mode = 0;
PImage bgImage;

void setup() 
{
  //frame.setResizable(true);
  size(800, 800);
  W = width;
  H = height;
  bgImage = new PImage(W,H);
  smooth();
  println (">>> Delaunay Triangulator <<<");
  loadPicture(0);
  frameRate = 22;
  fill(0);
}

void draw()
{
  // check for window resizing
  if ((W != width) || (H != height))
  {
    W = width;
    H = height;
    mode = 1;    // reload picture    
  }
  //println ("mode="+mode);
  switch (mode)
  {        case 0: message ("loading picture " + pictures[pictureId]);
    break; case 1: loadPicture (pictureId);
    break; case 2: drawParameter();
    break; case 3: calculate();
    break; case 4: if (mousePressed) mode = 5; else displayMesh();
    break; case 5: background (bgImage);  
  }  
  if (mode < 4) mode++; 
}

void keyPressed()
{ message (key + " ");
  if      (key == ' ') loadPicture(pictureId+1);
  else if (key ==  8 ) loadPicture(pictureId-1);   // delete key
  else if (key == '+') { mode = 2;   EdgeDetector.changeTreshold(+10); }
  else if (key == '-') { mode = 2;   EdgeDetector.changeTreshold(-10); }
  else if (key == 'm') { mode = 2;   EdgeDetector.changeStep(+1); }
  else if (key == 'n') { mode = 2;   EdgeDetector.changeStep(-1); }
  else if (key == 'o') { mode = 2;   EdgeDetector.useNextOperator(); }
  else if (key == 's') { save("Triangled_" + pictures[pictureId]); }
}

void mousePressed()
{ 
  if (mouseX < width / 2)
       loadPicture(pictureId-1);
  else loadPicture(pictureId+1);
}

void mouseReleased()
{
  mode = 2;  // calculate 
}

void mouseMoved()
{
  if (mouseY < 30)
    drawParameter();
}

void drawParameter()
{
  message ( "calculating triangles...    "
          + "  treshold=" + EdgeDetector.treshold 
          + "  step=" + EdgeDetector.step
          + "  detector=" + EdgeDetector.kind[EdgeDetector.op]);
}                           

void loadPicture(int picIndex)
{
  pictureId = ((picIndex + pictures.length) % pictures.length);
  println ("loading picture '" + pictures[pictureId] + "'..."); 
  PImage img = loadImage(pictures[pictureId]);
  if (img != null)
  {
    bgImage = new PImage(W,H);
    int px  = 0;
    int py = 0;
    int picH = height; 
    int picW = width; 
    if (img.width > img.height)
    {
      picH = img.height * W / img.width;
      py = (height - picH) / 2;
    }
    else 
    {
      picW = img.width * H / img.height;
      px = (width - picW) / 2;
    }
    println ("x="+px+" y="+py+ "  w="+picW + "  h=" +picH);
    bgImage.copy (img, 0,0, img.width, img.height
                     , px,py, picW, picH);
  }
}

void message (String msg)
{
  textAlign(CENTER);
  fill (255);
  rect(0, 0, width, 30);
  fill(0);
  text (msg, width/2, 22);
}

void calculate()
{
  //Extract significant points of the picture
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  EdgeDetector.extractPoints(vertices, bgImage);

  //Add some points in the border of the canvas to complete all space
  for (float i = 0, h = 0, v = 0; i<=1 ; i+=.05, h = W*i, v = H*i) 
  {
    vertices.add(new PVector(h, 0));
    vertices.add(new PVector(h, H));
    vertices.add(new PVector(0, v));
    vertices.add(new PVector(W, v));
  }

  //Get the triangles using qhull algorithm. 
  //The algorithm is a custom refactoring of Triangulate library by Florian Jennet (a port of Paul Bourke... not surprisingly... :D) 
  triangles = new ArrayList<Triangle>();
  new Triangulator().triangulate(vertices, triangles);

  //Prune triangles with vertices outside of the canvas.
  Triangle t = new Triangle();
  for (int i=0; i < triangles.size(); i++)
  {
    t = triangles.get(i); 
    if (vertexOutside(t.p1) || vertexOutside(t.p2) || vertexOutside(t.p3)) triangles.remove(i);
  }

  //Get colors from the triangle centers
  int tSize = triangles.size();
  colors = new int[tSize*3];
  PVector c = new PVector();
  for (int i = 0; i < tSize; i++) 
  {
    c = triangles.get(i).center();
    colors[i] = bgImage.get(int(c.x), int(c.y));
  }
  calc = false;
}

// util function to prune triangles with vertices out of bounds  
boolean vertexOutside(PVector v) 
{ 
  return v.x < 0 || v.x > width || v.y < 0 || v.y > height;
}  

// display the mesh of triangles  
void displayMesh()
{
  Triangle t = new Triangle();
  beginShape(TRIANGLES);
  noStroke();
  for (int i = 0; i < triangles.size(); i++)
  {
    t = triangles.get(i); 
  noStroke();
    fill(colors[i]);
    vertex(t.p1.x, t.p1.y);
    vertex(t.p2.x, t.p2.y);
    vertex(t.p3.x, t.p3.y);
  }
  endShape();
}


