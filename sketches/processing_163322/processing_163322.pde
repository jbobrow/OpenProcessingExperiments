
float light;
float mouseLightX;
float mouseLightY;
float speed;
float patternSize = 72;

float R= random(50, 255);
float G= random(50, 255);
float B= random(50, 255);
float a= random(80, 95);

color A = color(R, G, B);

void setup(){
  size(1000,1000);
  smooth();
  frameRate(48);

}

//Function "t" >>> the Y shape

void t(float x, float y, float size){

noStroke();

//Light variables in mouse pos. (0 to 255)  
mouseLightX = (255*mouseX)/width;
mouseLightY = (255*mouseY)/height;

if(speed<360){
speed+=0.00001;  
}
if(speed >= 360){
speed*=-0.00001;  
}
rotate(radians(speed));


//Top Face
if (mouseLightY < 128){
  A=color(R - mouseLightY, G - mouseLightY, B - mouseLightY);
  fill(A);
  }
if (mouseLightY >= 128){
  A=color(R - mouseLightY, G - mouseLightY, B - mouseLightY);
  fill(A);
  }
  quad(x, y+(size*2), x+(size*2), y+size, x+(size*4), y+(size*2), x+(size*4), y+(size*4));
  quad(x+(size*8), y+(size*2), x+(size*6), y+size, x+(size*4), y+(size*2), x+(size*4), y+(size*4));


//Left Face
if (mouseLightX > 128){
  A=color((R-10) - mouseLightX, (G-10) - mouseLightX, (B-10) - mouseLightX);
  fill(A);
  }
if (mouseLightX <= 128){
  A=color((G-10) - mouseLightX, (B-10) - mouseLightX, (R-10) - mouseLightX);
  fill(A);
  }

  quad(x, y+(size*2), x+(size*4), y+(size*4), x+(size*4), y+(size*6), x, y+(size*4));
  quad(x+(size*2), y+(size*4), x+(size*4), y+(size*4), x+(size*4), y+(size*8), x+(size*2), y+(size*7));


//Right face
if (mouseLightX < 128){
  A=color((R-10) - (255-mouseLightX), (G-10) - (255-mouseLightX), (B-10) - (255-mouseLightX));
  fill(A);
  }
if (mouseLightX >= 128){
  A=color(R-(255-mouseLightX), G-(255-mouseLightX), B-(255-mouseLightX));
  fill(A);
  }

  quad(x+(size*8), y+(size*2), x+(size*4), y+(size*4), x+(size*4), y+(size*6), x+(size*8), y+(size*4));
  quad(x+(size*6), y+(size*4), x+(size*4), y+(size*4), x+(size*4), y+(size*8), x+(size*6), y+(size*7)); 
}

void draw(){

//background(127);
noStroke();

if(patternSize > 6){
  patternSize-=0.1;
}
if(patternSize == 6){
patternSize+=72;
}

pushMatrix();
translate(-patternSize*3, -patternSize*6);

for(int hor = 0; hor < width*2; hor+= patternSize*12){
  for(int ver = 0; ver < height*2; ver+= patternSize*6){
  t(hor, ver, patternSize);
  }
}

for(int hor = 0; hor < width*2; hor += patternSize*12){
  for(int ver = 0; ver <height*2; ver += patternSize*6){
  t(hor+(patternSize*6), ver+(patternSize*3), patternSize);
  }
}

popMatrix();

fill(G, B, R, a);
ellipse(width/2, height/2, width/2 +(patternSize*10), height/2+(patternSize*10));

}

void keyPressed(){
  
if(key=='a'){
  patternSize+=3;
}
if(key=='s' && patternSize>6){
  patternSize-=3;
}
}
  


