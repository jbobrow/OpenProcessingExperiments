
float colisio = -7;

float cylonx = random(400, 500);
float cylony = random (100, 300);
float posi =440;
float vely =5;
float velx =5;
float velshoot=9;
float shootx = mouseX+60;
float shooty =  mouseY+55;
float shoot2x = mouseX+60;
float shoot2y = mouseY+75;
float sz1= 150;
float sz2= 100;


String s = "CUIDAAAOO!!";
PImage viper;
PImage cylon;
PImage terra;

//disparos VIPER
void shoot (){

  stroke(240, 20, 20);
  strokeWeight (1.5);
  fill(190, 190, 190);
  rect(shootx, shooty, 20, 3); //aixi esta amagat shooty+600
  shootx = shootx+velshoot;
}

//disparos VIPER2
void shoot2 (){

  stroke(240, 20, 20);
  strokeWeight (1.5);
  fill(190, 190, 190);
  rect(shoot2x, shoot2y, 20, 3); //aixi esta amagat shooty+600
  shoot2x = shoot2x+velshoot;
}

void setup () {
  size(1000, 510);
  stroke(137, 19, 41);
  noCursor();
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  viper = loadImage("vipermark2.png");
  cylon = loadImage("Raider.png");
  terra = loadImage("BarcelonaBN.png");
}


void draw () {
  background(mouseX/15, mouseX/15, mouseX/6);

  //viper_______________________________________________
  viper.resize(120, 80);
  image (viper, mouseX, mouseY);

  //terra________________________________________________
  imageMode (CORNER);
  image(terra, -60, mouseY/colisio*1+350);

  //text__________________________________________________
  float mov = 500-mouseY*0.4;
  textSize(32);
  if  (mouseY>=300) {    
    fill(random(80, 250), random(80, 250), 0);
    text(s, mouseX+40, mov);
  } else {
    text(s, 600, 600, 0, 0);
  }


  //cylon________________________________________

imageMode(CENTER);
  cylon.resize(120, 80);
  cylonx = cylonx + velx;
  cylony = cylony + vely;
  image (cylon, cylonx, cylony);

  //per a que torni
  if (cylonx >= width - 50 || cylonx <= 50) {
    velx = -velx;
  }
  if (cylony>=height/colisio*1+490 || cylony<=40) {

    vely = -vely;
  }
 shoot();
 shoot2 ();
 
 //cylon vs viper
 if (cylonx == mouseX*10 || cylony == mouseY*10) {
   cylon.resize(0,0);
 }
}

void mousePressed () {
   shootx = shootx+velshoot;
   shootx = mouseX;
   shooty = mouseY;
   
   shoot2x = shoot2x+velshoot;
   shoot2x = mouseX;
   shoot2y = mouseY+20;
  
}
//posarhi el so?



