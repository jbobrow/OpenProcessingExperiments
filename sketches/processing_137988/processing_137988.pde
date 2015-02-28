
/*****************************************************
Artist Statement:
  I am interested in the landscape of my memory and how the place where I currently 
  live is similar/dissimilar from where I grew up. I have been thinking about the
  way our brains operate, how at the core, our brains are just electrical impulses. 
  The more you access a memory, the more your brain overwrites it and alters it, so
  our memories are not even true. I am combining my memories of where I am now with my 
  memories of where I have been, and mingling past and present completely unintentionally,
  but at the expense of a lived truth. 
*****************************************************/


//------------------Global Variables------------------
float n = 0;
float p = 0;
float timer1 = 0;
float delay1 = 1000/3f; //3 fps
float timer2 = 0;
float delay2 = 1000/.3f; //.3 fps

color[] spiralpalette=
{#FFF97E, #F4F294, #E9EBA9, #DFE4BF, #D4DDD4, #C9D6EA, #D4DDD4, #DFE4BF, #E9EBA9, #F4F294};
color[] glowpalette=
{#F4F294, #E9EBA9, #DFE4BF, #D4DDD4, #C9D6EA, #b8cff2, #C9D6EA, #D4DDD4, #DFE4BF, #E9EBA9};

color coastcolor = #CBBF8C;
color watercolor = #6783AF;

PImage trees;
PImage fogtrees;
PImage waves;
PImage wavecaps;
PImage coast;
PImage rockycoast;

PFont garamond;

StringList narrative;


//------------------Setup()------------------
void setup(){
  size(1060, 800);
  background(#b8cff2);

  //load images
  trees = loadImage("trees.png");
  waves = loadImage("waves.png");
  wavecaps = loadImage("wavecaps.png");
  coast = loadImage("coast.png");
  rockycoast = loadImage("rockycoast.png");
  fogtrees = loadImage("fogtrees.png");
  garamond = loadFont("AGaramondPro-Italic-48.vlw");
  
  narrative = new StringList();
  narrative.append("I have always lived in coastal areas");
  narrative.append("I have vivid memories of looking out over the water");
  narrative.append("but I can't tell where it is I am");
  narrative.append("the more I try to remember a the specifics of the places");
  narrative.append("the more they all become the same");
  
//-----image-----
  noStroke();
  
  //water
  fill(watercolor);
  rect(0,520,1060,300);
  
  //trees
  image(trees,0,0);

  //coast
  image(coast,0,0);

}

//------------------Draw()------------------
void draw(){
  
 if(millis()> timer1){
   fill(glowpalette[int(p)]);
   ellipse(300,300,150,150);
   fill(spiralpalette[int(p)]);
   p = (p+1) % 9;
   ellipse(300,300,100,100);
   timer1+=delay1;
 }
 
 
 if(millis()> timer2){

   fill(#999999);
   rect(200,700,670,75,100);
 
   String story = narrative.get(int(n));
   textFont(garamond);
   fill(#333333);
   textSize(32);
   textAlign(CENTER);
   text(story, 530,750);
   n = (n+1) % 5;
   timer2+=delay2;
 }
 

}

//------------------mouseReleased()------------------
void mouseReleased(){
  color testcolor= get(mouseX, mouseY);
  //coastline
  if(testcolor == #CBBF8C)
  {
    image(rockycoast,0,0);
  }
  //rockycoastline
  if(testcolor == #AEAEA8)
  {
    image(coast,0,0);
  }
  if(testcolor == #595957)
  {
    image(coast,0,0);
  }
  if(testcolor == #D1D1CB)
  {
    image(coast,0,0);
  }
  if(testcolor == #7b7b76)
  {
    image(coast,0,0);
  }
  //water
  if(testcolor == #6783AF)
  {
    image(wavecaps, 0, 0);
    image(waves,0,0);
    watercolor=#8196B7;
  }
    if(testcolor == #8196B7)
  {
    watercolor=#9AA9BF;
  }
    if(testcolor == #9AA9BF)
  {
    watercolor=#6783AF;
  }
  //trees
    if(testcolor == #005e20)
  {
    image(fogtrees,0,0);
  }
    if(testcolor == #013613)
  {
    image(fogtrees,0,0);
  }
    if(testcolor == #024a1b)
  {
    image(fogtrees,0,0);
  }
    if(testcolor == #01260e)
  {
    image(fogtrees,0,0);
  }
  //trees with fog
    if(testcolor == #2e3530)
  {
    image(trees,0,0);
  }
    if(testcolor == #2b2f2d)
  {
    image(trees,0,0);
  }
    if(testcolor == #2d332e)
  {
    image(trees,0,0);
  }
    if(testcolor == #2b2d2a)
  {
    image(trees,0,0);
  }

}

void mouseDragged(){
  color testcolor= get(mouseX, mouseY);
  //sky drawing
  if (testcolor == #b8cff2)
{
  fill(#ffffff);
  ellipse(mouseX, mouseY, 10,10);
}

  
}

void keyReleased(){
  if (key =='s'){
  saveFrame("screenshot###.png");
  }
}


