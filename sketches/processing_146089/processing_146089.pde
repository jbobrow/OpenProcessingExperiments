
float cenreX;
float centreY;
float x;
float y;
float v=8;
int mida=25;



void setup() {
  size(400,400);
  x = width/2;
  y = height/2;
  
}
 
void draw()  {
  //background(0);
  fill(0,10);
  rect(0,0,width,height);
  stroke(188,110,13);//Marro clar
  
fill(255,204,75);//Groc
strokeWeight(3);


 
//Cap
rect(x/2,y/2,160,200);
//Ojeras
ellipse((x/2)+130,(y/2)+120,58,58);
ellipse((x/2)+30,(y/2)+120,58,58);
//Pecas
noStroke();
fill(188,110,13);//Marro clar
ellipse((x/2)+15,(y/2)+24,8,5);
ellipse((x/2)+25,(y/2)+16,5,5);
ellipse((x/2)+12,(y/2)+14,9,6);
fill(255,204,75);
noStroke();
rect((x/2)+2,(y/2)+85,157,50);
//Ulls
fill(random(255),random(255),random(255),random(255));
stroke(188,110,13);//Marro clar
ellipse((x/2)+130,(y/2)+118,55,45);
ellipse((x/2)+30,(y/2)+118,55,45);
//pupilas
noStroke();
fill(0);//negre
fill(255,255,255);//blanc
//Dents
noStroke();
rect((x/2)+100,(y/2)+220,40,34);
//Boca
fill(245,115,91);//Vermell clar
stroke(209,58,32);//Vermell fosc
rect((x/2)-13,(y/2)+160,187,70);
//Nas
fill(188,110,13);//Marro clar
stroke(116,77,0);//Marro fosc
ellipse((x/2)+80,(y/2)+145,60,50);
 
 
 float r = random(100);

  if (r < 25) {
    //cap amunt
    y = y - v;
  } 
  else if (r < 50) {
    //cap avall
    y = y +v;
  } 
  else if (r <75) {
    //dreta
    x = x+v;
  } 
  else {
    //esquerra
    x = x-v;
  }

  comprovaLimits();
}

void comprovaLimits() {
  if (x-mida/2<0) {
    x =mida/2;
  }
  if (x+mida/2>width) {
    x=width-mida/2;
  }
  if (y-mida/2<0) {
    y =mida/2;
  }
  if (y+mida/2>height) {
    y=height-mida/2;
  }
}

