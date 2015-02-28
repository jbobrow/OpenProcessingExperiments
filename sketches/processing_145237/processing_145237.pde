
float cenreX;
float centreY;
float x;
float y;
float v=3;

void setup () {
  size(400,400);
  posX= width/2;
  posY= height/2;
 velX=5;
 velY=5;
}


void draw()  {
  background(0);
  stroke(188,110,13);//Marro clar
fill(255,204,75);//Groc
strokeWeight(3);
posX=posX+velX;
posY=posY+velY;

//Cap
rect(posX/2,posY/2,160,200);
//Ojeras
ellipse((posX/2)+130,(posY/2)+120,58,58);
ellipse((posX/2)+30,(posY/2)+120,58,58); 
//Pecas
noStroke();
fill(188,110,13);//Marro clar
ellipse((posX/2)+15,(posY/2)+24,8,5);
ellipse((posX/2)+25,(posY/2)+16,5,5);
ellipse((posX/2)+12,(posY/2)+14,9,6);
fill(255,204,75);
noStroke();
rect((posX/2)+2,(posY/2)+85,157,50);
//Ulls
fill(random(255),random(255),random(255),random(255));
stroke(188,110,13);//Marro clar
ellipse((posX/2)+130,(posY/2)+118,55,45);
ellipse((posX/2)+30,(posY/2)+118,55,45);
//pupilas
noStroke();
fill(0);//negre
int pupila1=ellipse((posX/2)+130,(posY/2)+118,20,20);
int pupila2=ellipse((posX/2)+30,(posY/2)+118,20,20);
fill(255,255,255);//blanc
//Dents
noStroke();
rect((posX/2)+100,(posY/2)+220,40,34);
//Boca
fill(245,115,91);//Vermell clar
stroke(209,58,32);//Vermell fosc
rect((posX/2)-13,(posY/2)+160,187,70);
//Nas
fill(188,110,13);//Marro clar
stroke(116,77,0);//Marro fosc
ellipse((posX/2)+80,(posY/2)+145,60,50);

  //comprovem la posicio X
  if((posX<0)||(posX>width)){
    velX = -velX;
  } 
    //comprovem la posicio Y
  if((posY<0)||(posY>height)){
    velY = -velY;
  } 

//FUNCIO MOUSE PRESSED
if (mousePressed == true) {
   
   if (posY > mouseY) {
    //cap amunt
    posY = posY - velY;
  }
  if (posY < mouseY) {
    //cap avall
   posY = posY +velY;
  }
  if (posX <mouseX) {
    //dreta
    posX = posX+velX;
  }
  if (posX >mouseX) {
    //esquerra
    posX = posX-velX;
  }

}

}

 


