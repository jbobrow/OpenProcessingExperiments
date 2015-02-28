
//Real-time cloth simulation
//Use the slider to alter gravity

PhysicsController3D Phys;
Slider S;
DynamicNode[][] mesh;
Node[] handles;
Gravity G;
PImage hi;

float K = 0.1;
int numX = 15;
int numY = 10;

void setup()
{
  size(400,500, P3D);
  hi = loadImage("hi.gif");
  S = new Slider(width/2, height-60, 300, 50, 20);
  S.setColors(color(70,70,150, 200), color(255,255,0, 200));
  pInitializeUtilities();
  Phys = new PhysicsController3D();  
  mesh = new DynamicNode[numX][numY];
  handles = new Node[numX];
  G = new Gravity(0.5);
  //Create Nodes
  for (int r=0; r<numX; r++)
    for (int c=0; c<numY; c++)
    {
      mesh[r][c] = new DynamicNode(50*r, 50+50*c, 0, 1.0, 0.98);
      mesh[r][c].addForce(G);
      Phys.addNode(mesh[r][c]);
    }
  //Create Handles
  for (int r=0; r<numX; r++)
  {
    handles[r] = new Node(50*r, 0, sin(r*PI/(numX-1))*200);
    Phys.addNode(handles[r]);
  }
  //connect mesh
  for (int r=0; r<numX; r++)
    for (int c=0; c<numY-1; c++)
    {
      Phys.addForce(new Spring(mesh[r][c],mesh[r][c+1], K, 50.0));
    }
  for (int r=0; r<numX-1; r++)
    for (int c=0; c<numY; c++)
    {
      Phys.addForce(new Spring(mesh[r][c],mesh[r+1][c], K, 50.0));
    }
  //connect trusses
  for (int r=0; r<numX-1; r++)
    for (int c=0; c<numY-1; c++)
    {
      Phys.addForce(new Spring(mesh[r][c],mesh[r+1][c+1], K, 70.0));
      Phys.addForce(new Spring(mesh[r+1][c],mesh[r][c+1], K, 70.0));
    }
  //connect handles
  for (int r=0; r<numX; r++)
  {
    Phys.addForce(new Spring(mesh[r][0],handles[r], K, 10.0));
  }
}

void draw()
{
  background(0);
  lights();
  pushMatrix();
  translate(60, 80, 0);
  scale(0.4);
  fill(200);
  stroke(255);
  G.acceleration = S.value()+0.1;
  Phys.update();
  strokeWeight(3);
  stroke(255,255,0);
  beginShape(LINE_STRIP);
  for (int i=0; i<numX; i++)
  {
    vertex(handles[i].position.x, handles[i].position.y, handles[i].position.z);
  }
  endShape();
  strokeWeight(1);
  stroke(175);
  beginShape(LINES);
  for (int i=0; i<numX; i++)
  {
    vertex(handles[i].position.x, handles[i].position.y, handles[i].position.z);
    vertex(mesh[i][0].position.x, mesh[i][0].position.y, mesh[i][0].position.z);
  }
  endShape();
  noStroke();  
  fill(155,155,255);
  color c;
  beginShape(QUADS);
  for (int x=1; x<numX; x++)
  for (int y=1; y<numY; y++)
  {
    c = hi.pixels[(x-1) + 14*(y-1)];
    fill(c);
    vertex(mesh[x-1][y-1].position.x, mesh[x-1][y-1].position.y, mesh[x-1][y-1].position.z);
    vertex(mesh[x][y-1].position.x, mesh[x][y-1].position.y, mesh[x][y-1].position.z);
    vertex(mesh[x][y].position.x, mesh[x][y].position.y, mesh[x][y].position.z);
    vertex(mesh[x-1][y].position.x, mesh[x-1][y].position.y, mesh[x-1][y].position.z);
  }
  endShape();
  popMatrix();
  pClearDepthBuffer();
  S.draw();
}

void mousePressed()  {
  S.mousePressed();
}
void mouseReleased() {
  S.mouseReleased();
}
void mouseDragged()  {
  S.mouseDragged();
}

/*
Spatial Physics Simulation Utilities

class PhysicsController3D
  PhysicsController()
  void update()
  void drawSystem()
  void addNode(Node N)
  void addForce(Force F)

class Point3D
  Point3D()
  Point3D (float u, float v, float w)
  void add(Point3D P)
  float x, y, z;

class Node
  Node (float x, float y, float z)
  Node (float x, float y, float z, float m)
  void draw()
  void computeForce()
  void update()
  void addForce(Force F)
  Point3D position
  Remark: Baselines nodes are static

class DynamicNode extends Node
  DynamicNode(float x, float y, float z, float m, float d)
  Point3D velocity;
  float dampening;

abstract class Force
  abstract Point3D forceOn(Node N)
  abstract void draw()

class Gravity extends Force
  Gravity(float a)
  float acceleration;
  Remark: Must be manually added to dynamic nodes

class Spring extends Force
  Spring (Node n1, Node n2, float k, float l)
  float restLength;
  float stiffness;
  Remark: Is automatically applied to endnodes
*/

class PhysicsController3D
{
  private Force[] allForces;
  private Node[] allNodes;
  
  PhysicsController3D()
  {
    allForces = new Force[0];
    allNodes = new Node[0];
  }
  
  void update()
  {
    for (int i=0; i<allNodes.length; i++)
    {
      allNodes[i].computeForce();
    }
    for (int i=0; i<allNodes.length; i++)
    {
      allNodes[i].update();
    }
  }
  
  void drawSystem()
  {
    stroke(0);
    fill(0);
    for (int i=0; i<allNodes.length; i++)
    {
      allNodes[i].draw();
    }
    stroke(150);
    fill(150);
    for (int i=0; i<allForces.length; i++)
    {
      allForces[i].draw();
    }
  }
  
  void addNode(Node N)
  {
    Node[] newNodes = new Node[allNodes.length+1];
    arraycopy(allNodes,0,newNodes,0,allNodes.length);
    newNodes[newNodes.length-1] = N;
    allNodes = newNodes;
  }
  
  void addForce(Force F)
  {
    Force[] newForces = new Force[allForces.length+1];
    arraycopy(allForces,0,newForces,0,allForces.length);
    newForces[newForces.length-1] = F;
    allForces = newForces;
  }
}

class Node
{
  public Point3D position;
  protected float mass;
  
  
  Node (float x, float y, float z)
  {
    position = new Point3D(x,y,z);
    mass = 1.0;
  }
  
  Node(float x, float y, float z, float m)
  {
    position = new Point3D(x,y,z);
    mass = m;
  }

  void draw()
  {
    fill(150);
    pushMatrix();
    translate(position.x, position.y, position.z);
    sphereDetail(5);
    noStroke();
    sphere(5.0);
    popMatrix();
  }
  
  void computeForce() {}
  void update() {}
  void addForce(Force F) {}

}

class DynamicNode extends Node
{
  public Point3D velocity;
  public float dampening;
  private Force[] myForces;
  private Point3D netForce;
  
  DynamicNode(float x, float y, float z, float m, float d)
  {
    super(x, y, z, m);
    myForces = new Force[0];
    netForce = new Point3D();
    velocity = new Point3D();
    dampening = d;
  }
  
  void addForce(Force F)
  {
    Force[] newForces = new Force[myForces.length+1];
    arraycopy(myForces,0,newForces,0,myForces.length);
    newForces[newForces.length-1] = F;
    myForces = newForces;
  }
  
  void computeForce()
  {
    netForce.x = 0;
    netForce.y = 0;
    netForce.z = 0;
    
    for (int i=0; i<myForces.length; i++)
    {
      netForce.add(myForces[i].forceOn(this));
    }
  }
  
  void update()
  {
    netForce.x/=mass;
    netForce.y/=mass;
    netForce.z/=mass;
    velocity.add(netForce);
    velocity.x *= dampening;
    velocity.y *= dampening;
    velocity.z *= dampening;
    position.add(velocity);
  }
}

class Point3D
{
  float x, y, z;
  
  Point3D()
  {
    x = 0;
    y = 0;
    z = 0;
  }
  
  Point3D (float u, float v, float w)
  {
    x = u;
    y = v;
    z = w;
  }
  
  void add(Point3D P)
  {
    x += P.x;
    y += P.y;
    z += P.z;
  }
}

abstract class Force
{
  abstract Point3D forceOn(Node N);
  abstract void draw();
}


class Gravity extends Force
{
  public float acceleration;

  Gravity(float a)
  {
    acceleration = a;
  }
  
  Point3D forceOn(Node N)
  {
    return new Point3D(0,acceleration*N.mass,0);
  }
  
  void draw() {}
}


class Spring extends Force
{
  public float restLength;
  public float stiffness;
  private Node a, b;
  
  Spring (Node n1, Node n2, float k, float l)
  {
    a = n1;
    b = n2;
    n1.addForce(this);
    n2.addForce(this);
    stiffness = k;
    restLength = l;
  }
  
  Point3D forceOn(Node N1)
  {
    Node N2 = a;
    if (N1 == N2)
    {
      N2 = b;
    }
    float dx = N2.position.x - N1.position.x;
    float dy = N2.position.y - N1.position.y;
    float dz = N2.position.z - N1.position.z;
    float displacement = sqrt(dx*dx + dy*dy + dz*dz);
    if (displacement == 0)
    {
      //Yeesh... this is tricky...
      return new Point3D();
    }
    float magnitude = stiffness*(displacement-restLength);
    magnitude /= displacement;

    return new Point3D(dx*magnitude, dy*magnitude, dz*magnitude);
  }
  
  void draw()
  {
    beginShape(LINES);
      vertex(a.position.x, a.position.y, a.position.z);
      vertex(b.position.x, b.position.y, b.position.z);
    endShape();
  }
}

/*
Max's Swanky Toolkit

P3D Mode Tweaks:
  void pInitializeUtilities()
  void pClearDepthBuffer()

OpenGL Mode Tweaks:
  void glInitializeUtilities()
  void glClearDepthBuffer()

Widgets:
  Slider
    Slider(int x0, int y0, int w0, int h0, int sw0)
    void setColors(color a, color b)
    void draw()
    void mousePressed()
    void mouseReleased()
    void mouseDragged()
    float value()
  PolygonModel
    PolygonModel(String objFile)
    void yAxisFlip()
    int numGroups()
    void setGroupColor(int groupID, int red, int green, int blue)
    void setGroupColor(String groupName, int red, int green, int blue)
    draw()
    draw(int groupID)
    draw(String groupName)
    void wireframe()
    void printInfo()
*/

//import net.java.games.jogl.*;
float clearBuffer[];
PGraphics3D P;
//GL gl;

void pInitializeUtilities()
{
  clearBuffer = new float[height*width];
  for (int i=0; i<clearBuffer.length; i++)
  {
    clearBuffer[i] = 10;
  }
  P = (PGraphics3D)g;
}

void pClearDepthBuffer()
//To draw on top of 3D objects
{
  arraycopy(clearBuffer,0,P.zbuffer,0,height*width);
}

/*
void glInitializeUtilities()
{
  gl = ((PGraphicsGL)g).gl;
}

void glClearDepthBuffer()
//To draw on top of 3D objects
{
  gl.glClear(gl.GL_DEPTH_BUFFER_BIT);
}
*/

class Slider
{
  private int x;
  private int y;
  private int w;
  private int h;
  private int sw;
  private int value;
  private color c1;
  private color c2;
  private boolean draggingState = false;
  
  Slider(int x0, int y0, int w0, int h0, int sw0)
  //Standard Constructor - set's colors to b/w
  {
    x = x0;
    y = y0;
    w = w0;
    h = h0;
    sw = sw0;
    value = 0;
    c1 = color(255,255,255);
    c2 = color(0,0,0);
  }
  
  void setColors(color a, color b)
  //Change bar and slider colors
  {
    c1 = a;
    c2 = b;
  }
  
  void draw()
  //Draw it to the screen
  {
    noStroke();
    rectMode(CENTER);
    fill(c1);
    rect(x,y,w,(h>>2));
    fill(c2);
    rect(x+value,y,sw,h);
  }
  
  void mousePressed()
  //Must be called in processing's corresponding method
  {
    draggingState = (mouseX == constrain(mouseX,x+value-(sw>>1),x+value+(sw>>1)) && 
                     mouseY == constrain(mouseY,y-(h>>1),y+(h>>1)));
  }
  
  void mouseReleased()
  {
    draggingState = false;
  }
  
  void mouseDragged()
  {
    if (draggingState)
    {
      value = constrain(mouseX-x,-(w>>1),(w>>1));        
    }
  }
  
  float value()
  //Retrieve the slider percent, use with "lerp"
  {
    return float(value+(w>>1))/float(w);
  }
}


class PolygonModel
{
  private float  v[][]; //Stores all verticies
  private int    f[][]; //Stores all faces
  private int    g[][]; //Stores boundary between groups
  private String gNames[];
  
  PolygonModel(String objFile)
  //Load a maya model from an OBJ file (MTL file must also be present)
  {
    String[] lines = loadStrings(objFile);
    String[] mlines = loadStrings(objFile.substring(0,objFile.length()-4) + ".mtl");
    
    //count verticies, face, and groups
    int numVerts = 0;
    int numFaces = 0;
    int numGroups = 0;
    for (int i=0; i<lines.length; i++)
    {
      if (lines[i].length() > 0)
      {
        switch (lines[i].charAt(0))
        {
          case 'v':
            if (lines[i].charAt(1) == ' ')
            {
              numVerts++;
            }
            break;
          case 'u':
            if (lines[i].startsWith("usemtl"))
            {
              numGroups++;    
            }
            break;
          case 'f':
            numFaces++;
            break;
        }
      }
    }
    
    //make space  
    v = new float[numVerts][3];
    f = new int  [numFaces][];
    g = new int  [numGroups][4];
    gNames = new String[numGroups];

    //load the data
    int curr_v = 0;
    int curr_f = 0;
    int curr_g = 0;
    int curr_m;
    StringTokenizer st, st2;
    for (int i=0; i<lines.length; i++)
    {
      if (lines[i].length() > 0)
      {
        st = null;
        st2 = null;
        switch (lines[i].charAt(0))
        {
          case 'v':
            st = new StringTokenizer(lines[i]);
            if (st.nextToken().equals("v"))
            {
              v[curr_v][0] = float(st.nextToken());
              v[curr_v][1] = float(st.nextToken());
              v[curr_v][2] = float(st.nextToken());
              curr_v++;
            }
            break;
          
          case 'u':
            st = new StringTokenizer(lines[i]);
            if (st.nextToken().equals("usemtl"))
            {
              g[curr_g][0] = curr_f;
              gNames[curr_g] = st.nextToken();
              for (curr_m=0; curr_m<mlines.length; curr_m++)
              {
                if (mlines[curr_m].startsWith("newmtl") && mlines[curr_m].endsWith(gNames[curr_g]))
                {
                  while (!mlines[curr_m].startsWith("Kd"))
                  {
                    curr_m++;
                  }
                  st2 = new StringTokenizer(mlines[curr_m]);
                  st2.nextToken();
                  g[curr_g][1] = (int)(255.0*float(st2.nextToken()));
                  g[curr_g][2] = (int)(255.0*float(st2.nextToken()));
                  g[curr_g][3] = (int)(255.0*float(st2.nextToken()));
                  curr_g++;
                  break;
                }
              }
            }
            break;

          case 'f':
            st = new StringTokenizer(lines[i]);
            st.nextToken();
            f[curr_f] = new int[st.countTokens()];
            for (int k=0; k<f[curr_f].length; k++)
            {
              st2 = new StringTokenizer(st.nextToken(),"/");
              f[curr_f][k] = int(st2.nextToken());
            }
            curr_f++;
            break;
        }
      }
    }
  }
  
  void yAxisFlip()
  {
    for (int i=0; i<v.length; i++)
    {
      v[i][1] *= -1;  
    }
  }
  
  int numGroups()
  //Return the number of shading groups
  {
    return g.length;
  }
  
  void setGroupColor(int groupID, int red, int green, int blue)
  //Set a group color by ID
  {
    if (groupID < g.length)
    {
      g[groupID][1] = red;
      g[groupID][2] = green;
      g[groupID][3] = blue;
    }
    else
    {
      println("Group #" + groupID + " does not exist.");
    }
  }
  
  void setGroupColor(String groupName, int red, int green, int blue)
  //Set a group color by Name
  {
    for (int i=0; i<gNames.length; i++)
    {
      if (groupName.equals(gNames[i]))
      {
        setGroupColor(i, red, green, blue);
      }
    }
  }

  void draw()
  //Render all the content
  {
    int curr_g=0;
    noStroke();
    beginShape(TRIANGLES);
      for (int i=0; i<f.length; i++)
      {
        if (curr_g < g.length && i == g[curr_g][0])
        {
          fill(g[curr_g][1], g[curr_g][2], g[curr_g][3]);
          curr_g++;
        }
        for (int k=2; k<f[i].length; k++)
        {
          vertex( v[f[i][0]-1][0],   v[f[i][0]-1][1],   v[f[i][0]-1][2]   );
          vertex( v[f[i][k-1]-1][0], v[f[i][k-1]-1][1], v[f[i][k-1]-1][2] );
          vertex( v[f[i][k]-1][0],   v[f[i][k]-1][1],   v[f[i][k]-1][2]   );
        }
      }
    endShape();
  }
  
  void draw(int groupID)
  //Render only the given shading group
  {
    if (groupID < g.length)
    {
      noStroke();
      int startFace = 0;
      int endFace = f.length;
      if (groupID > 0)
      {
        startFace = g[groupID][0];
      }
      if (groupID < g.length-1)
      {
        endFace = g[groupID+1][0];
      }

      fill(g[groupID][1], g[groupID][2], g[groupID][3]);
      beginShape(TRIANGLES);
        for (int i=startFace; i<endFace; i++)
        {
          for (int k=2; k<f[i].length; k++)
          {
            vertex( v[f[i][0]-1][0],   v[f[i][0]-1][1],   v[f[i][0]-1][2]   );
            vertex( v[f[i][k-1]-1][0], v[f[i][k-1]-1][1], v[f[i][k-1]-1][2] );
            vertex( v[f[i][k]-1][0],   v[f[i][k]-1][1],   v[f[i][k]-1][2]   );
          }
        }
      endShape();
    }
  }
  
  void draw(String groupName)
  //Render the given shading group by name
  {
    for (int i=0; i<gNames.length; i++)
    {
      if (groupName.equals(gNames[i]))
      {
        draw(i);
      }
    }
  }
  
  void wireframe()
  //Render a wireframe model
  {
    for (int i=0; i<f.length; i++)
    {
      beginShape(LINE_LOOP);
      for (int k=0; k<f[i].length; k++)
      {
        vertex( v[f[i][k]-1][0],   v[f[i][k]-1][1],   v[f[i][k]-1][2]   );
      }
      endShape();
    }
  }
  
  void printInfo()
  //Print information about the model to stdout
  {
    println("Number of Verticies: " + v.length);
    println("Number of Faces: " + f.length);
    for (int i=0; i<g.length; i++)
    {
      println("Group #" + i + "(" + gNames[i] + "), " + " Color: (" + g[i][1] + ", " + g[i][2] + ", " + g[i][3] + ")");
    }
  }
}


