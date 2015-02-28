
//IMAGES//////////////////////////////////////////////////

//MAIN MENU PICTURES
//CHICKEN
PImage chickensil;
PImage cchickensilc;

//COW
PImage cowsil;
PImage ccowsilc;

//FISH
PImage fishsil;
PImage cfishsilc;

//DESSERT
PImage dessertsil;
PImage cdessertsilc;

//BACK BUTTON PICTURE
PImage backbtn;

//MENU BUTTON PICTURE
PImage menubtn;

//CHICKEN FOOD PICTURES
PImage chickenpiecol;
PImage chickenpierecipe;
PImage chickenbaconcol;
PImage chickenbaconrecipe;
PImage chickentikkacol;
PImage chickentikkarecipe;
PImage chickensataycol;
PImage chickensatayrecipe;


//BEEF FOOD PICTURES
PImage steakpiecol;
PImage steakpierecipe;
PImage beefburgercol;
PImage beefburgerrecipe;
PImage steakchipcol;
PImage steakchiprecipe;
PImage meatballscol;
PImage meatballsrecipe;

//FISH FOOD PICTURES
PImage fishpiecol;
PImage fishpierecipe;
PImage fishtikkacol;
PImage fishtikkarecipe;
PImage codcol;
PImage codrecipe;
PImage fishcakecol;
PImage fishcakerecipe;

//DESSERT FOOD PICTURE
PImage cheesecakecol;
PImage cheesecakerecipe;
PImage fudgecakecol;
PImage fudgecakerecipe;
PImage pavlovacol;
PImage pavlovarecipe;
PImage bannoffeepiecol;
PImage bannoffeepierecipe;


//VARIABLES/////////////////////////////////////////////////////
//AREA WHERE MOUSE IS CLICKABLE
int bW = 150; 
int bH = 150;

//PAGE1
int page = 1;

/////////////////////////////////////////////////////////////////

//ALL BUTTON POSITIONS//////////////////////////////////////////

//ALL BUTTONS ON PAGE1//////////
///CHICKEN ICON
int x1 = 50;
int y1 = 170;

////COW ICON
int x2 = 220;
int y2 = 180;

////FISH ICON
int x3 = 430;
int y3 = 180;

////DESSERT ICON
int x4 = 600;
int y4 = 165;


/////////////////////////////////


//BUTTONS on PAGE 2//////////////
////BACK button
int x22 = 690;
int y22 = 450;

//CHICKEN PIE COLUMN
int x32 = 30;
int y32 = 20;

//CHICKEN & BACON COLUMN
int x33 = 225;
int y33 = 20;

//CHICKEN TIKKA COLUMN
int x34 = 415;
int y34 = 20;

//CHICKEN SATAY COLUMN
int x35 = 615;
int y35 = 20;


//////////////////////////////////////


//BUTTONS on PAGE 3///////////////////
////BACK button
int x23 = 690;
int y23 = 450;

//STEAK PIE COLUMN
int x42 = 30;
int y42 = 20;

//BEER BURGER COLUMN
int x43 = 230;   
int y43 = 20;

//MEAT BALLS COLUMN
int x44 = 430;
int y44 = 20;

//STEAK & CHIPS COLUMN
int x45 = 615;
int y45 = 20;


///////////////////////////////////////////


//BUTTONS on PAGE 4////////////////////////
//FISH PIE COLUMN
int x52 = 30;
int y52 = 20;

//FISH TIKKA COLUMN
int x53 = 230;
int y53 = 20;

//FISH CAKE COLUMN
int x54 = 430;
int y54 = 20;

//COD & CHIPS COLUMN  
int x55 = 625;
int y55 = 20;

////BACK button
int x24 = 690;
int y24 = 450;


//////////////////////////////////////////////



//BUTTONS on PAGE 5///////////////////////////
//LEMON CHEESECAKE COLUMN
int x62 = 30;
int y62 = 20;

//PAVLOVA COLUMN
int x63 = 225;
int y63 = 20;

//CHOCOLATE FUDGE CAKE COLUMN
int x64 = 430;
int y64 = 20;

//BANNOFEE PIE COLUMN
int x65 = 625;
int y65 = 20; 

////BACK BUTTON
int x25 = 690;
int y25 = 450;


////////////////////////////////////////////


//PAGE 6///////////////////////////////////

//PIC ON CHICKEN PIE RECIPE
int x80 = 50;
int y80 = 50;

//BACK BUTTON
int x70 = 50;
int y70 = 450;


////////////////////////////////////////////////


//PAGE 7///////////////////////////////////////

//PIC OF CHICKEN & BACON RECIPE
int x81 = 50;
int y81 = 50;

//BACK BUTTON
int x71 = 50;
int y71 = 450;

//PAGE 8////////////////////////////////////// 

//PIC OF CHICKEN TIKKA RECIPE
int x82 = 50;
int y82 = 50;

//BACK BUTTON
int x72 = 50;
int y72 = 450;

//PAGE 9//////////////////////////////////////

//PIC OF CHICKEN SATAY RECIPE
int x83 = 50;
int y83 = 50;

//BACK BUTTON
int x73 = 50;
int y73 = 450;

//PAGE 10//////////////////////////////////////

//PIC OF STEAK PIE RECIPE
int x84 = 50;
int y84 = 50;

//BACK BUTTON
int x74 = 50;
int y74 = 450;

//PAGE 11//////////////////////////////////////

//PIC OF BEEF BURGERS RECIPE
int x85 = 50;
int y85 = 50;

//BACK BUTTON
int x75 = 50;
int y75 = 450;

//PAGE 12///////////////////////////////////////

//PIC OF MEATBALLS
int x86 = 50;
int y86 = 50;

//BACK BUTTON
int x76 = 50;
int y76 = 450;

//PAGE 13///////////////////////////////////////

//PIC OF STEAK & CHIPS RECIPE
int x87 = 50;
int y87 = 50;

//BACK BUTTON
int x77 = 50;
int y77 = 450;

//PAGE 14////////////////////////////////////////

//PIC OF FISH PIE RECIPE
int x88 = 50;
int y88 = 50;

//BACK BUTTON
int x78 = 50;
int y78 = 450;

//PAGE 15//////////////////////////////////////

//PIC OF FISH TIKKA RECIPE
int x89 = 50;
int y89 = 50;

//BACK BUTTON
int x79 = 50;
int y79 = 450;

//PAGE 16////////////////////////////////////////

//PIC OF FISH CAKE RECIPE
int x90 = 50;
int y90 = 50;

//BACK BUTTON
int x100 = 50;
int y100 = 450;

//PAGE 17////////////////////////////////////////

//PIC OF COD & CHIPS RECIPE
int x91 = 50;
int y91 = 50;

//BACK BUTTON
int x101 = 50;
int y101 = 450;

//PAGE 18////////////////////////////////////////

//PIC OF LEMON CHEESECAKE RECIPE
int x92 = 50;
int y92 = 50;

//BACK BUTTON
int x102 = 50;
int y102 = 450;

//PAGE 20////////////////////////////////////////////

//PIC OF PAVLOVA RECIPE
int x93 = 50;
int y93 = 50;

//BACK BUTTON
int x103 = 50;
int y103 = 450;

//PAGE 21 ///////////////////////////////////////////

//PIC OF CHOCOLATE FUDGE CAKE
int x94 = 50;
int y94 = 50;

//BACK BUTTON
int x104 = 50;
int y104 = 450;

//PAGE 22///////////////////////////////////////////
//PIC OF BANNOFEE PIE RECIPE
int x95 = 50; 
int y95 = 50;

//BACK BUTTON
int x105 = 50; 
int y105 = 450;


///////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
   
void setup ()
{
     size (800, 500);
     smooth();
      
      //LOADS IMAGES FOR MAIN MENU ICONS
      chickensil = loadImage("chickensil.jpg");
      cchickensilc = loadImage("cchickensilc.jpg");
      cowsil = loadImage("cowsil.jpg");
      ccowsilc = loadImage("ccowsilc.jpg");
      fishsil = loadImage("fishsil.jpg");
      cfishsilc = loadImage("cfishsilc.jpg");
      dessertsil = loadImage("dessertsil.jpg");
      cdessertsilc = loadImage("cdessertsilc.jpg");

 }
 
///////////////////////////////////////////////////////////////////////////////////////////////////////////
 
//create the over button function which detects when mouse is inside rectangle

     boolean overButton (int x, int y, int w, int h){
     if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h){
      
      return true;
     } else {
      return false;
     }
}
 
//logic for going to a page function based on value of the variable "page"
////EVERY PAGE
void draw (){
if (page == 1){
    pageOne();
}
 
if (page == 2){
    pageTwo();
}
 
if(page == 3){
   pageThree();
}
 
if(page == 4){
   pageFour();
}
 
if(page == 5){
   pageFive();
}
 
if(page == 6){
   pageChickenPie();
}
 
if(page == 7){
   pageChickenBacon();
}
 
if(page == 8){
   pageChickenTikka();
}
 
if(page == 9){
   pageChickenSatay();
}
 
if(page == 10){
   pageSteakPie();
}

if(page == 11){
   pageBeefBurger();
}

if(page == 12){
   pageMeatballs();
}

if(page == 13){
   pageSteakChips();
}

if(page == 14){
  pageFishPie();
}

if(page == 15){
  pageFishTikka();
}

if(page == 16){
  pageFishCake();
}

if(page == 17){
  pageCodChips();
}

if(page == 18){
  pageCheesecake();
}

if(page == 19){
 pagePavlova();
}

if(page == 20){
  pageFudgeCake();
}

if(page == 21){
  pageBannoffeePie();
}
}


//all the code for PAGE 1//////////////////////////
 
void pageOne () {
     background(255);
  
//call the over button function and input variables x, y, bW and bH
 
     image(chickensil, x1, y1);
     if (overButton (x1, y1, bW, bH) == true) { //click this to take you to chicken recipes 
     image(cchickensilc, x1, y1); //hover over picture to change chicken to red
   } else {
           
     page = 1; //MENU PAGE
}

     image(cowsil, x2, y2);
     if (overButton (x2, y2, bW, bH) == true) { //click this to take you to beef recipes
     image(ccowsilc, x2, y2); //hover over picture to change cow to blue
   } else {
      
      page = 1; //MENU PAGE
}

      image(fishsil, x3, y3);
      if (overButton (x3, y3, bW, bH) == true) { //click this to take you to fish recipes
      image(cfishsilc, x3, y3); //hover over picture to change fish to green 
    } else {
      
      page = 1; //MENU PAGE
}

      image(dessertsil, x4, y4);
      if (overButton (x4, y4, bW, bH) == true) { //click this to take you to dessert recipes
      image(cdessertsilc, x4, y4); //hover over picture to change dessert to lilac
    } else {
      
      page = 1; //MENU PAGE
}
}

 
//all the code for page 2///////////////////////////////////////
/////CHICKEN SHOPPING LIST//////////////////////////////////////

void pageTwo () {
     background(255);
     
     //LOADS IMAGE OF MENU BUTTON
     menubtn = loadImage("menubtn.jpg");{ 
               image(menubtn, x22, y22); 
    }
               if(overButton (x22, y22, bW, bH) == true){ //press to go back to icon menu
    }
    
    //LOADS CHICKEN PIE COLUMN
    chickenpiecol = loadImage("chickenpiecol.jpg");{ 
                    image(chickenpiecol, x32, y32);
    }
    if(overButton (x32, y32, bW, bH) == true){ //press to go back to icon menu
    }
    
    //LOADS CHICKEN & BACON COLUMN
    chickenbaconcol = loadImage("chickenbaconcol.jpg");{
                      image(chickenbaconcol, x33, y33);
    }
    if(overButton (x33, y33, bW, bH) == true){ //press to go back to icon menu
    }
    
    //LOADS CHICKEN TIKKA COLUMN
    chickentikkacol = loadImage("chickentikkacol.jpg");{
                      image(chickentikkacol, x34, y34); 
    }
    if(overButton (x34, y34, bW, bH) == true){ //press to go back to icon menu
    }
    
    //LOADS CHICKEN SATAY COLUMN
    chickensataycol = loadImage("chickensataycol.jpg");{
                      image(chickensataycol, x35, y35); //press to go back to icon menu
    }
    if(overButton (x35, y35, bW, bH) == true){
    }
}
     
     
//all the code for page 3////////////////////////////////////////////////////////////////////////
///////BEEF SHOPPING LIST////////////////////////////////////////////////////////////////////////

void pageThree(){
     background(255);
     
     //LOADS MAIN MENU BUTTON
     menubtn = loadImage("menubtn.jpg");{
               image(menubtn, x23, y23); 
    }
         if(overButton (x23, y23, bW, bH) == true){ //press to go back to menu
    }
    
    
    //LOADS STEAK PIE COLUMN
    steakpiecol = loadImage("steakpiecol.jpg");{
                  image(steakpiecol, x42, y42);
      }
      if(overButton (x42, y42, bW, bH) == true){ //press to go back to menu
      }

    
    //LOADS BEEF BURGER COLUMN
    beefburgercol = loadImage("beefburgercol.jpg");{
                    image(beefburgercol, x43, y43);
    }
    if(overButton (x43, y43, bW, bH) == true){ //press to go back to menu
    }

    //LOADS MEATBALL COLUMN
    meatballscol = loadImage("meatballscol.jpg");{
                   image(meatballscol, x44, y44);
    }
    if(overButton (x44, y44, bW, bH) == true){ //press to go back to menu
    }
    
    //LOADS STEAK & CHIPS COLUMN
    steakchipcol = loadImage("steakchipcol.jpg");{
                   image(steakchipcol, x45, y45); 
      }
      if(overButton (x45, y45, bW, bH) == true){ //press to go back to menu
      }
}
    


//all the code for page 4////////////////////////////////////////////////////////////////////////////
///////FISH SHOPPING LIST////////////////////////////////////////////////////////////////////////////

void pageFour(){
     background(255);
     
     //LOADS MENU BUTTON
     menubtn = loadImage("menubtn.jpg");{
               image(menubtn, x24, y24); 
    }
          if(overButton (x24, y24, bW, bH) == true){ //press to go back to menu
    }
    
    //LOADS FISH PIE COLUMN
    fishpiecol = loadImage("fishpiecol.jpg");{
                 image(fishpiecol, x52, y52);
    }
    if(overButton (x52, y52, bW, bH) == true){ //press to go back to menu
    }
    
    //LOADS FISH TIKKA COLUMN
    fishtikkacol = loadImage("fishtikkacol.jpg");{
                   image(fishtikkacol, x53, y53); 
    }
    if(overButton (x53, y53, bW, bH) == true){ //press to go back to menu
    }
    
    //LOADS FISH CAKE COLUMN
    fishcakecol = loadImage("fishcakecol.jpg");{
                  image(fishcakecol, x54, y54); 
    }
    if(overButton (x54, y54, bW, bH) == true){ //press to go back to menu
    }
    
    //LOADS COD & CHIPS COLUMN
    codcol = loadImage("codcol.jpg");{
             image(codcol, x55, y55);
      }
      if(overButton (x55, y55, bW, bH) == true){ //press to go back to menu
      }
}

     
     
//all the code for page 5///////////////////////////////////////////////////////////////////////////////
////DESSERT SHOPPING LIST//////////////////////////////////////////////////////////////////////////////
void pageFive(){
     background(255);
     
     //LOADS MAIN MENU BUTTON
     menubtn = loadImage("menubtn.jpg");{
               image(menubtn, x25, y25); 
    }
    if(overButton (x25, y25, bW, bH) == true){ //press to go back to menu
    }
    
    //LOADS CHEESECAKE COLUMN
    cheesecakecol = loadImage("cheesecakecol.jpg");{
                    image(cheesecakecol, x62, y62);
    }
    if(overButton (x62, y62, bW, bH) == true){ //press to go back to menu
    }
    
    //LOADS PAVLOVA COLUMN
    pavlovacol = loadImage("pavlovacol.jpg");{
                 image(pavlovacol, x63, y63);
    }
    if(overButton (x63, y63, bW, bH) == true){ //press to go back to menu
    }
    
    //LOADS CHOCOLATE FUDGE CAKE MENU
    fudgecakecol = loadImage("fudgecakecol.jpg");{
                   image(fudgecakecol, x64, y64);
    }
    if(overButton (x64, y64, bW, bH) == true);{ //press to go back to menu
    }
    
    //LOADS BANNOFEE PIE MENU
    bannoffeepiecol = loadImage("bannoffeepiecol.jpg");{
                      image(bannoffeepiecol, x65, y65);
    }
    if(overButton (x65, y65, bW, bH) == true);{ //press to go back to menu
    }
}


//all the code for page 6////////////////////////////////////////////////////////////////////////////////////////
////CHICKEN PIE RECIPE//////////////////////////////////////////////////////////////////////////////////////////
void pageChickenPie(){
      background(255);
      
      //LOADS CHICKEN PIE RECIPE
      chickenpierecipe = loadImage("chickenpierecipe.jpg");{
                         image(chickenpierecipe, x80, y80); 
      }
      
      //LOADS BACK BUTTON
      backbtn = loadImage("backbtn.jpg");{
                image(backbtn, x70, y70); 
    }
        if(overButton (x70, y70, bW, bH) == true){ //press to go back to chicken column menu
    }
}


//all the code for page 7////////////////////////////////////////////////////////////////////////////////////////
///CHICKEN & BACON RECIPE///////////////////////////////////////////////////////////////////////////////////////
void pageChickenBacon(){
     background(255);
     
     //LOAD CHICKEN & BACON RECIPE
     chickenbaconrecipe = loadImage("chickenbaconrecipe.jpg");{
                          image(chickenbaconrecipe, x81, y81);
     }
     
     //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x71, y71); 
    }
        if(overButton (x71, y71, bW, bH) == true){ //press to go back to chicken column menu
    }
}


//all the code for page 8///////////////////////////////////////////////////////////////////////////////////////
////CHICKEN TIKKA RECIPE///////////////////////////////////////////////////////////////////////////////////////
void pageChickenTikka(){
     background(255);
     
     //LOADS CHICKEN TIKKA RECIPE
     chickentikkarecipe = loadImage("chickentikkarecipe.jpg");{
                          image(chickentikkarecipe, x82, y82);
  }
      
      //LOADS BACK BUTTON
      backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x72, y72); 
    }
        if(overButton (x72, y72, bW, bH) == true){ //press to go back to chicken column menu
    }
}


//all the code for page 9///////////////////////////////////////////////////////////////////////////////////////
////CHICKEN SATAY RECIPE///////////////////////////////////////////////////////////////////////////////////////
void pageChickenSatay(){
     background(255);
     
     //LOADS CHICKEN SATAY RECIPE
     chickensatayrecipe = loadImage("chickensatayrecipe.jpg");{
                          image(chickensatayrecipe, x83, y83);
    }
     
     //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x73, y73); 
    }
        if(overButton (x73, y73, bW, bH) == true){ //press to go back to chicken column menu
    }
}


//all the code for page 10///////////////////////////////////////////////////////////////////////////////////////
////STEAK PIE RECIPE///////////////////////////////////////////////////////////////////////////////////////
void pageSteakPie(){
     background(255);
  
     //LOADS STEAK PIE RECIPE
     steakpierecipe = loadImage("steakpierecipe.jpg");{
                      image(steakpierecipe, x84, y84);
    }
     
     //LOADS BACK BUTTON 
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x74, y74); 
    }
        if(overButton (x74, y74, bW, bH) == true){ //press to go back to beef column menu
    }
}
  

//all the code for page 11///////////////////////////////////////////////////////////////////////////////////////
////BEEF BURGER RECIPE///////////////////////////////////////////////////////////////////////////////////////
void pageBeefBurger(){
     background(255);
     
     //LOADS BEEF BURGER RECIPE
     beefburgerrecipe = loadImage("beefburgerrecipe.jpg");{
                        image(beefburgerrecipe, x85, y85);
     }
     
     //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x75, y75); 
    }
        if(overButton (x75, y75, bW, bH) == true){ //press to go back to beef column menu
    }
}
  
  
//all the code on page 12///////////////////////////////////////////////////////////////////////////////////////
///MEATBALLS RECIPE///////////////////////////////////////////////////////////////////////////////////////
void pageMeatballs(){
     background(255);
     
     //LOADS MEATBALLS RECIPES
     meatballsrecipe = loadImage("meatballsrecipe.jpg");{
                       image(meatballsrecipe, x86, y86);
     }
     
     //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x76, y76); 
    }
        if(overButton (x76, y76, bW, bH) == true){ //press to go back to beef column menu
    }
}
  
  
//all the code on page 13///////////////////////////////////////////////////////////////////////////////////////
////STEAK & CHIPS RECIPE///////////////////////////////////////////////////////////////////////////////////////
void pageSteakChips(){
     background(255);
     
     //LOADS STEAK RECIPE
     steakchiprecipe = loadImage("steakchiprecipe.jpg");{
                       image(steakchiprecipe, x87, y87);
    }
    
     //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x77, y77); 
    }
        if(overButton (x77, y77, bW, bH) == true){ //press to go back to beef column menu
    }
}
  
  
//all the code on page 14///////////////////////////////////////////////////////////////////////////////////////
////FISH PIE RECIPE////////////////////////////////////////////////////////////////////////////////////////////
void pageFishPie(){
     background(255);
     
     //LOADS FISH PIE RECIPE
     fishpierecipe = loadImage("fishpierecipe.jpg");{
                     image(fishpierecipe, x88, y88);
    }
     
     //BACK BUTTON RECIPE
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x78, y78); 
    }
        if(overButton (x78, y78, bW, bH) == true){ //press to go back to fish column menu
    }
}
  
//all the code on page 15
///FISH TIKKA RECIPE
void pageFishTikka(){
     background(255);
     
     //LOADS FISH TIKKA RECIPE
     fishtikkarecipe = loadImage("fishtikkarecipe.jpg");{
                       image(fishtikkarecipe, x89, y89);
  }
     
     //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x79, y79); 
    }
      if(overButton (x79, y79, bW, bH) == true){ //press to go back to fish column column menu
    }
}


//all the code page 16///////////////////////////////////////////////////////////////////////////////////////
//FISH CAKE RECIPE//////////////////////////////////////////////////////////////////////////////////////////
void pageFishCake(){
     background(255);
     
     //LOADS FISH CAKE RECIPE
     fishcakerecipe = loadImage("fishcakerecipe.jpg");{
                      image(fishcakerecipe, x90, y90);
    }

     //LOADS BACK BUTTON  
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x100, y100); 
    }
        if(overButton (x100, y100, bW, bH) == true){ //press to go back to fish column menu
    }
}


//all the code on page 17///////////////////////////////////////////////////////////////////////////////////////
//COD & CHIPS RECIPE///////////////////////////////////////////////////////////////////////////////////////////
void pageCodChips(){
     background(255);
     
     //LOADS COD & CHIPS MENU
     codrecipe = loadImage("codrecipe.jpg");{
                 image(codrecipe, x91, y91);
    }
     
     //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x101, y101); 
    }
        if(overButton (x101, y101, bW, bH) == true){ //press to go back to fish column menu
    }
}


//all the code of page 18///////////////////////////////////////////////////////////////////////////////////////
//LEMON CHEESE CAKE RECIPE/////////////////////////////////////////////////////////////////////////////////////
void pageCheesecake(){
     background(255);
     
     //LOADS CHEESECAKE RECIPE
     cheesecakerecipe = loadImage("cheesecakerecipe.jpg");{
                        image(cheesecakerecipe, x92, y92);
     }
     
     //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x102, y102); 
     }
        if(overButton (x102, y102, bW, bH) == true){ //press to go back to dessert column menu
    }
}


//all the code on page 19///////////////////////////////////////////////////////////////////////////////////////
//PAVLOVA RECIPE///////////////////////////////////////////////////////////////////////////////////////////////
void pagePavlova(){
     background(255);
     
    //LOADS PAVLOVA RECIPE
    pavlovarecipe = loadImage("pavlovarecipe.jpg");{
                    image(pavlovarecipe, x93, y93);
    }
     
     //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x103, y103); 
    }
        if(overButton (x103, y103, bW, bH) == true){ //press to go back to dessert column menu
    }
}

//all the code on page 20///////////////////////////////////////////////////////////////////////////////////////
//CHOCOLATE FUDGE CAKE RECIPE//////////////////////////////////////////////////////////////////////////////////  
void pageFudgeCake(){
     background(255);
   
     //LOADS CHOCOLATE FUDGE CAKE RECIPE
     fudgecakerecipe = loadImage("fudgecakerecipe.jpg");{
                       image(fudgecakerecipe, x94, y94);
    }
     
     //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x104, y104); 
    }
        if(overButton (x104, y104, bW, bH) == true){ //press to go back to dessert column menu
    }
}


//all the code on page 21///////////////////////////////////////////////////////////////////////////////////////
//BANNOFFEE PIE RECIPE/////////////////////////////////////////////////////////////////////////////////////////
void pageBannoffeePie(){
     background(255);
     
     //LOADS BANNOFEE PIE RECIPE
     bannoffeepierecipe = loadImage("bannoffeepierecipe.jpg");{
                          image(bannoffeepierecipe, x95, y95);
    }
  
    //LOADS BACK BUTTON
     backbtn = loadImage("backbtn.jpg");{
               image(backbtn, x105, y105); 
    }
        if(overButton (x105, y105, bW, bH) == true){ //press to go back to dessert column menu
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



/////function for navigating between page functions
void mousePressed() {
  
////CHICKEN ICON BUTTON
    if(page==1) {
       if (overButton (x1, y1, bW, bH) == true){
           
           page=2;} //takes you to chicken column page
}


////CHICKEN PIE COLOUMN
    if(page == 2){
      if (overButton (x32, y32, bW, bH) == true){
    
           page = 6;} //takes you to chicken pie recipe page
}

////CHICKEN PIE BACK BUTTON
    if(page==6){
       if(overButton (x70, y70, bW, bH) == true){
  
          page = 2;} //chicken column page
}



////CHICKEN & BACON COLUMN
    if(page==2){
       if(overButton (x33, y33, bW, bH) == true){
    
          page = 7;} //takes you to chicken & bacon recipe page
}


////CHICKEN & BACON BACK BUTTON
    if(page==7){
       if(overButton (x71, y71, bW, bH) == true){
    
          page = 2;} //chicken column page
}


////CHICKEN TIKKA COLUMN
    if(page==2){
       if(overButton (x34, y34, bW, bH) == true){
    
          page = 8;} //takes you to chicken tikka recipe page
}


////CHICKEN TIKKA BACK BUTTON
    if(page==8){
       if(overButton (x72, y72, bW, bH) == true){
    
          page = 2;} //chicken column page
}


////CHICKEN SATAY COLUMN
    if(page==2){
       if(overButton (x35, y35, bW, bH) == true){
    
           page = 9;} //takes you to chicken satay recipe page
}
    
////CHICKEN SATAY BACK BUTTON
    if(page==9){
       if(overButton (x73, y73, bW, bH) == true){
    
          page = 2;} //chicken column page
    
}


////MENU BUTTON ON CHICKEN COLUMN PAGE  
    if(page==2){
       if (overButton(x22, y22, bW, bH) == true){

           page=1;} //Returns to main menu  
} 
  
  
////COW ICON BUTTON
     if(page==1) {
        if (overButton (x2, y2, bW, bH) == true){
            
            page=3;} //takes you to beef column page 
}


////STEAK PIE COLUMN
    if(page==3){
       if(overButton (x42, y42, bW, bH) == true){
    
       page = 10;} //takes you to steak pie recipe
}

////STEAK PIE BACK BUTTON
   if(page==10){
      if(overButton (x74, y74, bW, bH) == true){
    
         page = 3;} //Returns to beef column page
}


////BEEF BURGER COLUMN
    if(page==3){
       if(overButton (x43, y43, bW, bH) == true){
    
          page = 11;} //takes you to beef burger recipe page
}


////BEEF BURGER BACK BUTTON
    if(page==11){
       if(overButton (x75, y75, bW, bH) == true){
    
          page = 3;} //Returns to beef column page
}


////MEATBALLS COLUMN
    if(page==3){
       if(overButton (x44, y44, bW, bH) == true){
    
          page = 12;} //takes you to meatballs recipe page
}


////MEATBALLS BACK BUTTON
    if(page==12){
       if(overButton (x76, y76, bW, bH) == true){
    
          page = 3;} //Returns to beef column page
}   


////STEAK&CHIPS COLUMN
    if(page==3){
       if(overButton (x45, y45, bW, bH) == true){
     
          page = 13;} //takes you to steak & chips recipe page
}
  
////STEAK&CHIPS COLUMN
    if(page==13){
       if(overButton (x77, y77, bW, bH) == true){
    
          page = 3;} //Returns to beef column page
}


  
////MENU BUTTON OF BEEF COLUMN PAGE
     if(page==3){
        if (overButton(x23, y23, bW, bH) == true){
    
            page=1;} //Returns to main icon menu  
} 


////FISH ICON BUTTON
    if(page==1){
       if (overButton (x3, y3, bW, bH) == true){
      
           page=4;} //takes you to fish column page
}


////FISH PIE COLUMN
    if(page==4){
      if(overButton (x52, y52, bW, bH) == true){
    
         page = 14;} //takes you to fish pie recipe page
}


////FISH PIE BACK BUTTON
    if(page==14){
       if(overButton (x78, y78, bW, bH) == true){
    
          page = 4;} //Returns you to fish column page
}


////FISH TIKKA COLUMN
    if(page==4){
       if(overButton (x53, y53, bW, bH) == true){
    
           page = 15;} //takes you to fish tikka recipe page
}


////FISH TIKKA BACK BUTTON
    if(page==15){
       if(overButton (x79, y79, bW, bH) == true){
    
          page = 4;} //Returns you to fish column page
}


////FISHCAKE COLUMN
    if(page==4){
       if(overButton (x54, y54, bW, bH) == true){
    
          page = 16;} //takes you to fish cake recipe page
}


////FISHCAKE BACK BUTTON
    if(page==16){
       if(overButton (x100, y100, bW, bH) == true){
    
          page = 4;} //Returns you to fish column page
}


////COD & CHIPS COLUMN
    if(page==4){
       if(overButton (x55, y55, bW, bH) == true){
  
          page = 17;} //takes you to cod & chips page
}


////COD & CHIPS BACK BUTTON
    if(page==17){
       if(overButton (x101, y101, bW, bH) == true){
    
          page = 4;} //Returns you to fish column page
}
    
    
////MENU BUTTON ON FISH COLUMN PAGE
    if(page==4){
       if (overButton(x24, y24, bW, bH) == true){
     
           page=1;} //Returns to main icon menu 
}
  
  
////DESSERT ICON BUTTON
    if(page==1) {
       if (overButton (x4, y4, bW, bH) == true){
      
           page=5;} //takes you to dessert column page
}

////LEMON CHEESE CAKE COLUMN
    if(page==5){
       if(overButton (x62, y62, bW, bH) == true){
    
          page=18;} //takes you to lemon cheesecake recipe page
}

////LEMON CHEESECAKE BACK BUTTON
    if(page==18){
       if(overButton (x102, y102, bW, bH) == true){
    
          page = 5;} //Returns you to dessert column page
}


////PAVLOVA COLUMN
    if(page == 5){
       if(overButton (x63, y63, bW, bH) == true){
    
          page = 19;} //takes you to pavlova recipe page
}


////PAVLOVA BACK BUTTON
    if(page==19){
       if(overButton (x103, y103, bW, bH) == true){
    
          page = 5;} //Returns you to dessert column page
}


////CHOCOLATE FUDGE CAKE COLUMN
    if(page == 5){
       if(overButton (x64, y64, bW, bH) == true){
    
          page = 20;} //takes you to chocolate fudge cake recipe page
}


////CHOCOLATE FUDGE CAKE BACK BUTTON
    if(page==20){
      if(overButton (x104, y104, bW, bH) == true){
    
         page = 5;} //Returns you to dessert column page
}


////BANNOFFEE PIE COLUMN
    if(page == 5){
       if(overButton (x65, y65, bW, bH) == true){
    
          page = 21;} //takes you to bannofee pie recipe page
}


////BANNOFEE PIE BACK BUTTON
    if(page==21){
       if(overButton (x105, y105, bW, bH) == true){
    
          page = 5;} //Returns you to dessert column page
}

  
////MENU BUTTON ON DESSERT PAGE 
    if(page==5){
       if (overButton(x25, y25, bW, bH) == true){
     
           page=1;} //Returns to main iconmenu 
}
}




