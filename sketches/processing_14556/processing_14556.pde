

// pro web neni opengl nejlepsi na pocitaci bezi dobre ale v prohlizeci ma chyby
//import processing.opengl.*;

//ten zvuk si nejsem jist ale mohl by bezet na webu
import ddf.minim.*;
Minim minim;
AudioInput in;

//TEXT
//font je lepsi udrzet jako globalni hodnotu
PFont font;


// ten obrazek nemam tak jsem to dal pryc ale zde bych udelal PImage IMG; uplne nahoru
// a hlavne ten loadImage() do setup()u
  //IMAGE inside
  //PImage IMG;
  // Images must be in the "data" directory to load correctly
 

 
void setup (){

// P3D namisto OPENGL
  size (480,480, P3D);

  background (255,255,255);
  frameRate (25);
  minim = new Minim(this);
  minim.debugOn();
  in = minim.getLineIn(Minim.STEREO, 512);

// toto je dulezite, zde se cte z disku a to zabira dost casu
// font se vetsinou nacita v setupu protoze to udela jen jednou
// a globalni hodnotou se pak da pouzit kdekoli v kodu
// pro webove ucely neni marne vyuzit i createFont() namisto nacitani z disku
// usetri misto a pokazde se vygeneruje

font = createFont("LucidaConsole",12,true);

// P3D nativne renderuje dost osklive fonty toto to spravi
textMode(SCREEN);

textFont(font);

//IMG = loadImage("frame.tif");

}
 
void draw (){
  background (255,255,255);
  float X = map(mouseX,0,480,0,360);
  float Y = map(mouseY,0,480,0,360);
  float radX = radians(-X);
  float radY = radians(-Y);
  smooth();
 

  // tohle by mozna slo vyresit elegantneji, ale budiz
  //AUDIO REACT
  for(int i = 0; i < in.bufferSize() - 1; i++)
  {

//smycky jsou dost narocne na vypocet kdyz kresli nepotrebne veci
//napr. background se zde vykresli zbytecne 512 * 25 = 12800x za vterinu    
//background(255);

    stroke(0);
    rect (50,430,10,-10-in.right.get(i)*100);
    rect (70,430,10,-10-in.left.get(i)*100);
    float REACT = (in.left.get(i));
  }
 
  String s1 = "ztracený text Lucida Console  12 non-smoothed";
  String s2 = X+"°";
  String s3 = Y+"°";
  fill(0, 0, 0, 255);
  text(s1, 350, 400, 120, 48);
  text(s2, 350, 443, 120, 70);
  text(s3, 350, 455, 120, 70);
  //text(stringdata, x, y, width, height)
 
  //image(IMG, 10, 10, 120, 120);

  //ARC
  strokeWeight(0.5);
  noFill();
  int ARCsize1 = 110;
  int ARCsize2 = 110;
  int ARCsize3 = 110;
  int ARCsize4 = 110;
  arc(240, 240, ARCsize1, ARCsize1, radX, radY);
  arc(240, 240, ARCsize1, ARCsize1, radY, radX);
  arc(240, 240, ARCsize2, ARCsize2, radY+PI/2, radX+PI/2);
  arc(240, 240, ARCsize2, ARCsize2, radX+PI/2, radY+PI/2);
  arc(240, 240, ARCsize3, ARCsize3, radY+PI, radX+PI);
  arc(240, 240, ARCsize3, ARCsize3, radX+PI, radY+PI);
  arc(240, 240, ARCsize4, ARCsize4, radY+PI+PI/2, radX+PI+PI/2);
  arc(240, 240, ARCsize4, ARCsize4, radX+PI+PI/2, radY+PI+PI/2);
  //arc(x, y, width, height, start, stop)
 
  //PERSPECTIVE (none!)
  ortho(-240, 240, -240, 240, -1000, 1000);
  //ortho(left, right, bottom, top, near, far)
 
  //3D
  translate(240, 240, 0);
  rotateX(radY);
  rotateY(radX);
 
  //LIGHT
  float lX = map(mouseX,0,480,-1,1);
  float lY = map(mouseY,0,480,-1,1);
  directionalLight(255, 255, 255, -1, -1, -1);
  //directionalLight(v1, v2, v3, nx, ny, nz)
  //v1  int or float: red or hue value
  //v2  int or float: green or hue value
  //v3  int or float: blue or hue value
  //nx  int or float: direction along the x axis
  //ny  int or float: direction along the y axis
  //nz  int or float: direction along the z axis
  int AL = 230;
  ambientLight(AL,AL,AL);
 
  //CUBE
  //fill(128,128,128,10);
  strokeWeight(1);
  box(150);
 
  //SPHERE
  fill(140,140,140,255);
  strokeWeight(0);
  //noStroke();
  sphere(50);
  sphereDetail(30,30);
 
}
 
 
//save IMAGE
//tady lze udelat jednoduchy zpusob jak zamezit spusteni na webu ukladani obrazku
void mousePressed(){

//jestlize je v appletu na webu ..online?
if(online){
	//tiskni tuto neskodnou hlasku
	println("no go!");
}else{

  /*jinak uloz obrazek.. jeste tady ty krizky budou nahrazeny
 okenkem takze se nebude prepisovat jen jeden stejny file*/

  saveFrame("/data/frame####.tif");
}

}
 

void stop()
{
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  super.stop();
}

