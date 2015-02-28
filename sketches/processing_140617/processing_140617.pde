

int SUBWAY_MAP = 1; 
int TRANSFER = 2; 

//***REMEMBER TO CHANGE THIS BACK TO int state = INTRO; 
int state = SUBWAY_MAP; 

PImage ttcLogo; 
PImage ttcMap; 
//PImage streetcarIcon;
//PImage busIcon;


//yonge-university-spadina & bloor line
PImage bathurst;
PImage bayview;
PImage bessarion;
PImage bloorYonge;
PImage college;
PImage coxwell;
PImage davisville;
PImage dufferin;
PImage dundas;
PImage eglinton;
PImage eglintonWest;
PImage finch;
PImage islington;
PImage jane;
PImage keele;
PImage kennedy;
PImage king;
PImage kipling;
PImage lansdowne;
PImage lawrenceWest;
PImage lawrence;
PImage mccowan;
PImage midland;
PImage museum;
PImage northYork;
PImage osgoode;
PImage ossington;
PImage queen;
PImage queensPark;
PImage rosedale;
PImage sheppard;
PImage sherbourne;
PImage spadina;
PImage stAndrew;
PImage stClairWest;
PImage stClair;
PImage stGeorge;
PImage stPatrick;
PImage union;
PImage victoriaPark;
PImage wellesley;
PImage woodbine;
PImage yorkMills;
PImage yorkUniversity;
PImage yorkdale;


//
//float busRoll1y = height;
//float carRoll1y = height; 
//float carRoll2y = height; 

void setup () {
  size(2013, 900);
  background(220, 0, 0); 

  ttcLogo = loadImage("ttc_logo.jpeg");
  ttcMap = loadImage("Subway_Map.jpg");
//  streetcarIcon = loadImage("streetcar_icon.jpg");
//  busIcon = loadImage("bus_icon.jpg");
  
//yonge-university-spadina & bloor line  
  bathurst = loadImage("Bathurst.jpg");
  bayview = loadImage("Bayview.jpg");
  bessarion = loadImage("Bessarion.jpg");
  bloorYonge = loadImage("Bloor-Yonge.jpg");
  college = loadImage("College.jpg");
  coxwell = loadImage("Coxwell.jpg");
  davisville = loadImage("Davisville.jpg");
  dufferin = loadImage("Dufferin.jpg");
  dundas = loadImage("Dundas.jpg");
  eglinton = loadImage("Eglinton.jpg");
  eglintonWest = loadImage("Eglinton West.jpg");
  finch = loadImage("Finch.jpg");
  islington = loadImage("Islington.jpg");
  jane = loadImage("Jane.jpg");
  keele = loadImage("Keele.jpg");
  kennedy = loadImage("Kennedy.jpg");
  king = loadImage("King.jpg");
  kipling = loadImage("Kipling.jpg");
  lansdowne = loadImage("Lansdowne.jpg");
  lawrenceWest = loadImage("Lawrence West.jpg");
  lawrence = loadImage("Lawrence.jpg");
  mccowan = loadImage("McCowan.jpg");
  midland = loadImage("Midland.jpg");
  museum = loadImage("Museum.jpg");
  northYork = loadImage("North York Centre.jpg");
  osgoode = loadImage("Osgoode.jpg");
  ossington = loadImage("Ossington.jpg");
  queen = loadImage("Queen.jpg");
  queensPark = loadImage("Queens Park.jpg");
  rosedale = loadImage("Rosedale.jpg");
  sheppard = loadImage("Sheppard.jpg");
  sherbourne = loadImage("Sherbourne.jpg");
  spadina = loadImage("Spadina.jpg");
  stAndrew = loadImage("St Andrew.jpg");
  stClairWest = loadImage("St Clair West.jpg");
  stClair = loadImage("St Clair.jpg");
  stGeorge = loadImage("St George.jpg");
  stPatrick = loadImage("St Patrick.jpg");
  union = loadImage("Union.jpg");
  victoriaPark = loadImage("Victoria Park.jpg");
  wellesley = loadImage("Wellesley.jpg");
  woodbine = loadImage("Woodbine.jpg");
  yorkMills = loadImage("York Mills.jpg");
  yorkUniversity = loadImage("York University.jpg");
  yorkdale = loadImage("Yorkdale.jpg");

}


void draw () {
  //     
  //  if (state == INTRO) intro();
  if (state == SUBWAY_MAP) subway_map();
//  if (state == TRANSFER) transfer();
}

//----------------------------------------------------------------------- 


//void intro() {
//  image(ttcLogo, width/2 - 182, height/2 - 69, 364, 138); 
//  textSize(30);
//  textAlign(CENTER); 
//  text("Click to Continue to Interactive Map", width/2, height/2 + 100); 
//  
//  
//}

void subway_map() {
  
  println (mouseX +"," + mouseY);
  
//     INDIVIDUAL STATION ROLLOVER 
//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------
  //  YONGE-UNIVERSITY-SPADINA-VAUGHAN LINE
//-------------------------------------------------------------------------------------------------------------
  if(mouseX > 1104 && mouseX < 1115 && mouseY > 15 && mouseY < 26){
     image(finch, 214, 508, 1585, 400);
    println("Finch Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  
  //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 36 && mouseY < 47){
    image(northYork, 214, 508, 1585, 400);
    println("North York Centre Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  
    //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 64 && mouseY < 75){
    image(sheppard, 214, 508, 1585, 400);
    println("Sheppard-Yonge Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  
    //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 95 && mouseY < 106){
    image(yorkMills, 214, 508, 1585, 400);
    println("York Mills Station"); 
  }  
  else{
//    background(220, 0, 0);
  }
  
    //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 125 && mouseY < 136){
    image(lawrence, 214, 508, 1585, 400);
    println("Lawrence Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  
    //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 159 && mouseY < 170){
   image(eglinton, 214, 508, 1585, 400);
    println("Eglinton Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 183 && mouseY < 194){
    image(davisville, 214, 508, 1585, 400);
    println("Davisville Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
        //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 207 && mouseY < 218){
    image(stClair, 214, 508, 1585, 400);
    println("St Clair Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
        //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY >  231 && mouseY < 242 ){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Summerhill Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
        //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 255  && mouseY < 266){
    image(rosedale, 214, 508, 1585, 400);
    println("Rosedale Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
        //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 288 && mouseY < 299){
    image(bloorYonge, 214, 508, 1585, 400);
    println("Bloor-Yonge Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }      
  //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 326 && mouseY < 337){
    image(wellesley, 214, 508, 1585, 400);
    println("Wellesley  Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 354 && mouseY < 365){
    image(college, 214, 508, 1585, 400);
    println("College  Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  
  //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 383 && mouseY < 394){
    image(dundas, 214, 508, 1585, 400);
    println("Dundas Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 411 && mouseY < 422){
    image( queen, 214, 508, 1585, 400);
    println("Queen Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
    if(mouseX > 1104 && mouseX < 1115 && mouseY > 436 && mouseY < 447){
    image(king, 214, 508, 1585, 400);
    println("King Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
    if(mouseX > 1045 && mouseX < 1056 && mouseY > 451 && mouseY < 462){
    image(union, 214, 508, 1585, 400);
    println("Union Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  
      //-------------------
    if(mouseX > 985 && mouseX < 996 && mouseY > 436 && mouseY < 447){
    image(stAndrew, 214, 508, 1585, 400);
    println("St Andrew Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
        //-------------------
    if(mouseX > 985 && mouseX < 996 && mouseY > 411 && mouseY < 422){
    image(osgoode, 214, 508, 1585, 400);
    println("Osgoode Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
        //-------------------
    if(mouseX > 985 && mouseX < 996 && mouseY > 383 && mouseY < 394){
    image(stPatrick, 214, 508, 1585, 400);
    println("St Patrick Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
        //-------------------
    if(mouseX > 985 && mouseX < 996 && mouseY > 355 && mouseY < 366){
    image(queensPark, 214, 508, 1585, 400);
    println("Queen's Park Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
        //-------------------
    if(mouseX > 985 && mouseX < 996 && mouseY > 326 && mouseY < 337){
    image(museum, 214, 508, 1585, 400);
    println("Museum Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  
        //-------------------
    if(mouseX > 985 && mouseX < 996 && mouseY > 281 && mouseY < 292){
    image(stGeorge, 214, 508, 1585, 400);
    println("St George Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
          //-------------------
    if(mouseX > 946 && mouseX < 957 && mouseY > 275 && mouseY < 295){
    image(spadina, 214, 508, 1585, 400);
    println("Spadina Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
          //-------------------
    if(mouseX > 946 && mouseX < 957 && mouseY > 244 && mouseY < 255){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Dupont Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
          //-------------------
    if(mouseX > 915 && mouseX < 926 && mouseY > 207 && mouseY < 218){
    image(stClairWest, 214, 508, 1585, 400);
    println("St Clair West Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
          //-------------------
    if(mouseX > 880 && mouseX < 891 && mouseY > 166 && mouseY < 177){
    image(eglintonWest, 214, 508, 1585, 400);
    println("Eglinton West Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------
    if(mouseX > 880 && mouseX < 891 && mouseY > 146 && mouseY < 157){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Glencairn Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------
    if(mouseX > 880 && mouseX < 891 && mouseY > 125 && mouseY < 136){
    image(lawrenceWest, 214, 508, 1585, 400);
    println("Lawrence West Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------
    if(mouseX > 880 && mouseX < 891 && mouseY > 106 && mouseY < 116){
    image(yorkdale, 214, 508, 1585, 400);
    println("Yorkdale Station"); 
  }  
  else{
//    background(220, 0, 0);
  }
            //-------------------
    if(mouseX > 880 && mouseX < 891 && mouseY > 85 && mouseY < 96){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Wilson Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------
    if(mouseX > 880 && mouseX < 891 && mouseY > 64 && mouseY < 75){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Downsview Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------
    if(mouseX > 756 && mouseX < 767 && mouseY > 58 && mouseY < 69){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Sheppard West Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------
    if(mouseX > 627 && mouseX < 638 && mouseY > 50 && mouseY < 61){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Finch West Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------
    if(mouseX > 502 && mouseX < 513 && mouseY > 43 && mouseY < 54){
    image(yorkUniversity, 214, 508, 1585, 400);
    println("York University Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------
    if(mouseX > 426 && mouseX < 437 && mouseY > 39 && mouseY < 50){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Steeles West Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------
    if(mouseX > 347 && mouseX < 358 && mouseY > 31 && mouseY < 42){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Highway 407 Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------
    if(mouseX > 344 && mouseX < 355 && mouseY > 6 && mouseY < 17){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Vaughan Corporate Centre Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  
//-------------------------------------------------------------------------------------------------------------
  //SHEPPARD LINE
//-------------------------------------------------------------------------------------------------------------
  
  if(mouseX > 1236 && mouseX < 1247 && mouseY > 64 && mouseY < 75){
    image(bayview, 214, 508, 1585, 400);
    println("Bayview Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------  
 if(mouseX > 1355 && mouseX < 1366 && mouseY > 64 && mouseY < 75){
    image(bessarion, 214, 508, 1585, 400);
    println("Bessarion Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //------------------- 
  if(mouseX > 1474 && mouseX < 1485 && mouseY > 64 && mouseY < 75){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Leslie Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //------------------- 
  if(mouseX > 1596 && mouseX < 1607 && mouseY > 64 && mouseY < 75){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Don Mills Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------   
  if(mouseX >  1655 && mouseX < 1666 && mouseY > 64 && mouseY < 75){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Pharmacy Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------             
  if(mouseX >  1749 && mouseX < 1760 && mouseY > 64 && mouseY < 75){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Birchmount North Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //------------------- 
  if(mouseX > 1807 && mouseX < 1818 && mouseY > 64 && mouseY < 75){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Agincourt Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
            //-------------------    
  if(mouseX > 1855 && mouseX <  1866 && mouseY > 64 && mouseY < 75){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Midland North Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
                   
//-------------------------------------------------------------------------------------------------------------
  //Eglinton Line
//-------------------------------------------------------------------------------------------------------------
  
            //-------------------    
  if(mouseX > 11 && mouseX <  22 && mouseY > 105 && mouseY < 116){
//    image(pearson, 214, 508, 1585, 400);
    println("Pearson International Airport Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
              //-------------------    
  if(mouseX > 43 && mouseX < 54  && mouseY > 113 && mouseY < 124){
//    image(carlingview, 214, 508, 1585, 400);
    println("Carlingview Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
              //-------------------    
  if(mouseX > 52 && mouseX <  63 && mouseY >  165 && mouseY < 176){
//    image(highway27, 214, 508, 1585, 400);
    println("Highway 27 Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
              //-------------------    
  if(mouseX > 88  && mouseX < 99  && mouseY > 165 && mouseY < 176){
//    image(kiplingNorth, 214, 508, 1585, 400);
    println("Kipling North Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
              //-------------------    
  if(mouseX > 151 && mouseX < 162  && mouseY > 166 && mouseY < 177){
//    image(islingtonNorth, 214, 508, 1585, 400);
    println("Islington North Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
               //-------------------    
  if(mouseX > 207 && mouseX < 218  && mouseY > 166 && mouseY < 177){
//    image(royalYorkNorth, 214, 508, 1585, 400);
    println("Royal York North Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
               //-------------------    
  if(mouseX > 290 && mouseX < 301  && mouseY > 166 && mouseY < 177){
//    image(scarlettRoad, 214, 508, 1585, 400);
    println("Scarlett Road Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
               //-------------------    
  if(mouseX > 385 && mouseX < 396  && mouseY > 166 && mouseY < 177){
//    image(mountDennis, 214, 508, 1585, 400);
    println("Mount Dennis Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
               //-------------------    
  if(mouseX > 509 && mouseX < 520  && mouseY > 166 && mouseY < 177){
//    image(keeleNorth, 214, 508, 1585, 400);
    println("Keele North Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
               //-------------------    
  if(mouseX > 574 && mouseX < 585  && mouseY > 166 && mouseY < 177){
//    image(caledonia, 214, 508, 1585, 400);
    println("Caledonia Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
               //-------------------    
  if(mouseX > 721 && mouseX <  732 && mouseY > 166 && mouseY < 177){
//    image(dufferinNorth, 214, 508, 1585, 400);
    println("Dufferin North Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
               //-------------------    
  if(mouseX > 768 && mouseX < 779  && mouseY > 166 && mouseY < 177){
//    image(oakwood, 214, 508, 1585, 400);
    println("Oakwood Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
               //-------------------    
  if(mouseX > 971 && mouseX < 982  && mouseY > 164 && mouseY < 175){
//    image(forestHill, 214, 508, 1585, 400);
    println("Forest Hill Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
               //-------------------    
  if(mouseX > 1041 && mouseX <  1052 && mouseY > 160 && mouseY < 171){
//    image(avenue, 214, 508, 1585, 400);
    println("Avenue Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
               //-------------------    
  if(mouseX > 1158 && mouseX <  1169 && mouseY > 160 && mouseY < 171){
//    image(mtPleasant, 214, 508, 1585, 400);
    println("Mt Pleasant Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
                 //-------------------    
  if(mouseX > 1281 && mouseX <  1292 && mouseY > 160 && mouseY < 171){
//    image(sunnybrook, 214, 508, 1585, 400);
    println("Suunybrook Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
                 //-------------------    
  if(mouseX > 1464 && mouseX <  1475 && mouseY > 160 && mouseY < 171){
//    image(leaside, 214, 508, 1585, 400);
    println("Leaside Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
                 //-------------------    
  if(mouseX > 1602 && mouseX <  1613 && mouseY > 160 && mouseY < 171){
//    image(ontarioScienceC, 214, 508, 1585, 400);
    println("Ontario Science Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
                 //-------------------    
  if(mouseX > 1654 && mouseX < 1665  && mouseY > 160 && mouseY < 171){
//    image(victoriaParkNorth, 214, 508, 1585, 400);
    println("Victoria Park North Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
                 //-------------------    
  if(mouseX > 1732 && mouseX <  1743 && mouseY > 190 && mouseY < 201){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Birchmount Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  
//-------------------------------------------------------------------------------------------------------------
  //Bloor Line
//-------------------------------------------------------------------------------------------------------------
  
    if(mouseX > 85 && mouseX < 96  && mouseY > 301 && mouseY < 312){
    image(kipling, 214, 508, 1585, 400);
    println("Kipling Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }  
  //-------------------
      if(mouseX > 157 && mouseX < 168 && mouseY > 288 && mouseY < 299){
    image(islington, 214, 508, 1585, 400);
    println("Islington Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  //-------------------
        if(mouseX > 213 && mouseX < 224  && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Royal York Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  //-------------------
        if(mouseX > 274 && mouseX < 285  && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Old Mill Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 335 && mouseX <  346 && mouseY > 288 && mouseY < 299){
    image(jane, 214, 508, 1585, 400);
    println("Jane Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 396 && mouseX < 407 && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Runnymede Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 457 && mouseX < 468  && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("High Park Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 518 && mouseX < 529  && mouseY > 288 && mouseY < 299){
    image(keele, 214, 508, 1585, 400);
    println("Keele Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 580 && mouseX <  591 && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Dundas West Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 641 && mouseX < 652  && mouseY > 288 && mouseY < 299){
    image(lansdowne, 214, 508, 1585, 400);
    println("Lansdowne Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 702 && mouseX <  713 && mouseY > 288 && mouseY < 299){
    image(dufferin, 214, 508, 1585, 400);
    println("Dufferin Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 763 && mouseX <  774 && mouseY > 288 && mouseY < 299){
    image(ossington, 214, 508, 1585, 400);
    println("Ossington Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 824 && mouseX < 835  && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Christie Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 886 && mouseX < 897 && mouseY > 288 && mouseY < 299){
    image(bathurst, 214, 508, 1585, 400);
    println("Bathurst Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1045 && mouseX < 1056 && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Bay Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1165 && mouseX < 1176  && mouseY > 288 && mouseY < 299){
    image(sherbourne, 214, 508, 1585, 400);
    println("Sherbourne Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1226 && mouseX <  1237 && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Castle Frank Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX >  1288 && mouseX < 1299  && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Broadview Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1349 && mouseX < 1360  && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Chester Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1410 && mouseX <  1421 && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Pape Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1471 && mouseX < 1482  && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Donlands Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1532 && mouseX <  1543 && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Greenwood Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1593 && mouseX < 1604  && mouseY > 288 && mouseY < 299){
    image(coxwell, 214, 508, 1585, 400);
    println("Coxwell Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1655 && mouseX < 1666  && mouseY > 288 && mouseY < 299){
    image(woodbine, 214, 508, 1585, 400);
    println("Woodbine Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1715 && mouseX <  1726 && mouseY > 288 && mouseY < 299){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Main Street Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1753 && mouseX < 1764 && mouseY > 271 && mouseY < 282){
    image(victoriaPark, 214, 508, 1585, 400);
    println("Victoria Park Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1782 && mouseX <  1793 && mouseY > 242 && mouseY < 253){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Warden Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
   //-------------------
        if(mouseX > 1807 && mouseX < 1818  && mouseY > 218 && mouseY < 229){
    image(kennedy, 214, 508, 1585, 400);
    println("Kennedy Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1807 && mouseX < 1818   && mouseY > 133 && mouseY < 144){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Lawrence East Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1807 && mouseX < 1818  && mouseY > 95 && mouseY < 106){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Ellesmere Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1859 && mouseX < 1870  && mouseY > 95 && mouseY < 106){
    image(midland, 214, 508, 1585, 400);
    println("Midland Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1910 && mouseX < 1921  && mouseY > 95 && mouseY < 106){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Scarborough Centre Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 1963 && mouseX <  1974 && mouseY > 95 && mouseY < 106){
    image(mccowan, 214, 508, 1585, 400);
    println("McCowan Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    
//-------------------------------------------------------------------------------------------------------------
  //Downtown Relief Line
//-------------------------------------------------------------------------------------------------------------

        if(mouseX > 454 && mouseX < 465 && mouseY > 210 && mouseY < 221){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Rogers Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
        if(mouseX > 511 && mouseX <  522 && mouseY > 245 && mouseY < 256){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Junction Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
        if(mouseX > 584 && mouseX < 595  && mouseY > 414 && mouseY < 425){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Roncesvalles Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
        if(mouseX > 635 && mouseX < 646  && mouseY > 437 && mouseY < 448){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Jameson Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
        if(mouseX > 702 && mouseX < 723  && mouseY > 466 && mouseY < 477){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Dufferin South Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
    //-------------------
        if(mouseX > 763 && mouseX < 774  && mouseY > 466 && mouseY < 477){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Exhibition Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
        if(mouseX > 834 && mouseX < 845  && mouseY > 466 && mouseY < 477){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Fort York Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
        if(mouseX > 899 && mouseX < 910 && mouseY > 466 && mouseY < 477 ){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Bathurst South Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
        if(mouseX > 959 && mouseX < 970  && mouseY > 466 && mouseY < 477){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Spadina South Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
        if(mouseX > 1045 && mouseX < 1056  && mouseY > 466 && mouseY < 477){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Union South Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
        if(mouseX > 1140 && mouseX < 1151  && mouseY > 466 && mouseY < 477){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Parliment Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
      //-------------------
        if(mouseX > 1201 && mouseX < 1212  && mouseY > 466 && mouseY < 477 ){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Sherbourne South Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
        //-------------------
        if(mouseX > 1272 && mouseX < 1283  && mouseY > 466 && mouseY < 477 ){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Broadview South Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
        //-------------------
        if(mouseX > 1347 && mouseX < 1358  && mouseY > 437 && mouseY < 448 ){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Carlaw Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
          //-------------------
        if(mouseX > 1405 && mouseX < 1416 && mouseY > 416 && mouseY < 427){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Queen East Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
          //-------------------
        if(mouseX > 1405 && mouseX < 1416  && mouseY > 356 && mouseY < 367 ){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Gerrard Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
          //-------------------
        if(mouseX > 1473 && mouseX < 1484  && mouseY > 248 && mouseY < 259){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("O'Connor Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
          //-------------------
        if(mouseX > 1547 && mouseX <  1558 && mouseY > 198 && mouseY < 209){
//    image(ttcLogo, width/2, (height/2 + 20), 364, 138);
    println("Thorncliffe Park Station"); 
  }  
  else{
//    fill(255, 0, 13);
//    strokeWeight(0);
//    rect(0, height/2, width, height/2);
  }
  
  
  
//  STREETCAR & BUS ROLLING TWITTER FEED   
//-------------------------------------------------------------------------------------------------------------
//
//  //brings up bus roll
//  if (mouseX > 1232 && mouseX < 1307 && mouseY > 254 && mouseY < 329) {
//    image(busRoll1, 0, busRoll1y, width, 2011);
//    busRoll1y= busRoll1y - 0.5;
//  }
//  else {
//    fill(255, 0, 13);
//    strokeWeight(4);
//    stroke(0);
//    rect(0, height/2, width, height/2);
//  }
//
////brings up streetcar roll
//if (mouseX > 1142 && mouseX < 1217 && mouseY > 254 && mouseY < 329) {
//  image(streetcarRoll1, 0, carRoll1y, width, 2286);
//  carRoll1y = carRoll1y - 1;
//}
//else {
//  fill(255, 0, 13);
//  strokeWeight(0);
//  rect(0, height/2, width, height/2);
//}
//
//   if((carRoll1y + 2286) > height){
//   image(streetcarRoll2, 0, carRoll2y, width, height); 
//   carRoll2y = carRoll2y - 0.5;
//  }
//-------------------------------------------------------------------------------------------------------------



//**** STAYS AT BOTTOM OF VOID SUBWAY MAP ***** 
  image(ttcMap, 0, 0, 2013, 508); 

//  image(busIcon, width-110, height/2 -85, 75, 75);
//  image(streetcarIcon, width-200, height/2-85, 75, 75);

}

//void transfer() {
//}

//----------------------------------------------------------------------- 

//void mousePressed(){
//  if (state == INTRO){
//   state = SUBWAY_MAP;
//
//  }
//
//}





