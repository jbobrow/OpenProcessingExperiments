
import processing.pdf.*;

void setup() {
  randomSeed(15251);
  size(800, 600, PDF, "output.pdf");
  noLoop();
}

void draw_background_circles()
{
  for(int i = 10; i < width+20; i+=21)
  {
    for(int j = 10; j < height+20; j+=21)
    {
      
      int circle_color = 200 - int(((float)abs(i - width/2)/
                                      (float)(width) * 200.0 + 
                                      (float)abs(j - height/2)/
                                      (float)(height) * 200.0));
      stroke(circle_color, circle_color/2);
      fill(circle_color, circle_color/2);
      ellipse(i, j, 20, 20);
    }
  }
}

class Vertex{
  int x, y;
  Vertex parent;

  Vertex(int a, int b, Vertex p)
  {
    x = a;
    y = b;
    parent = p;
  }
}

void generate_graph(Vertex old_vertex, int depth)
{
  if(depth == 0)
    return;
  
  fill(255,72 - (15 - depth));
  stroke(255, 72 - (15 - depth));
  
  int dx = old_vertex.x - old_vertex.parent.x;
  int dy = old_vertex.y - old_vertex.parent.y;
  
  int child_count = (int)random(1, 3);
  
  for(int i = 0; i < child_count; i++)
  {
    dx *= random(1.5,1.0);
    dy *= random(1.5,1.0);

    int change_direction = (int)random(0,2);
    if(change_direction == 0)
      dx *= -1;
    change_direction = (int)random(0,2);
    if(change_direction == 0)
      dy *= -1;

    Vertex new_vertex = new Vertex(old_vertex.x + dx, 
                                   old_vertex.y + dy, 
                                   old_vertex);
    line(old_vertex.x,old_vertex.y,new_vertex.x,new_vertex.y);
    generate_graph(new_vertex, depth - 1);
  }

}

void draw() {
  saveFrame("outputgif/myname-loop-" + nf(0,4) + ".png");
  randomSeed(350441);

  background(50);
  draw_background_circles();
  Vertex root = new Vertex(width/2-1, height/2-6, null);

  fill(255,72);
  stroke(255, 72);

  Vertex vertices[] = {new Vertex(root.x - 30, root.y - 40, root),
                       new Vertex(root.x - 75, root.y + 13, root),
                       new Vertex(root.x + 44, root.y - 96, root),
                       new Vertex(root.x + 27, root.y + 67, root)};
  for(int i = 0; i < 4; i++)
  {
    Vertex new_vertex = vertices[i];
    line(root.x, root.y, new_vertex.x, new_vertex.y);
    generate_graph(new_vertex, 15);
  }
  exit();
  
}




