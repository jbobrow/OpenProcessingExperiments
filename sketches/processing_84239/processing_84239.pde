
/* 
Ecosystem simulation based on object interaction code by Keith Peters  
with extra ideas from the work of Daniel Shiffman and Rafael Cosman
   
Geo Meadows - Iss A 28Dec2012
*/

float framerate = 25;
int numlifeform = 100; //initial number of humans
int maleRatio = 50; //male percent
int carnRatio = 90; //carnivor percent
int meatFactor = 7; //food required to feed a carnivor relative to a veggie
int numFood = 3; //number of food outlets
int generations = 15;//number traced on screen
int living=0; // current total
int deadCnt=0; //all time total
int[] gencnt = new int[generations]; 
int[] genage = new int[generations]; 
float spring = 0.2; //collision springback
float gravity = 0.05; //pull towards centre
float maxSpeed = 10; 
int foodColor = 42;
int foodSize = 40; //initial food size
int biteSize = 4; //how much food is taken each time
int maxFoodSize; //limit foodstall size
int newlifeSize = 30; //size at birth
int maxHumanSize = 60; //size full grown
int matingSize = 20; //min size for successful mating
int maturity; //age at which children possible
int infertile = 80; //age beyond which no offspring result
float maxAge; //max age of survival
float childGap; //gap between having children
int generation = 1; //first generation number
int growthRate = 10; //humans grow by this amount when fed
float sunPower = 2000; //max useable energy from sun
float energy = 2000; //initial energy level
float energyGen = 2;//rate at which to generate energy from sun
float recycleValue = 5     ; //amount by which we increase energy level if someone dies
int foodDelay = 25; //framecount delay after being nibbled
int energyMax; //max stored energy
boolean pause=false;
boolean allowSolar=true;
boolean allowGraph=false;
boolean allowAudio=false;
//arrays to hold graph data
int[] g_alive = new int[0];
int[] g_energy = new int[0];
int[] g_food = new int[0];
int[] g_veggies = new int[0];

Human[] lifeform = new Human[5000]; //array called 'lifeform' of object type 'Human'
Food[] vegFood = new Food[numFood]; //array of food outlets

PFont font1;
PImage fcarn,mcarn,fcarnd,mcarnd,mveg,fveg,fvegd,mvegd,sun,fcarno,fvego;

///////////////////////////////////////////////////
void setup() {
  size(1000, 600);
  noStroke();
  smooth();
  colorMode(HSB);
  frameRate(framerate);
 
  maxFoodSize=width/(numFood+1);
  energyMax = height;
  childGap=5;
  maturity=15;
  maxAge=70;
  
  font1 = loadFont("ArialMT-14.vlw");    
  fcarn = loadImage("fcarn2.png");
  mcarn = loadImage("mcarn2.png");
  fcarnd = loadImage("fcarn2-dead.png");
  fcarno = loadImage("fcarn2-o.png");
  mcarnd = loadImage("mcarn2-dead.png");
  fveg = loadImage("fveg2.png"); 
  fvego = loadImage("fveg2-o.png"); 
  mveg = loadImage("mveg2.png");
  fvegd = loadImage("fveg2-dead.png");  
  mvegd = loadImage("mveg2-dead.png");
  sun = loadImage("sol.png");
  
 //create foodstalls
  for (int i = 0; i < numFood; i++) {
   vegFood[i] = new Food(150+width/numFood*i, (height/2)-20, foodSize, i, 60);
  } 
  //create lifeforms
    for (int i = 0; i < numlifeform; i++) {
    Boolean mgender = false; if (random(0,100) < maleRatio) mgender = true;
    Boolean carnivor = false; if (random(0,100) < carnRatio) carnivor = true;
    Boolean deadCnted = false; 
    lifeform[i] = new Human(random(width), random(height), random(10,newlifeSize), i, lifeform, 
    random(1,10), random(1,10), mgender, carnivor, deadCnted, random(0,10), 0 ,1);
  }
 }
////////////////////////////////////////////////////
void draw() {
  background(150);
  living=0; deadCnt=0;
  for (int i = 0; i < numlifeform; i++) {
    if (!pause) {
    lifeform[i].collide();  //bounce off fellows
    lifeform[i].move();
    lifeform[i].age();
    lifeform[i].findFood();
    }
    lifeform[i].display(); 
    if (lifeform[i].gap > 0 ) { lifeform[i].gap -= 1; }
    if (lifeform[i].dead) { deadCnt ++; }
    else living++;
  }  

  for (int i = 0; i < numFood; i++) {
    vegFood[i].display();
    if (!pause) { vegFood[i].grow(); }
    if (vegFood[i].delay > 0) vegFood[i].delay -= 1;
  }  
  if (allowSolar &&(energy<energyMax)) energy += (sunPower/framerate)/(2*living+50); 
    
  //display parameters
  if (allowSolar) image(sun,width/2-32,64,64,64);
  textFont(font1);
  fill(255,255,32);
  rect(4,height,6,-energy);  
  text("EnergyStore=" + int(energy) + "  Living=" + living + "  Dead=" + deadCnt +"  Years=" + int(frameCount/framerate), 2, 14);  
  
  int n=35;//gap between data displays
  
  //Display gap between children
  fill(255,0,0);
  rect(width-16,170-(childGap*5),16,-10);  
  fill(255,0,255);
  rect(width-20,60,8,105);
  text("GAP",width-30,180); 
  text(str(int(childGap)),width-24,194);
  
  //Display age of maturity
  fill(255,0,0);
  rect(width-16-n,196-(maturity*3),16,-10);  
  fill(255,0,255);
  rect(width-20-n,60,8,105);
  text("MAT",width-30-n,180); 
  text(str(int(maturity)),width-24-n,194);
  
  //Display age of death
  fill(255,0,0);
  rect(width-16-n*2,228-(maxAge*2),16,-10);  
  fill(255,0,255);
  rect(width-20-2*n,25,8,140);
  text("DED",width-30-2*n,180); 
  text(str(int(maxAge)),width-24-2*n,194);
  
   //Display Veggies
  fill(255,0,0);
  rect(width-16-n*3,168-((100-carnRatio)),16,-10);  //marker rect
  fill(85,255,128);
  rect(width-20-3*n,60,8,105); //scale line
  text("VEG",width-30-3*n,180); 
  text(str(int(100-carnRatio)),width-24-3*n,194);
  
  fill(255,0,255);
  for (int k=0; k<generations; k++) {
    gencnt[k] = 0; 
    genage[k] = 0;    
    for (int i = 0; i < numlifeform; i++) {
       if ( (lifeform[i].gen == k+1) && !lifeform[i].dead) {
       gencnt[k] ++;   
       genage[k] += lifeform[i].age;
     }
   }
   if (!allowGraph) {
   strokeWeight(0);
    rect(12+(k*8),height,6,-gencnt[k]);
   }
    text(" N"+str(k+1)+"="+str(gencnt[k]),k*56,40);
    text(" A"+str(k+1)+"="+str(genage[k]/(1+gencnt[k])),k*56,60);
  }  
 
//record stats every second
  if (frameCount%framerate == 0) {
    g_alive = append(g_alive,living);
    g_energy =append(g_energy,int(energy));
    int food=0;
    for (int i = 0; i < numFood; i++) food = food + int(vegFood[i].store);
    g_food = append(g_food,food);
    g_veggies = append(g_veggies,100-carnRatio);
  }
  
  //display curves
  if (allowGraph) { 
    int j=0;
    if (g_alive.length > width) {j = g_alive.length-width; }
    println(g_alive.length);
    for (int i=1; i<g_alive.length-1; i++) {
      strokeWeight(2);
      stroke(255,0,255);
      line(i-1,height-g_alive[i-1]/2, i,height-g_alive[i]/2);
      
      stroke(foodColor,255,255);
      line(i-1,height-g_food[i-1]/2,i,height-g_food[i]/2);
      
      stroke(85,255,128);
      line(i-1,height-g_veggies[i-1]*2,i,height-g_veggies[i]*2);
     }    
  }
}


//////////////////////////////////////////////////////

void  keyPressed () {
    if (key == ' ') {pause = !pause;} //toggle pause
    if  (key == 's') allowSolar = !allowSolar; //toggle solar energy
    if  (key == 'c') allowGraph = !allowGraph; //toggle curves
    if (key == 'G') { if (childGap<20) childGap++; }
    if (key == 'g') { if (childGap>1) childGap--; }
    if (key == 'm') { if (maturity>10) maturity--; }
    if (key == 'M') { if (maturity<(42)) maturity++; } 
    if (key == 'd') { if (maxAge>30) maxAge--; }
    if (key == 'D') { if (maxAge<99) maxAge++; }
    if (key == 'v') { if (carnRatio<99) carnRatio++;}
    if (key == 'V') { if (carnRatio>=1) carnRatio--;}
   }



