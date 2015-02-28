
//Homework 12
 
//Danielle Dong
//dmdong@andrew.cmu.edu
//copyright Danielle Dong, Carnegie Mellon University, Pittburgh, PA

//data on water consumption taken from:
//  http://www.worldwater.org/data.html (accessed 11/25/2012)
//  Pacific Institute
//  The World's Water: Information on the World's Freshwater Resources
//  Water Data from the World's Water
//  "Table 2: Freshwater Withdrawal, by Country and Sector (2010 Update)"

// press 'd' to slow down the speed of the countries changing
// press 'a' to speed it back up (max 1 country per second)

//global variables & arrays
int sec,pSec,counter;

int switchSpeed = 2;

float dripPosX;
float dripPosY;
float dripSizeX;
float dripSizeY;
float dripSpeed;
int dripCount = 0;

int poolHeight;
int [] percapitawithdrawal =  {   171, 18, 14, 96, 49, 34, 50, 39, 7, 20, 14, 5, 8, 43, 23, 809, 159, 111, 65, 80, 17, 40, 146, 109, 67, 24, 27, 652, 743, 64, 492, 505, 470, 389, 27, 136, 137, 51, 15, 173, 65, 352, 248, 864, 865, 115, 25, 254, 9, 131, 333,
                                  56, 351, 479, 1330, 116, 732, 256, 332, 207, 140, 97, 113, 150, 721, 223, 234, 75, 92, 231, 1518, 
                                  718, 144, 297, 732, 231, 1233, 2154, 76, 682, 1278, 934, 288, 
                                  799, 915, 1367, 442, 253, 607, 221, 271, 425, 239, 384, 627, 356, 1243, 2097, 268, 696, 145, 2222, 376, 525, 299, 1816, 466, 308, 323, 10, 163, 658, 341, 455, 993, 95, 843, 294, 902, 39, 618, 742, 1690, 841, 530, 4762, 849, 2099, 802, 140, 
                                  540, 438, 291, 695, 923, 183, 122, 1053, 436, 529, 463, 778, 2109, 516, 257, 699, 112, 1023, 116, 1111, 49, 646, 532, 494, 308, 1033, 307, 546, 192, 444, 821, 288, 332, 826, 190,
                                  2782, 82, 490, 15  
                              };

String [] countryName =  {  "Algeria", "Angola", "Benin", "Botswana", "Burkina Faso", "Burundi", "Cameroon", "Cape Verde", "Central African Republic", "Chad", "Comoros", "Congo, Democratic Republic", "Congo, Republic of", "Cote D Ivoire", "Djibouti", "Egypt", "Equatorial Guinea", "Eritrea", "Ethiopia", "Gabon", "Gambia", "Ghana", "Guinea", "Guinea-Bissau", "Kenya", "Lesotho", "Liberia", "Libya", "Madagascar", "Malawi", "Mali", "Mauritania", "Mauritius", "Morocco", "Mozambique", "Namibia", "Niger", "Nigeria", "Rwanda", "Senegal", "Sierra Leone", "Somalia", "South Africa", "Sudan", "Swaziland", "Tanzania", "Togo", "Tunisia", "Uganda", "Zambia", "Zimbabwe",
                            "Antigua and Barbuda", "Barbados", "Belize", "Canada", "Costa Rica", "Cuba", "Dominica", "Dominican Republic", "El Salvador", "Guatemala", "Haiti", "Honduras", "Jamaica", "Mexico", "Nicaragua", "Panama", "St. Lucia", "St. Vincent and the Grenadines", "Trinidad and Tobago", "United States of America", 
                            "Argentina", "Bolivia", "Brazil", "Chile", "Colombia", "Ecuador", "Guyana", "Paraguay", "Peru", "Suriname", "Uruguay", "Venezuela", 
                            "Afghanistan", "Armenia", "Azerbaijan", "Bahrain", "Bangladesh", "Bhutan", "Brunei", "Cambodia", "China", "Cyprus", "Georgia", "India", "Indonesia", "Iran", "Iraq", "Israel", "Japan", "Jordan", "Kazakhstan", "Korea Democratic People's Republic", "Korea Rep", "Kuwait", "Kyrgyz Republic", "Laos", "Lebanon", "Malaysia", "Maldives", "Mongolia", "Myanmar", "Nepal", "Oman", "Pakistan", "Palestine (Occupied Palestinian Territory)", "Philippines", "Qatar", "Saudi Arabia", "Singapore", "Sri Lanka", "Syria", "Tajikistan", "Thailand", "Turkey", "Turkmenistan", "United Arab Emirates", "Uzbekistan", "Vietnam", "Yemen", 
                            "Albania", "Austria", "Belarus", "Belgium", "Bulgaria", "Czech Republic", "Denmark", "Estonia", "Finland", "France", "Germany", "Greece", "Hungary", "Iceland", "Ireland", "Italy", "Latvia", "Lithuania", "Luxembourg", "Macedonia", "Malta", "Moldova", "Netherlands", "Norway", "Poland", "Portugal", "Romania", "Russian Federation", "Slovakia", "Slovenia", "Spain", "Sweden", "Switzerland", "Ukraine", "United Kingdom", 
                            "Australia", "Fiji", "New Zealand", "Papua New Guinea"};









void setup ()  {
  size (500,600);
  frameRate (30);
  rectMode (RADIUS);
  ellipseMode (CENTER);
  textAlign (CENTER);
  noStroke();
  
  dripPosX = width/2;
  dripPosY = 0;
  dripSizeX = 15;
  dripSizeY = 15;
  dripSpeed = 12;
}


void draw ()  {
  background (255);
  
  timeCounter ();
  countryPer10();
  
//println (counter);
//println (poolHeight);
println (switchSpeed);

  waterDrip();
  waterPool();
}










void keyPressed ()  {
  if (key == 'a' && switchSpeed !=1 )  {
    switchSpeed = switchSpeed - 1;
    
  }
  if (key == 'd')  {
    switchSpeed = switchSpeed + 1;
  }
}


void timeCounter ()  {  
  sec = second()/switchSpeed; 
  if(pSec != sec) {
    counter++;
  }
  pSec = sec;
}

void countryPer10()  {
  if (counter % percapitawithdrawal.length == 0) {
    counter = 0;  /*resets counter so that array percapitawithdrawal is traversed every 10 seconds*/
   }
}


void waterPool ()  {
  pushStyle();
  {int i = counter;
    poolHeight = 100 + ((percapitawithdrawal[i]/1000)*200) ;
    
    fill (0, 255, 253, 50);
    rect (width/2, height, width, poolHeight);
    
    fill (0,75, 255, 80);
    textSize (40);
    text (countryName[i], width/2, height-poolHeight-10);
    textSize (50);
    text (percapitawithdrawal[i], width/2, height-poolHeight+50);
    textSize (10);
    text ("m^3/p/yr", width/2, height-poolHeight+60);
  }
  popStyle();
}


void waterDrip ()  {
  {int i = counter;
    pushStyle();
    noStroke();
    fill (0, 255, 253, 90);
    triangle (dripPosX-(dripSizeX/2), dripPosY, dripPosX+(dripSizeX/2), dripPosY, dripPosX, dripPosY-(1.75*dripSizeY) );
    ellipse (dripPosX, dripPosY, dripSizeX, dripSizeY);
    popStyle();
  
    if (frameCount > 0)  {
      dripPosY = dripPosY + dripSpeed;
    }
    if ( (dripPosY -(1.75*dripSizeY) ) > height-poolHeight )  {
      dripPosY = 0;
    }
  }
}




