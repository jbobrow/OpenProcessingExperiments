
/* 
 Gloobers are quite colorful creatures,
 They change color in a pulsating fashion;
 Press any key to watch a miniGloober descend from MamaGloober
 If you press the any key multiple times, multiple MiniGloobers will descend from MamaGloober
 Press your mouse anywhere on the screen to see what MamaGloober has to say..
 Make sure you keep pressing your mouse - today MamaGloober has a LOT to say
 */

MiniGloobers[] gloober = new MiniGloobers[25];
int gloober2Activate = 0;

//Mama Gloober's messages
MamaGlooberSays mamaSays = new MamaGlooberSays();
int mes2Give = 0;  //keep track of current message
String[] messages = new String[]{
  "Oh my LANTA!",
  "Whoaaa boy!",
  "Don't look at ME",
  "with THAT",
  "tone of voice!",
};


float x;
float y;
// current color
float colorR;
float colorG;
float colorB;
//starting color
float colorR0 = 8;
float colorG0 = 232;
float colorB0 = 250;
//ending color
float colorR1 = 233;
float colorB1 = 250;
float colorG1 = 8;
float z = 0;
float dz = 1; 
float nShades = 15;


void setup(){
  size(900,700);
  smooth();
  noStroke();
  x=width/2;
  y=(height/2)-100;
  
  //miniGloobers
  for(int i=0; i<gloober.length; i++){
    gloober[i] = new MiniGloobers(
    x,y,
    random(0,5),2,
    .5,.5,
    random(-1,1) < 0 ? -1:1,
    .15);
  }
}

void draw(){
  background(255);
  //draws mamaGloober
  drawMamaGloober(width/2,(height/2)-150, colorR, colorG, colorB);
  //draws talk bubble
  mamaSays.draw();


  for(int i=0; i<gloober.length; i++){
    gloober[i].draw(colorR, colorG, colorB);
    gloober[i].updateGloober();
  }


  //changing colors of gloobers

  z += dz;
  if(z > nShades){
    z = nShades;
    dz = -1;
  }
  if(z < 0){
    z = 0;
    dz = 1;
  }

  colorR = ((colorR1-colorR0)/nShades)*z+colorR0;
  colorG = ((colorG1-colorG0)/nShades)*z+colorG0;
  colorB = ((colorB1-colorB0)/nShades)*z+colorB0;
}

//if key is pressed, MamaGloober births a new MiniGloober

void keyPressed(){
  gloober[gloober2Activate].activate();
  gloober2Activate += 1;
  gloober2Activate %= gloober.length;
}

//if the mouse is pressed, MamaGloober has a word or two that she'd like to say 

void mousePressed(){
  mamaSays.activateMama();
  mamaSays.mamaSays(messages[mes2Give]);
  mes2Give += 1;
  mes2Give %= messages.length;  //resets Mama Gloober's messages 
}
















