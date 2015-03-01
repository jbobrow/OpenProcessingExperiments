
/**  ---------------------------------------------
*
*  Sam Shlomo Spaeth  
*   NYU Intro to Interactive Datavis Spring 2015 
*   Lesson 4: Mapping Basic Charts #1
*   sam.spaeth@gmail.com
*   lesson_4_Circle_Relationships_v09
--------------------------------------------------*/

//DATA

int[] myNumbers;


//LAYOUT
// [0] top, [1] right, [2] bottom, [3] left
float[] margins = { 75, 75, 75, 75};
PFont fontPopulation;
PFont fontCities;
PShape worldMap;
int bgWidth = 1000;
int bgHeight = 400;

void setup(){
  size(bgWidth,bgHeight);
  worldMap = loadShape("worldMap.svg");
  background(35, 60, 80);
  fontPopulation = loadFont("Dialog.plain-48.vlw");
   fontCities = loadFont("Aharoni-Bold-48.vlw");

  String[] stringData = loadStrings("lesson_4_population.txt");
  myNumbers = new  int [stringData.length];


  for(int i = 0; i <= stringData.length - 1; i += 1){
    myNumbers[i] = parseInt(stringData[i]);
  }

    //BG map
  worldMap.disableStyle();  // Ignore the colors in the SVG
  fill(45,80,110);    // Set the SVG fill to blue
  stroke(80, 120 , 160);          // Set the SVG fill to white
  shape(worldMap, 0,0,bgWidth,bgHeight);
  
}


void draw(){
      
   toCircle();

}


void toCircle(){
    for( int i = 0 ; i <= myNumbers.length -1 ; i += 1) {
         int xNumbers = myNumbers[i]/1000000*2; 
        
       
               
         float x = alignX(i);      
        
        //draw base size
        fill(0,40);
         noStroke();
        ellipse( x, height/2, max(myNumbers)/1000000*2, max(myNumbers)/1000000*2);  
    
        //STYLE
        colorMode(HSB);
        noStroke();
        fill(190,100,i*(width/myNumbers.length )+ 50);
               
        //Draw ellipses
         ellipse( x, height/2, xNumbers, xNumbers);  
    
       //Citi Population Numbers 
         fill(255);
         textFont(fontPopulation, xNumbers*3);
         textSize(12);
         textAlign(CENTER);
         text(myNumbers[i], x , height/2 - xNumbers);   
    
    
       //Cities
       String[] myCities = loadStrings("lesson_4_cities.txt");
       //for(int c = 0  ; c < myCities.length ; c = c +1  ){
       
       textAlign(CENTER);
       textFont(fontCities);
       textSize(15);
       text(myCities[i], x, height/2 + xNumbers + xNumbers/3 );
       println(myCities[i]);
       //}    
       noLoop();
    } 
}

float alignX(int n){
  return map(n,                                                 // input
             0, myNumbers.length - 1,                           // input range
             margins[3], width  - margins[3] );     // output range
}


