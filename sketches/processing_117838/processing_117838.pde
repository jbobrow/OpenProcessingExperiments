
//rumskib
PImage rumskib;
PImage startBil; 
PImage livKasse;
float rumskibX = 500;
float rumskibY = 730;
float rumskibFart = 5; 

float point = 0;
float pointB = 0;

ArrayList alleBombe;
float spawningRate = 0.015;
float spawn = 0;
boolean rumskibAlive = true;

ArrayList alleLiv;
float spawningRateLiv = 0.00001;
float spawnLiv = 0;




//random stjerner
float stjerne1X = random(0, 1000);
float stjerne1Y = random(0, 400);

float stjerne2X = random(0, 1000);
float stjerne2Y = random(0, 400);

float stjerne3X = random(0, 1000);
float stjerne3Y = random(0, 400);

float stjerne4X = random(0, 1000);
float stjerne4Y = random(0, 400);

float stjerne5X = random(0, 1000);
float stjerne5Y = random(0, 400);

float stjerne6X = random(0, 1000);
float stjerne6Y = random(0, 400);

float stjerne7X = random(0, 1000);
float stjerne7Y = random(0, 400);

float stjerne8X = random(0, 1000);
float stjerne8Y = random(0, 400);

float stjerne9X = random(0, 1000);
float stjerne9Y = random(0, 400);

float stjerne10X = random(0, 1000);
float stjerne10Y = random(0, 400);

//liv
int liv = 3;

//rekord
String rekord;

//start spil
int startTid = millis();



void setup()
{
  size(1000, 800);
  rumskib = loadImage("Rumskib.png");
  startBil = loadImage("startBil.png");
  livKasse = loadImage("livKasse.png");
  alleBombe = new ArrayList();
  alleLiv = new ArrayList();
}

void draw()
{
  rumskibFart=rumskibFart+0.0002;
  bg();
  
  imageMode(CENTER);
  image(rumskib, rumskibX, rumskibY, 100, 50);

  flytRumskib();
  
  //bomber falder
  bomberFalder();
  
  //Liv falder
  livFalder();
  
  
  
  if(rumskibAlive == false){
    for (int i = 0; i < alleBombe.size(); i++){
    bombe bom = (bombe) alleBombe.get(i);
    bom.alive = false;
    }
    liv = liv-1;
    rumskibAlive = true;
  
  }
  // Game Over
  gameOver();
  livOgPoint();
  
  //start skærm
   if (startTid<400) {

    image(startBil, 500, 400);
    textSize(25);
    fill(255);
    text("Tryk på 'mellemrum' for at starte spillet!", 240, 650);
    noLoop();
  }
}

  //liv og point
  //livOgPoint();
  

  //start skærm
 





//restart
void keyPressed()
{
  if (keyPressed)
  {
    if (key == 'r' || key == 'R') 
    {
      
      spawningRate = 0.1;

      liv = 3;
      pointB = 0;
      //startTid = 2;
      loop();
    }
  }
}
//start spil
void keyReleased() {
  if (key==' ') {
    startTid = 500;
    loop();
  }
}

//bomber falder
void bomberFalder(){
spawningRate = spawningRate+0.00006;
  spawn = spawn+spawningRate;
  while(spawn >= 1){
    bombe b = new bombe();
    alleBombe.add(b);
    spawn--;
  }
  
  for (int i = 0; i < alleBombe.size(); i++){
    bombe bom = (bombe) alleBombe.get(i);
      if(bom.alive == true){
        bom.kor();
    }else{
        alleBombe.remove(bom);
    }
  }
}


void livFalder(){
spawningRateLiv = spawningRateLiv+0.0000001;
  spawnLiv = spawnLiv+spawningRateLiv;
  while(spawnLiv >= 1){
    nytLiv nl = new nytLiv();
    alleLiv.add(nl);
    spawnLiv--;
  }
  
  for (int iLiv = 0; iLiv < alleLiv.size(); iLiv++){
    nytLiv Liv = (nytLiv) alleLiv.get(iLiv);
      if(Liv.livAlive == true){
        Liv.korLiv();
    }else{
        alleLiv.remove(Liv);
    }
  }
}

void gameOver(){
  if (liv == 0) {
    fill(255, 0, 0);
    //textMode(CENTER);
    textSize(62);
    text("Game Over", 330, 330); 
    textSize(25);
    fill(0, 0, 0);
    text("Point: "+pointB, 425, 370);
    textSize(18);
    text("Tryk 'r' for at genstarte", 395, 395);
    

    //stop spil
    noLoop();
  }
}
  void livOgPoint()
  {
    fill(0, 0, 0);
  textSize(28);
  text("Liv:" + " " +liv, 20, 30);

  point = point + 0.05;
 // text("ponit: "+ round(point),20,50);
  text("point: "+ pointB,20,55);
  }

class bombe{
float x;
float y;
boolean alive = true;


  bombe(){
    x = random(5,995);
    y = random(-10,100);
  }
  
  void kor(){
    y = y+random(2,5);
    fill(255,0,0);
    ellipse(x,y,10,10);
    
    if(afstandB(x,y,rumskibX,rumskibY)<25 ){
      rumskibAlive = false;
    }
    
    if(y>800){
      alive = false;
      pointB++;
    }
  }
}



class nytLiv{
float x;
float y;
boolean livAlive = true;



  nytLiv(){
    x = random(5,995);
    y = random(-10,100);
  }
  
  void korLiv(){
    y = y+random(2,5);
    noFill();
    image(livKasse,x,y,20,20);
    ellipse(x,y,10,10);
    
    if(afstandL(x,y,rumskibX,rumskibY)<25 ){
      liv++;
      x = random(5,995);
      y = random(-10,100);
    }
    
    if(y>800){
      livAlive = false;
      pointB++;
    }
  }
}



float afstandB (float x1, float y1, float x2, float y2){
  float r = abs(sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)));
  return r;
}

float afstandL (float x1, float y1, float x2, float y2){
  float r = abs(sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)));
  return r;
}
void bg() {
//himmel
  background(3, 206, 255);

  //sol
  fill(255, 243, 3);
  stroke(0, 0, 0);
  ellipse(170, 70, 60, 60);
  triangle(160, 35, 170, 10, 180, 35);
  triangle(205, 60, 230, 70, 205, 80);
  triangle(135, 60, 110, 70, 135, 80);
  triangle(160, 105, 170, 130, 180, 105);
  //sky
  fill(255, 255, 255);
  noStroke();
  ellipse(300, 125, 40, 40);
  ellipse(285, 95, 40, 40);
  ellipse(310, 87, 40, 40);
  ellipse(320, 115, 40, 40);
  ellipse(280, 115, 40, 40);
  ellipse(330, 97, 40, 40);

  ellipse(460, 105, 40, 40);
  ellipse(445, 75, 40, 40);
  ellipse(470, 67, 40, 40);
  ellipse(480, 95, 40, 40);
  ellipse(440, 95, 40, 40);
  ellipse(490, 77, 40, 40);


  //jord
  fill(0, 200, 0);
  ellipseMode(CENTER);
  ellipse(500, 830, 1100, 130);

  //natte himmel
  if (point%60 > 30 )
  {
    fill(26, 59, 103);
    rect(0, 0, 1000, 800);
    fill(14, 77, 1);
    ellipseMode(CENTER);
    ellipse(500, 830, 1100, 130);
    //måne
    fill(180, 180, 180);
    noStroke();
    ellipse(170, 70, 60, 60);
    fill(26, 59, 103);
    ellipse(185, 70, 60, 60);
    
    tegnStjerne();
  }






}
void flytRumskib()
{
  //flyt rumskib
  if (keyPressed) {
    if (keyCode == LEFT) {
      rumskibX = rumskibX-rumskibFart;
    }

    if (keyCode == RIGHT)
    {
      rumskibX = rumskibX+rumskibFart;
    }
  } 
  if (rumskibX < -10 ) {
    rumskibX = 1009;
  }
  if (rumskibX >= 1010) {
    rumskibX = -9;
  }

}
void tegnStjerne()
{
    //stjerner
    fill(255, 243, 3);
    triangle(stjerne1X, stjerne1Y, stjerne1X+7, stjerne1Y, stjerne1X+4, stjerne1Y-7);
    triangle(stjerne1X, stjerne1Y-5, stjerne1X+7, stjerne1Y-5, stjerne1X+4, stjerne1Y+2);

    triangle(stjerne2X, stjerne2Y, stjerne2X+7, stjerne2Y, stjerne2X+4, stjerne2Y-7);
    triangle(stjerne2X, stjerne2Y-5, stjerne2X+7, stjerne2Y-5, stjerne2X+4, stjerne2Y+2);

    triangle(stjerne3X, stjerne3Y, stjerne3X+7, stjerne3Y, stjerne3X+4, stjerne3Y-7);
    triangle(stjerne3X, stjerne3Y-5, stjerne3X+7, stjerne3Y-5, stjerne3X+4, stjerne3Y+2);

    triangle(stjerne4X, stjerne4Y, stjerne4X+7, stjerne4Y, stjerne4X+4, stjerne4Y-7);
    triangle(stjerne4X, stjerne4Y-5, stjerne4X+7, stjerne4Y-5, stjerne4X+4, stjerne4Y+2);

    triangle(stjerne5X, stjerne5Y, stjerne5X+7, stjerne5Y, stjerne5X+4, stjerne5Y-7);
    triangle(stjerne5X, stjerne5Y-5, stjerne5X+7, stjerne5Y-5, stjerne5X+4, stjerne5Y+2);

    triangle(stjerne6X, stjerne6Y, stjerne6X+7, stjerne6Y, stjerne6X+4, stjerne6Y-7);
    triangle(stjerne6X, stjerne6Y-5, stjerne6X+7, stjerne6Y-5, stjerne6X+4, stjerne6Y+2);

    triangle(stjerne7X, stjerne7Y, stjerne7X+7, stjerne7Y, stjerne7X+4, stjerne7Y-7);
    triangle(stjerne7X, stjerne7Y-5, stjerne7X+7, stjerne7Y-5, stjerne7X+4, stjerne7Y+2);

    triangle(stjerne8X, stjerne8Y, stjerne8X+7, stjerne8Y, stjerne8X+4, stjerne8Y-7);
    triangle(stjerne8X, stjerne8Y-5, stjerne8X+7, stjerne8Y-5, stjerne8X+4, stjerne8Y+2);

    triangle(stjerne9X, stjerne9Y, stjerne9X+7, stjerne9Y, stjerne9X+4, stjerne9Y-7);
    triangle(stjerne9X, stjerne9Y-5, stjerne9X+7, stjerne9Y-5, stjerne9X+4, stjerne9Y+2);

    triangle(stjerne10X, stjerne10Y, stjerne10X+7, stjerne10Y, stjerne10X+4, stjerne10Y-7);
    triangle(stjerne10X, stjerne10Y-5, stjerne10X+7, stjerne10Y-5, stjerne10X+4, stjerne10Y+2);
    
}


