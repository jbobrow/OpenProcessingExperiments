
//Remix af Sarah Silvany Grot (sasg@itu.dk)
// Lånt koder af Niels Petersen og Dennis Timmermann (http://www.openprocessing.org/sketch/21901) 

PImage photo1; // insætter billede 1 
PImage photo2; // indsætter billede 2
int mode=1;
ArrayList<Triangle> triangles;
color[] colors = { //forskellige farver fra photoshop 
  color(0x404040, 255), color(0x2e1508, 255), color(0xffffff, 255), color(0x000000, 255), color(0x695646, 255)
};
int direction;
int triangleHeight = 60;   //højden på trekanterne
int triangleWidth;         
int indexCount = 0;

import ddf.minim.*;
AudioPlayer player;
Minim minim;

//===================================
void setup() {
  minim = new Minim(this);
  player = minim.loadFile("music.mp3", 2048);
  player.play();
  player.loop(); //musikken startes

  setup1();
}
void draw() {
  if (mode==1) draw1();
  else if (mode==2) draw2();
}
void mouseReleased() {
  mode = mode+1;
  if (mode==3)  mode=1;
  background(240, 240, 240);
  colorMode(RGB, 255);
  if (mode==1) setup1();
  else if (mode==2) setup2();
}


//======================================



void setup1 () {
  size(1000, 662);
  photo1 = loadImage("analog.jpg");
}

void setup2 () {
  size (1000, 662); // størrelse skal være den samme som billedet
  photo2 = loadImage("analog2.jpg");

  noStroke();
  smooth();
  frameRate(35); // hvor hurtigt trekanterne skal skifte

  println(triangleWidth = ceil(sqrt(3)/2*triangleHeight));   

  triangles = new ArrayList();


  for (int i = 0; i < width-triangleWidth; i+=triangleWidth) 
  {
    println(i/triangleWidth%2 == 0);
    if (i/triangleWidth%2 == 0)
    {
      direction = 1;
    }
    else
    {
      direction = -1;
    }

    for (int j = 0; j < height; j+=triangleHeight/2)
    {
      direction *= -1;
      if (sqrt(i*j/1.1)*10 <= random(sqrt(width*height/1))*9)  //time to finetune -  less triangles in the bottom right corner
      {
        triangles.add(new Triangle(i+(ceil(triangleWidth/2)), j-triangleHeight/2, direction));
      }
    }

    //her shuffler trekanterne ß
    for (int k = triangles.size(); k >= 0; k--)
    {
      int index = (int)random(0, k);
      Triangle tmp = triangles.remove(index);
      triangles.add(tmp);
    }
  }
}

void build()
{
  if (indexCount < triangles.size() && frameCount%1 == 0)
  {
    triangles.get(indexCount).start();
    ++indexCount;
    println(indexCount);
  }
}

//=======================================

void draw1 () {
  image(photo1, 0, 0);
}

void draw2 () {
  image (photo2, 0, 0);
  if (indexCount < triangles.size())
  {
    build();
  } 
  else if (frameCount%1 == 0)
  {
    triangles.get((int)random(triangles.size())).flash();
    println("--"+frameCount);
  }

  for (int i = triangles.size()-1; i >= 0; i--)
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
    if (this.start == true && triangleAlpha <= 255)
    {
      this.triangleAlpha = constrain(triangleAlpha+=5, 0, 255); //fading speed
    }
    if (this.flash == true)
    {
      triangleAlpha = constrain(triangleAlpha-=5, 0, 255);  //fading speed
      if (triangleAlpha <= 0)
      {
        this.flash = false;
        this.start = true;
        this.triangleColor = colors[(int)random(colors.length)];  //comment this out if colors should stay the same
      }
    }
    fill(triangleColor, triangleAlpha);
    {
      triangle(this.x+ceil(triangleWidth/2)*this.direction, this.y-triangleHeight/2, 
      this.x+ceil(triangleWidth/2)*this.direction, this.y+triangleHeight/2, 
      this.x-ceil(triangleWidth/2+1)*this.direction, this.y);
    }
  }
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}
