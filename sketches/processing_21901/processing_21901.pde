
/**
 *Triangles
 *@author Dennis Timmermann
 * Colors: "Love" from nicolagilroy @kuler http://kuler.adobe.com/#themeID/1254606
 */

//globals
ArrayList<Triangle> triangles;

color[] colors = { //define colors here
  color(0xC94053, 255), color(0x993559, 255), color(0x6B274E, 255), color(0x421F3E, 255), color(0xFFAA68, 255)
};

int direction;
int triangleHeight = 20;   //set triangle height
int triangleWidth;         //

int indexCount = 0;

void setup()
{
  size(505,500);
  background(255);
  noStroke();
  smooth();
  frameRate(25);

  println(triangleWidth = ceil(sqrt(3)/2*triangleHeight));   //equilateral triangle

  triangles = new ArrayList();

  //build initial arraylist
  for(int i = 0; i < width-triangleWidth; i+=triangleWidth)  
  {
    println(i/triangleWidth%2 == 0);
    if(i/triangleWidth%2 == 0)
    {
      direction = 1;
    } 
    else
    {
      direction = -1;
    }

    for(int j = 0; j < height; j+=triangleHeight/2)
    {
      direction *= -1;
      if(sqrt(i*j/1.1)*10 <= random(sqrt(width*height/1))*9)  //time to finetune -  less triangles in the bottom right corner
      {
        triangles.add(new Triangle(i+(ceil(triangleWidth/2)),j-triangleHeight/2, direction));
      }
    }
    //shuffle
    for(int k = triangles.size(); k >= 0; k--)
    {
      int index = (int)random(0,k);
      Triangle tmp = triangles.remove(index);
      triangles.add(tmp);
    }
  }
}

void build()
{
  if(indexCount < triangles.size() && frameCount%1 == 0)
  {
    triangles.get(indexCount).start();
    ++indexCount;
    println(indexCount);
  }  
}

void draw()
{
  background(255);
  if(indexCount < triangles.size())
  {
    build();
  } else if(frameCount%1 == 0)
  {
    triangles.get((int)random(triangles.size())).flash();
    println("--"+frameCount);
  }
  
  for(int i = triangles.size()-1; i >= 0; i--)
  {
    triangles.get(i).draw();
  }
  
}

class Triangle
{
  int x;
  int y;
  int direction;
  color triangleColor;
  int triangleAlpha;   //0 to 255
  boolean start;
  boolean flash;

  //constructor
  Triangle(int _x, int _y, int _direction)
  {
    this.x = _x;
    this.y = _y;
    this.direction = _direction;

    this.triangleColor = colors[(int)random(colors.length)];
    this.triangleAlpha = 0;
    this.start = false;
    this.flash = false;
  }
  
  void start()
  {
    this.start = true;
  }
  void flash()
  {
    this.start = false;
    this.flash = true;
  }

  void draw()
  {
    if(this.start == true && triangleAlpha <= 255)
    {
       this.triangleAlpha = constrain(triangleAlpha+=5,0,255); //fading speed
    }
    if(this.flash == true)
    {
      triangleAlpha = constrain(triangleAlpha-=5,0,255);  //fading speed
      if(triangleAlpha <= 0)
      {
        this.flash = false;
        this.start = true;
        this.triangleColor = colors[(int)random(colors.length)];  //comment this out if colors should stay the same
      }
    }
    fill(triangleColor, triangleAlpha);
    {
      triangle(this.x+ceil(triangleWidth/2)*this.direction,  this.y-triangleHeight/2,
      this.x+ceil(triangleWidth/2)*this.direction,  this.y+triangleHeight/2,
      this.x-ceil(triangleWidth/2+1)*this.direction, this.y);
    }
  }
}


