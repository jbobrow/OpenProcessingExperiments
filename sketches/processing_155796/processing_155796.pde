
class Ninja {
    int x;
    int y;
    int vx;
    int vy;
    int w;
    int h;
    boolean isJumping;
    boolean isGrounded;
    //line
    int linex;
    int liney;
    int linevx;
    int linevy;
    int len;
    int max;
    //float theta;
    boolean isDeployed;
    boolean isLanded;
  
    Ninja(int xPos, int yPos){
    x = xPos;
    y = yPos;
    vx = 0;
    vy = 0;
    w = 10;
    h = 10;
    isJumping = false;
    isGrounded = false;
    //line
    linex = xPos;
    liney = yPos;
    linevx = 0;
    linevy = 0;
    len = 0;
    max = 10;
    //theta = 0.0;
    isDeployed = false;
    isLanded = false;
    }  

void display(){
    ellipse(x,y,50,50);
}

}

int[] keys = new int[200];
width = 500;
heigh = 200;
size(width, height);

PFont font;
font = loadFont("FFScala.ttf");
textFont(font, 15);

 
void setup() {  
  ninja = new Ninja(200, 100);
  background(255);  
  colorMode(RGB);
  fill(0,0,0);   
}

void draw() {
  background(255);
  ninja.y--;
 
  
  ninja.display();
  info();
}

void info(){
   
    text("key: " + key + " " + keys[119],10,10);
    text("key size: " + keys.length() ,10,30);
}

void keyPressed(){
keys[key] = key;
ellipse(10,10,10,10);
}

