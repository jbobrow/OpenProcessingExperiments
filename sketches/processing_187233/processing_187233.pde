
/**  ---------------------------------------------
*
*  Sam Shlomo Spaeth  
*   NYU Intro to Interactive Datavis Spring 2015 
*   Lesson 4: Mapping Basic Charts #1
*   sam.spaeth@gmail.com
--------------------------------------------------*/

//DATA

int[] myNumbers;
PShape worldMap;

//LAYOUT
// [0] top, [1] right, [2] bottom, [3] left
float[] margins = { 50, 50, 50, 50};
PFont font;


void setup(){
  size(550,300);
  worldMap = loadShape("worldMap.svg");
  background(35, 60, 80);
  font = loadFont("BrowalliaNew-Italic-48.vlw");

  String[] stringData = loadStrings("data.txt");
  myNumbers = new  int [stringData.length];


  for(int i = 0; i <= stringData.length - 1; i += 1){
    myNumbers[i] = parseInt(stringData[i]);
  }

  
  // test myNumbers are numeric 
  println(myNumbers[2]+myNumbers[3]+myNumbers[4]);
  
}


void draw(){
  
  //BG map
  worldMap.disableStyle();  // Ignore the colors in the SVG
  fill(45,80,110);    // Set the SVG fill to blue
  stroke(80, 120 , 160);          // Set the SVG fill to white
  shape(worldMap, 0,0,550,300);
    
   toCircle();
   noLoop();
}


void toCircle(){
    for( int i = 0 ; i <= myNumbers.length -1 ; i += 1) {
         int xNumbers = myNumbers[i]; 
         float cArea = (xNumbers/2) * (xNumbers/2)* PI; 
        
         //STYLE
         colorMode(HSB);
         noStroke();
         fill(190,100,i*(width/myNumbers.length));
       
            
        //Draw ellipses
         ellipse(i * cArea , height/2, cArea, cArea);  
     
        //scale down
         map (cArea,                   // input 
        0, max(myNumbers),      // input range
        0, 20);                // output range  
     
       //text
         fill(255);
         textFont(font, xNumbers*3);
         text(xNumbers, i * cArea , height/2 + xNumbers/2 );
         textSize(xNumbers+10);
         
       // println(cArea);     
     
    } 

/* float alignX(int n){
  return map(n,                                   // input
             0, max(myNumbers),                   // input range
             0, width - margins[1] - margins[3]);//output range
}

*/



}

