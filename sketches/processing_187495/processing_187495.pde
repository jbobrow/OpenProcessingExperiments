

/**  ---------------------------------------------
*
*  Sam Shlomo Spaeth  
*   NYU Intro to Interactive Datavis Spring 2015 
*   Lesson 4: Mapping Basic Charts #1
*   sam.spaeth@gmail.com
--------------------------------------------------*/

//DATA

int[] myNumbers;


//LAYOUT
// [0] top, [1] right, [2] bottom, [3] left
float[] margins = { 75, 75, 75, 75};
PFont font;
PShape worldMap;


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
         ellipse(i * cArea + margins[3] , height/2, cArea, cArea);  
    
       //text
         fill(255);
         textFont(font, xNumbers*3);
         textSize(xNumbers+10);
         text(xNumbers/2, i * cArea + margins[3] , height/2 + xNumbers/2);   
    
       String[] myCities = loadStrings("lesson_4_cities.txt");
       //for(int c = 0  ; c < myCities.length ; c = c +1  ){
       
       textAlign(CENTER);
       textSize(10);
       text(myCities[i], i* cArea + margins[3] , height/2 + 50  );
       println(myCities[i]);
       //}    
    } 

}



