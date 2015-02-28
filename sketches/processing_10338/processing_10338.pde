
//PImage txt;
String s;
color c;
float[][] matrix;

void setup()
{
  textFont(loadFont("AgencyFB-Reg-48.vlw"));
  strokeWeight(2);
  
  size(300, 300, P3D);
  //txt = loadImage("text.gif");
  
  matrix = new float[4][4];

  mousePressed();
}

void mousePressed()
{
  c = color(random(20,245),random(20,245),random(20,245));
  
  s = "";
  for(int k = 0; k < 5; k++)
    s += (char)random('a', 'z'+1);
    
  float d = .5;
  
  matrix[0][0] = random(.9,1/.9);
  matrix[0][1] = random(-d,d);
  matrix[0][2] = random(-d,d);
  matrix[0][3] = random(-d,d);
  
  matrix[1][0] = random(-d,d);
  matrix[1][1] = random(.9,1/.9);
  matrix[1][2] = random(-d,d);
  matrix[1][3] = random(-d,d);
  
  matrix[2][0] = random(-d,d);
  matrix[2][1] = random(-d,d);
  matrix[2][2] = random(.9,1/.9);
  matrix[2][3] = random(-d,d);
  
  matrix[3][0] = random(-d,d)/100.0;
  matrix[3][1] = random(-d,d)/100.0;
  matrix[3][2] = random(-d,d)/100.0;
  matrix[3][3] = random(.9,1/.9);
  
  //now actually draw the stuff
  background(255);
  fill(c);
  
  for(int k = 0; k < random(1,6); k++)
    line(0,random(0,height),width,random(0,height));
    
  translate(width/2 - 50, height/2);
  rotate(random(-1,1));

  applyMatrix(
  matrix[0][0],matrix[0][1],matrix[0][2],matrix[0][3],
  matrix[1][0],matrix[1][1],matrix[1][2],matrix[1][3],
  matrix[2][0],matrix[2][1],matrix[2][2],matrix[2][3],
  matrix[3][0],matrix[3][1],matrix[3][2],matrix[3][3]);
  
  //image(txt, 10, 10);
  text(s, 0, 0);
}

void draw()
{
  if(System.currentTimeMillis() % 2000 <= 10)
    mousePressed();
}

