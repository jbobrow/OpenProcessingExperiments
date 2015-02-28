
char[] lastKeyArray = { 119 , 115 , 97 , 100 , 101 , 113 };
int a = 0;
float x = -400;
float y = 00;
float z = -500;
float xold = x;
float yold = y;
float zold = z;
float zrandom = 0;
float rotation = 0;
boolean exit = false;
char lastKey;
char lastKey2;

void setup()
{
  size(1920, 1080, P3D);
  background(255);
  strokeWeight(1);
  //frameRate(5);
  //noLoop();
  loop();
}
void draw()
{
  lights();
  translate(width/2,height/2);
  rotateY(1);
  rotateX(-.2);
  fill(color(random(100,255),random(100,255),random(100,255)));
  //stroke(color(random(255),random(255),random(255)));
  //noFill();
  
  lastKey = lastKeyArray[int(random(6))];
  
  //up
  if ( y >= -height/2 && lastKey == 119 ) {
    y -= 20;
  }
  //down
  if ( y <= height/2 && lastKey == 115 ) {
    y += 20;
  }
  //left
  if ( x >= -width/2 && lastKey == 97 && random(1) > 0.2 ) {
    x -= 20;
  }
  //right
  if ( x <= width/2 &&  lastKey == 100 ) {
    x += 20;
  }
  
  zrandom = (z + 1500) / 2800;
  //in
  if ( z <= 2000 && lastKey == 101 && random(1) > zrandom ) {
    z += 20;
  }
  //out
  if ( z >= -400 && lastKey == 113 && random(1) < zrandom) {
    z -= 20;
  }
  
  if ( lastKey2 == 98 ) {
    save("cubes.tif");
  }
  
  translate(x, y, z);
  box(20);
  
  //print(x);
  //print(" ");
  //print(y);
  //print(" ");
  //println(z);
}

void keyPressed() {
  lastKey2 = key;
  redraw();
}
