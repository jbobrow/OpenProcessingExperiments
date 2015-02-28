
/**
* author oggy 2014
* First the image is divided in 4 triangles that are added to a list of triangles.
* Then each triangle is removed from the list, and divided in 4 other triangles, that 
* are added to the list. And so on. 
* When MAX_DEPTH is reached, the triangle is removed from the list but not divided. 
*/

final int MAX_DEPTH = 7;
final String IMAGE_PATH = "lao.png";//tongue lao
final float TRIANGLE_RANDOM = .3;//adds some randomness for the triangles construction; no randomness is 0.5
PImage myImage;
Boolean isRunning = true;
Boolean isFinished = false;
ArrayList<Triangle> triangles;//list holding all the triangles that did not reach the MAX_DEPTH
color[] imagePixels;//pixels of the loaded picture
int imageW;//loaded picture width
int imageH;//loaded picture height
int imageCount = 0;//count of the saved images

void setup()
{
  size(600, 394);
  noStroke();
  myImage = loadImage(IMAGE_PATH);
  imageW = myImage.width;
  imageH = myImage.height;
  imagePixels = new int[imageW * imageH];
  myImage.loadPixels();
  imagePixels = myImage.pixels;
  myImage.updatePixels();
  
  triangles = new ArrayList<Triangle>();

  PVector A = new PVector(0, 0);
  PVector B = new PVector(imageW-1, 0);
  PVector C = new PVector(imageW-1, imageH-1);
  PVector D = new PVector(0, imageH-1);
  PVector H = new PVector(random(TRIANGLE_RANDOM, 1-TRIANGLE_RANDOM)*imageW, random(TRIANGLE_RANDOM, 1-TRIANGLE_RANDOM)*imageH);

  Triangle triangleA = new Triangle(A, H, B, 0);
  Triangle triangleB = new Triangle(B, H, C, 0);
  Triangle triangleC = new Triangle(C, H, D, 0);
  Triangle triangleD = new Triangle(D, H, A, 0);
  triangles.add(triangleA);
  triangles.add(triangleB);
  triangles.add(triangleC);
  triangles.add(triangleD);
  drawTriangles(triangleA);
  drawTriangles(triangleB);
  drawTriangles(triangleC);
  drawTriangles(triangleD);
}

void draw()
{
  int nbTriangles = triangles.size();
  if (nbTriangles > 0)
  {
    subdiviseTriangle((int)random(nbTriangles));
  }
  else
  {
    noLoop(); 
    isFinished = true;
    println("end of subdivision");
  }
}

void subdiviseTriangle(int p_rank)
{
  Triangle myTriangle = triangles.get(p_rank);
  triangles.remove(p_rank);
  int depth = myTriangle.depth + 1;
  PVector A = myTriangle.A;
  PVector B = myTriangle.B;
  PVector C = myTriangle.C;
  PVector AB = myTriangle.AB;
  PVector BC = myTriangle.BC;
  PVector CA = myTriangle.CA;

  Triangle triangleA = new Triangle(A, AB, CA, depth);
  Triangle triangleB = new Triangle(B, AB, BC, depth);
  Triangle triangleC = new Triangle(C, CA, BC, depth);
  Triangle triangleD = new Triangle(AB, BC, CA, depth);

  drawTriangles(triangleA);
  drawTriangles(triangleB);
  drawTriangles(triangleC);
  drawTriangles(triangleD);

  if (depth < MAX_DEPTH)
  {
    triangles.add(triangleA);
    triangles.add(triangleB);
    triangles.add(triangleC);
    triangles.add(triangleD);
  }
  //increase the rendering pace
  //not supposed to do that (for whatever reason) but it works just so well!
  if(random(1) < .9) draw();
}

void drawTriangles(Triangle p_triangle)
{
  fill(p_triangle.myColor);
  beginShape(TRIANGLES);
  vertex(p_triangle.A.x, p_triangle.A.y);
  vertex(p_triangle.B.x, p_triangle.B.y);
  vertex(p_triangle.C.x, p_triangle.C.y);
  endShape(CLOSE);
}

void mousePressed()
{
  if (isRunning)
  {
    noLoop();
  }
  else if (!isFinished)
  {
    loop();
  }
  isRunning = !isRunning;
}

void keyPressed()
{
  if (key == 'p')
  {
    save("Subdivision" + str(imageCount++) + ".jpg");
  }
}


