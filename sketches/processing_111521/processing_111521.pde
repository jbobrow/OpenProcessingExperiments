
//2SENTENCES
//create flowers in different tones from rose to purple.
//you need to press the mouse for starting to create and press 1,2 or 3 to choose the colour
//START TO CREATE A PICTURE!! (Pulse s for saving and c for clearing)

float velocidad = 0.05;//incremento de angulo
float dim;//diametro 
float RESISTENCIA ;
float NUM_TALLOS = 5;
int longitud ;
float inc= 0.4;
float posX; 
float posY;
color strokeColor;
color strokeColor2;
float brushHue;
void setup() {
  size(800, 800);// sketch size
  dim = width/4;//diametro
  longitud=width/2;//diameter
  RESISTENCIA = width/50;
  smooth();//suavizado
  colorMode(HSB, 360, 100, 100, 100);
  strokeColor=color(354,67,80,10);
  strokeColor2=color(313,57,19,10);
  noFill();
  background(284,51,15,10);
 }
 
void draw() {
  if(mousePressed){
      translate(width/2,height/2);//trasladate coordenates to the middle of the screen
      inc += velocidad;//increase radio
      float angle = sin(inc) / RESISTENCIA;//calculate angle
    //draw an ellipse with width > dim y length > dim. on coordenates 0,0
      for (int i = 0; i < NUM_TALLOS; i++) {//loop since 0 to 8, increase 1
    //function tallo with inputs parameters
    //float x> horizontal position,float y> vertical position, int longitud, float angle>angulo
        tallo(0,-dim/2, longitud, angle);
        rotate(TWO_PI/NUM_TALLOS);//rotate
       }
      ellipse(0,0,angle,angle);
      //if (velocidad > 10) inc = inc * -1;;
      println("velocidad" +velocidad+" angle:"+ angle);
    }}
    
void tallo(float x,float y, int longitud, float angle) {
  pushMatrix();
  translate(x, y);
  for (int i = longitud; i > 0; i--) {
    strokeWeight(i/150);
    stroke(strokeColor); 
    line(0, 0, 0, -4);//line with starting (0,0) and ending(0-4)
    strokeWeight(i/100);
    stroke(strokeColor2);
    line(0,0,-10,0);//line with starting (0,0) and ending(4-0)
    translate(0, -4);
    rotate(angle);
  }
  popMatrix();
}


// keyboard input
void keyPressed() 
{
  // if s is pressed
  if(key == 's') {
    //  screenshot
    saveFrame("MyMasterpiece-######.png"); 
  }
  // if c is pressed
  if(key == 'c') {
    // clearing screen
    background(284,51,15,10); 
  }
 // Change color with numbers, 1, 2, 3
 switch(key){
 case '1':
   strokeColor=color(43,31,98,10);
   strokeColor2=color(354,67,80,10);
 break;
 case '2':
   strokeColor=color(18,34,90,10);
   strokeColor2=color(340,57,45,10);
 break;
 case '3':
   strokeColor=color(354,67,80,10);
   strokeColor2=color(313,57,19,10);
 break;
 }
 }
