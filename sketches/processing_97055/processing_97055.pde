
//variables del dibuix
int x;
int posX, posY, velX, velY;
color colorR,colorG,colorB,color1;

 
//inici de les variables
void setup()
{
  x=0;
  size(600, 600);
  noCursor();//per tal que el cursor no apareixi a la pantalla
  posX=width/2;
  posY=height/2;
  velX=2;
  velY=2;
  colorR=223;colorG=255;colorB=18;
}
 
 
void draw()
{
  background(64,183,posY);//fons del dibuix el qual canvia de color segons la posició Y del objecte
  noStroke();
 //sombra dels nuvols 
  fill(139,84,0);rect(0,495,600,495);
  fill(160,99,8);rect(0,505,600,505);
  fill(165,105,15);rect(0,520,600,520);
  fill(170,110,21);rect(0,555,600,555);

fill(209,202,202);
ellipse(300,110,90,40);
ellipse(320,130,110,30);
ellipse(320,100,90,40);
ellipse(370,130,90,40);

ellipse(80,410,60,40);
ellipse(115,430,70,20);
ellipse(120,410,90,25);
ellipse(175,420,80,25);

ellipse(390,310,100,30);
ellipse(420,330,115,40);
ellipse(420,310,95,40);
ellipse(470,330,85,40);

//forma dels nuvols

fill(255);
noStroke();
ellipse(310,100,90,40);
ellipse(330,120,110,30);
ellipse(330,90,90,40);
ellipse(380,120,90,40);

ellipse(90,400,60,40);
ellipse(125,420,70,20);
ellipse(130,400,90,25);
ellipse(185,410,80,25);

ellipse(400,300,100,30);
ellipse(430,320,115,40);
ellipse(430,300,95,40);
ellipse(480,320,85,40);
  
  //actualització de les posicions
  posX=posX+velX;
  posY=posY+velY;
 
 
 
  // forma i color de les ales
  fill(10,60,130,80); noStroke();
  ellipse(posX-27,posY-5,width/15,height/15);ellipse(posX+25,posY-5,width/15,height/15);
  ellipse(posX-27,posY+10,width/15,height/15);ellipse(posX+25,posY+10,width/15,height/15);
 
 
  noStroke();fill(colorR,colorG,colorB);ellipse(posX,posY,width/12,height/9);
  
  stroke(1);
  
  //forma de la punta de les antenes
  ellipse(posX-19,posY-45,width/90,height/80);ellipse(posX+16,posY-45,width/90,height/80);
  
  
  //color dels ulls i i forma de les antenes
  line(posX-11,posY-33,posX-19,posY-45);
  line(posX+10,posY-33,posX+16,posY-45);
  fill(255);ellipse(posX-5,posY-18,width/80,height/80);
  ellipse(posX+5,posY-18,width/80,height/80);
  
  
  // marques del cos
  strokeWeight(2);
  line(posX-25,posY,posX+25,posY);
  line(posX-24,posY+10,posX+23,posY+10);
  line(posX-21,posY+20,posX+20,posY+20);
  
//definim la posició en la horitzontal per tal que reboti quan toca el terra
  if((posX<width/25+25)||(posX>width-45)){velX=-velX; }if((posY<height/30+35)||(posY>height-140)){velY=-velY;
  }
}
void mousePressed() {//per tal que el dibuix canvi de color 
  if (color1 == 0) {
    colorR = int(random(0,223));colorG = int(random(0,255)); colorB = int(random(0,18)); } else 
    {
    colorR = 223;colorG = 255;colorB = 18;}
}



