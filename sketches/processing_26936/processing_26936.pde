
int col = 1;

int drawX, drawY;

void setup()
{
  size (650, 650);
  background (0);
  
 // PFont f;
 // f = loadFont("Arial-Black-48.vlw");
 // textFont(f,36);
 // fill (100);
    
}

void draw(){



  if (mousePressed && (mouseButton == RIGHT)) {
    stroke (255,0,0);
    strokeWeight (5);

float r;
float g;
float b;
float a;
float diam;
float x;
float y;

r = random(255);
g = random(255);
b = random(255);
a = random(255);
diam = random(10);
x = random(width);
y = random(height);

noStroke();
fill(r,g,b,a);
ellipse(x,y,diam,diam);

    
  }

  else if (mousePressed && (mouseButton == CENTER)) {
    stroke (0,255,0);
    strokeWeight (10);
  
float r=100;
float g=150;
float b=200;
float a=200; 
float z=100;
float x=100;
float y=100;
    
  r=random(255);//random red
  g=random(255);// random green
  b=random(255);// random blue
  a=random(255);// random opacity
  x=random(width);// random x position between 0 and 100
  y=random(height);// random y position between 0 and 100
    
  stroke (r,g,b,a);//fill with random colour and opacity
  line (pmouseX,pmouseY,x,y);// draw lines starting at mouse position and shooting out at random positions


    
  }
  
 else if (mousePressed && (mouseButton == LEFT)){
    
    
  line (drawX, drawY, mouseX, mouseY);
  col = col + 1;
  if (col > 500) {
    col = 0;
  }
  
  stroke (mouseY, col, mouseX);
  strokeWeight (10);
  
  drawX = mouseX;
  drawY = mouseY;
  
  }

  
}


  
void keyPressed() {
  if (key == 'c') {
  background (0);
  }
  
  else {
  float weight = dist(mouseX, mouseY, pmouseX, pmouseY);
  
  strokeWeight(weight);
  line(mouseX, mouseY, pmouseX, pmouseY);
}
  
  }

//float r = random(0, 9);
//int surprise = int (r);
  //delay (1000);
  
 // if (surprise == 5)
 // {
   // println(surprise);
   // text("BOOOO!!", 200,200);
   // delay (1000);
   // background (0);
 // }
//}


