
/*********Note to self**********
Determine how to cycle through postionsA-D if I were to switch 
all of x's control to mouseX, rather than if ((x>=0)&&(x<=19)){,
etc., in order to tigten up code, drastically shortening "Bench 
Walking Sequence" part of sketch*/

/*************************DECLARATION*************************/
float x = 0.0; //bench's x location
float targetX; //the x-direction of bench
float easing = 0.04; //the easing of...

/***************************SETUP****************************/
void setup () {
  size (800,300);
  smooth ();
  stroke (0);
  strokeWeight (3);

}

/****************************DRAW*****************************/
void draw () {
  noCursor();
  background (255);
  fill (0);
  rect (0,273, 800,300); //ground plane
  
/*****Person Walking*****/ 
//person moving left
if (x > mouseX) {
  PImage imgP1 = loadImage ("person-001.gif");
  image (imgP1, mouseX-80, 152); //-80 determines buffer b/t bench and person
}
//person moving right  
if (x < mouseX) {
  PImage imgP2 = loadImage ("person-002.gif");
  image (imgP2, mouseX+25, 152); //25 determines buffer b/t bench and person
}

/*****Bench Walking Sequence*****/
//easing bench
float targetX = mouseX;
float dx = targetX - x; //distance from position and target
if (abs(dx) > 1.0) {
  x += dx * easing;
}
//bench moves similarly in either left or right x-direction
if ((x > mouseX) || (x < mouseX)) { 
  
translate (0,235);
/*****Section 1/10*****/
translate (0,0);
if ((x>=0)&&(x<=19)){
  positionA (20,0);
}
if ((x>=20)&&(x<=39)){
  positionB (40,0);
}
if ((x>=40)&&(x<=59)){
  positionC (60,0);
}
if ((x>=60)&&(x<=79)){
  positionD (80,0);
} 
/*****Section 2/10*****/  
translate (80,0);
if ((x>=80)&&(x<=99)){
  positionA (20,0);
}
if ((x>=100)&&(x<=119)){
  positionB (40,0);
}
if ((x>=120)&&(x<=139)){
  positionC (60,0);
}
if ((x>=140)&&(x<=159)){
  positionD (80,0);
}
/*****Section 3/10*****/  
translate (80,0);
if ((x>=160)&&(x<=179)){
  positionA (20,0);
}
if ((x>=180)&&(x<=199)){
  positionB (40,0);
}
if ((x>=200)&&(x<=219)){
  positionC (60,0);
}
if ((x>=220)&&(x<=239)){
  positionD (80,0);
}
/*****Section 4/10*****/  
translate (80,0);
if ((x>=240)&&(x<=259)){
  positionA (20,0);
}
if ((x>=260)&&(x<=279)){
  positionB (40,0);
}
if ((x>=280)&&(x<=299)){
  positionC (60,0);
}
if ((x>=300)&&(x<=319)){
  positionD (80,0);
}
/*****Section 5/10*****/  
translate (80,0);
if ((x>=320)&&(x<=339)){
  positionA (20,0);
}
if ((x>=340)&&(x<=359)){
  positionB (40,0);
}
if ((x>=360)&&(x<=379)){
  positionC (60,0);
}
if ((x>=380)&&(x<=399)){
  positionD (80,0);
}
/*****Section 6/10*****/  
translate (80,0);
if ((x>=400)&&(x<=419)){
  positionA (20,0);
}
if ((x>=420)&&(x<=439)){
  positionB (40,0);
}
if ((x>=440)&&(x<=459)){
  positionC (60,0);
}
if ((x>=460)&&(x<=479)){
  positionD (80,0);
}
/*****Section 7/10*****/  
translate (80,0);
if ((x>=480)&&(x<=499)){
  positionA (20,0);
}
if ((x>=500)&&(x<=519)){
  positionB (40,0);
}
if ((x>=520)&&(x<=539)){
  positionC (60,0);
}
if ((x>=540)&&(x<=559)){
  positionD (80,0);
}
/*****Section 8/10*****/  
translate (80,0);
if ((x>=560)&&(x<=579)){
  positionA (20,0);
}
if ((x>=580)&&(x<=599)){
  positionB (40,0);
}
if ((x>=600)&&(x<=619)){
  positionC (60,0);
}
if ((x>=620)&&(x<=639)){
  positionD (80,0);
}
/*****Section 9/10*****/  
translate (80,0);
if ((x>=640)&&(x<=659)){
  positionA (20,0);
}
if ((x>=660)&&(x<=679)){
  positionB (40,0);
}
if ((x>=680)&&(x<=699)){
  positionC (60,0);
}
if ((x>=700)&&(x<=719)){
  positionD (80,0);
}
/*****Section 10/10*****/  
translate (80,0);
if ((x>=720)&&(x<=739)){
  positionA (20,0);
}
if ((x>=740)&&(x<=759)){
  positionB (40,0);
}
if ((x>=760)&&(x<=779)){
  positionC (60,0);
}
if ((x>=780)&&(x<=799)){
  positionD (80,0);
}
/*****Sequence Over*****/
}}


/**************************FUNCTION**************************/

void positionA (int x, int y) {
  strokeWeight (3);
  stroke (150); //shade 
  line (20,0, 40,30); //leg a: \
  stroke (0);   //shade 
  line (20,0, 0,30);  //leg b: /
  line (0,0, 40,0);  //bench seat: -
}

void positionB (int x, int y) {
  stroke (150);
  line (40,0, 40,30); //leg a: |
  stroke (0);
  line (40,0, 40,30); //leg b: |
  line (20,0, 60,0); //bench seat: -
}  

void positionC (int x, int y) {
  stroke (150);
  line (60,0, 40,30); //leg a: /
  stroke (0);
  line (60,0, 80,30); //leg b: \
  line (40,0, 80,0); //bench seat: -
}

void positionD (int x, int y) {
  stroke (150);
  line (80,0, 80,30);  //leg a: |
  stroke (0);
  line (80,0, 80,30); //leg b: |
  line (60,0, 100,0); //bench seat: -
}

