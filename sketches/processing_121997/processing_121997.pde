
class Location {// class constructor
 int LYpos, LXpos, LWidth, LHeight;//expected variables
 int i;
 PImage Marker;
 
  Location (int LX, int LY, int LW, int LH, int i){  
    LYpos = LY; 
    LXpos = LX; 
    LWidth = LW;
    LHeight = LH;
    

  } 
 
// Below code dictates where the Marker will be displayed on the map.
  
void update() { 
  mousePressed();
  {
  mouseMoved();
  Marker = loadImage("whateveryoulikedomRED.png");
  image(Marker, LXpos-10, LYpos-10);
  }
    
}

void mouseMoved(){
 
if(pmouseX > LXpos -10 && pmouseX< LXpos +10 && pmouseY >LYpos -10 && pmouseY < LYpos +10)//highlights location markers
  fill(89,252,3,160); 
else
  fill(89,252,3,160);


    if(pmouseX > LXpos -10 && pmouseX< LXpos +10 && pmouseY >LYpos -10 && pmouseY < LYpos +10){
      noStroke();
      image(Marker, LXpos, LYpos); //Displays the red marker
      fill(64,86,137,160);
      rect(LXpos,LYpos,200,50); //Displays the transparent box that the text is displayed within
      fill(0);
      fill(255, 255, 255);
      text(Information[i],LXpos+10,LYpos+20); //Display the Information In The Box
      fill(255, 255, 255, 0);
      
// The below code states where the mouse can interact with the array on the map.
       
if(pmouseX > 630 && pmouseX < 650 && pmouseY > 100 && pmouseY < 80){i = 1;}//dalhousie building
if(pmouseX > 525 && pmouseX < 545 && pmouseY > 95 && pmouseY < 115){i = 2;}//heathfield residences
if(pmouseX > 805 && pmouseX < 825 && pmouseY > 505 && pmouseY < 525){i = 3;}//careers services
if(pmouseX > 315 && pmouseX < 335 && pmouseY > 325 && pmouseY < 345){i = 4;}//medical sciences institute
if(pmouseX > 380 && pmouseX < 400 && pmouseY > 180 && pmouseY < 200){i = 5;}//ISE Building
if(pmouseX > 707 && pmouseX < 727 && pmouseY > 175 && pmouseY < 195){i = 6;}//estates and building office
if(pmouseX > 782 && pmouseX < 802 && pmouseY > 158 && pmouseY < 178){i = 7;}//fulton building
if(pmouseX > 924 && pmouseX < 944 && pmouseY > 250 && pmouseY < 270){i = 8;}//dundee dental hospital and school
if(pmouseX > 990 && pmouseX < 1010 && pmouseY > 341 && pmouseY < 361){i = 9;}//dundee dental education centre
if(pmouseX > 865 && pmouseX < 885 && pmouseY > 390 && pmouseY < 410){i = 10;}//D'Arcy Thompson Zoology Museum
if(pmouseX > 963 && pmouseX < 983 && pmouseY > 288 && pmouseY < 308){i = 11;}//old medical school
if(pmouseX > 945 && pmouseX < 965 && pmouseY > 409 && pmouseY < 429){i = 12;}//old technical institute
if(pmouseX > 400 && pmouseX < 420 && pmouseY > 440 && pmouseY < 460){i = 13;}//matthew building
if(pmouseX > 580 && pmouseX < 600 && pmouseY > 500 && pmouseY < 520){i = 14;}//crawford building
if(pmouseX > 660 && pmouseX < 680 && pmouseY > 380 && pmouseY < 400){i = 15;}//the union
if(pmouseX > 460 && pmouseX < 480 && pmouseY > 280 && pmouseY < 300){i = 16;}//belmont residences
if(pmouseX > 605 && pmouseX < 625 && pmouseY > 205 && pmouseY < 225){i = 17;}//queen mother building
if(pmouseX > 780 && pmouseX < 800 && pmouseY > 330 && pmouseY < 350){i = 18;}//main library
if(pmouseX > 832 && pmouseX < 852 && pmouseY > 269 && pmouseY < 289){i = 19;}//ewing building
if(pmouseX > 1050 && pmouseX < 1070 && pmouseY > 315 && pmouseY < 335){i = 20;}//Scrymgeour building
if(pmouseX > 1102 && pmouseX < 1122 && pmouseY > 383 && pmouseY < 403){i = 21;}//bonar hall
if(pmouseX > 997 && pmouseX < 1017 && pmouseY > 441 && pmouseY < 461){i = 22;}//tower building
    }
  }
}





void draw() { 
  image(Map,0,0); // Draws the Map
  
  l1.update(); 
  l2.update();
  l3.update(); 
  l4.update(); 
  l5.update();
  l6.update(); 
  l7.update();
  l8.update(); 
  l9.update(); 
  l10.update();  
  l11.update(); 
  l12.update();
  l13.update(); 
  l14.update(); 
  l15.update();
  l16.update(); 
  l17.update();
  l18.update(); 
  l19.update(); 
  l20.update();  
  l21.update(); 
  l22.update();
  
}//draws the background image and displays locations

// declares and constructs two location points
Location l1 =new Location(535,105,20,20,1);//heathfield residences
Location l2 =new Location(645,90,20,20,2);//dalhousie building
Location l3 =new Location(815,515,20,20,3);//Careers Service Unversity of Dundee
Location l4 =new Location(325,335,20,20,4);//Medical Sciences Institute
Location l5 =new Location(390,190,20,20,5);//ISE building
Location l6 =new Location(717,185,20,20,6);//Estates and building office
Location l7 =new Location(792,168,20,20,7);//Fulton Building
Location l8 =new Location(934,260,20,20,8);//Dundee Dental Hospital and School
Location l9 =new Location(973,302,20,20,9);//Dundee Dental Education Centre
Location l10 =new Location(1000,351,20,20,10);//D'Arcy Thompson Zoology Museum
Location l11 =new Location(973,298,20,20,11);//Old Medical School
Location l12 =new Location(955,419,20,20,12);//Old Technical Institute
Location l13 =new Location(410,450,20,20,13);//Matthew building
Location l14 =new Location(590,510,20,20,14);//Crawford building
Location l15 =new Location(670,390,20,20,15);//The Union
Location l16 =new Location(470,290,20,20,16);//Belmont Residences
Location l17 =new Location(615,215,20,20,17);//Queen Mother Building
Location l18 =new Location(790,340,20,20,18);//Main Library
Location l19 =new Location(842,279,20,20,19);//Ewing Building
Location l20 =new Location(1060,325,20,20,20);//Scrymgeour Building
Location l21 =new Location(1112,393,20,20,21);//Bonar Hall
Location l22 =new Location(1007,451,20,20,22);//Tower Building

int i = 0;//an integer used to read a position on the array

PImage Map;//declaration that there is an image it is the map
String [] Information;//declaration of array
 
void setup() 
{
 size(1200, 600);//size of the background
 Map = loadImage("FinalMap.png");//loads the background image 
  Information = new String [23];//array of information and names of places
    textSize(14); //Changes the size of the information in the boxes
    fill(255, 255, 255);
    
    //Below code is stored in an array, and is used to show the location names.
    
    Information[0] = "Dalhouse Building";
    Information[1] = "Dalhousie Building";
    Information[2] = "Heathfield Residences\nStudent Accomodation";
    Information[3] = "Careers Services";
    Information[4] = "Medical Sciences Institute";
    Information[5] = "ISE Building";
    Information[6] = "Estates and Building Office";
    Information[7] = "Fulton Building";
    Information[8] = "Dundee Dental\nHospital and School";
    Information[9] = "D'Arcy Thompson\nZoology Museum";
    Information[10] = "Dundee Dental\nEducation Centre";
    Information[11] = "Old Medical School";
    Information[12] = "Old Technical Institute";
    Information[13] = "Matthew Building";
    Information[14] = "Crawford Building";
    Information[15] = "The Union\n(SHOTS SHOTS SHOTS)";
    Information[16] = "Belmont Residences";
    Information[17] = "Queen Mother Building\nThe School of Computing";
    Information[18] = "Main Library";
    Information[19] = "Ewing Building";
    Information[20] = "Scrymgeour\nBuilding";
    Information[21] = "Bonar Hall";
    Information[22] = "Tower Building";
    

}




