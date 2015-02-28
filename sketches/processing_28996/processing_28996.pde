



// issues with fading of the lines and such by hour
// issueS WITH THE HOURS OF THE FADE INS AND OUTS --> NEED TO BE RE ALIGNED
// WANT --> A TRANSPARENT BACKGOUND



PImage fPeachL;  //f for filling
//PImage fPeachR;
PImage fPeachR1;
PImage fPeachR2;
PImage flDarkGreen;
PImage fYellowL;
PImage fYellowR;
PImage fLightGreen; 
PImage peachDark;
PImage redL;
PImage redR;
//img peachLight - ?
PImage fuschiaL;
PImage fuschiaR;
PImage pinkLight;
PImage orangeLight;
PImage orangeDarkL;
PImage orangeDarkR;
PImage grayGreen;
PImage grayBlue;
PImage blueDark;
PImage blueLight;
PImage greenDark;
PImage greenLight;


//3 variables to set up

float s; //seconds
float m; //minutes
float h; //hours

float currentTime; // or now
float pastTime; 
float pastHour;

float ratio;



//cliff suggests array  (for options)






void setup () {
  size (1000, 500);
  //background --> to be addressed


  fPeachL = loadImage ("layer4p12.png");  //  - 3/4 of 12
  //fPeachR = loadImage ("layer4p34.png");  
  fPeachR1 = loadImage ("layer4p3.png"); // 2 hr minutes
  fPeachR2 = loadImage ("layer4p4.png"); // 2 hr seconds
  flDarkGreen = loadImage ("layer6.png"); //  -  (!) 1/4 of 12 + 0 hour seconds 
  fYellowL = loadImage ("layer7p12.png"); // - (!)  3 hrs sec
  fYellowR = loadImage ("layer7p34.png"); //  -  3/4 of 12 
  fLightGreen = loadImage ("layer8.png"); //  - (!) 2/4 pf 12  6 hours seconds
  peachDark = loadImage ("layer2.png");  // 5 hr sec
  redL = loadImage ("layer3p1.png"); // 8 hr sec
  redR = loadImage ("layer3p2.png");  // 8 hr minutes
  fuschiaL = loadImage ("layer1p1.png");  // 3 hr minute  --> STILL NEED SEC
  fuschiaR = loadImage ("layer1p2.png");  //7 minutes ... seconds ??
  pinkLight = loadImage ("layer14.png");  // 9 hr
  orangeLight = loadImage ("layer12.png");   // 0 hrs minutes
  orangeDarkL = loadImage ("layer11p1.png");  // 4 hr minute 
  orangeDarkR = loadImage ("layer11p2.png");  // 4 hr sec
  grayGreen = loadImage ("layer5.png");  // 10 hrs minutes
  grayBlue = loadImage ("layer15.png");  // 12 hrs  minutes
  blueDark = loadImage ("layer16.png");  // 1 hr minutes 
  blueLight = loadImage ("layer13.png");  // 1 hr seconds
  greenDark = loadImage ("layer10.png");   // 5 hr minute
  greenLight = loadImage ("layer9.png");  // 6 hr minutes
}


void draw () {


  // calibrate the time : "when draw hits ... make it sync with current time"
  
  currentTime = second () + hour () * 60.0 * 60.0 + minute () * 60.0; 
  println(currentTime);
  
  
  background (255); 
  
  // TRANSPARENT RECTANGLE size of screen !!!
  h = hour ();
  // test first : 


  //fill ();
  // rect (0, 0, width, height); 
  
  // fade / fill frames

  // remember tint w/out color mode, 4 variables

  if (hour () >= 0 && hour () < 3) {
    tint (255, 255, 255, (currentTime / (1 * 3 * 60.0 * 60.0)) * 255);   //current time at 1
    image (flDarkGreen, 0, 0); 
    tint (255, 255, 255, 255);
  }

  else if (hour () >= 3 && hour () < 6) {
    image (flDarkGreen, 0, 0);             // PAST FILL
    tint (255, 255, 255, ((currentTime - (1 * 3 * 60.0 * 60.0)) / (1 * 3 * 60.0 * 60.0)) * 255);   // current time at 1 
    image (fLightGreen, 0, 0); 
    tint (255, 255, 255, 255);
  }

  else if (hour () >= 6 && hour () < 9) {
    image (flDarkGreen, 0, 0);     
    image (fLightGreen, 0, 0); 
    tint (255, 255, 255, ((currentTime - (2 * 3 * 60.0 * 60.0)) / (1 * 3 * 60.0 * 60.0)) * 255);   // same (past time update later, not there yet) 
    image (fYellowR, 0, 0); 
    tint (255, 255, 255, 255);
  }

  else if (hour () >= 9 && hour () < 12) {
    image (flDarkGreen, 0, 0);     
    image (fLightGreen, 0, 0);
    image (fYellowR, 0, 0); 
    tint (255, 255, 255, ((currentTime - (3 * 3*  60.0 * 60.0)) / (1 * 3 * 60.0 * 60.0)) * 255);   // same (past time update later, not there yet) 
    image (fPeachL, 0, 0); 
    tint (255, 255, 255, 255);
  }

  // reverse of the fills  --> FADE

  if (hour () >= 12 && hour () < 15) {
    image (flDarkGreen, 0, 0);     
    image (fLightGreen, 0, 0);
    image (fYellowR, 0, 0);
    tint (255, 255, 255, ( 1- ((currentTime - (4 * 3 * 60.0 * 60.0)) / (1 * 3 * 60.0 * 60.0)) ) * 255);   //  1 - inverse for transparent fade effect  
    image (fPeachL, 0, 0); 
    tint (255, 255, 255, 255);
  }

  else if (hour () >= 15 && hour () < 18) {
    image (flDarkGreen, 0, 0);     
    image (fLightGreen, 0, 0);
    tint (255, 255, 255, ( 1- ((currentTime - (5 * 3 *  60.0 * 60.0)) / (1 * 3 * 60.0 * 60.0)) ) * 255);   
    image (fYellowR, 0, 0); 
    tint (255, 255, 255, 255);
  }

  else if (hour () >= 18 && hour () < 21) {
    image (flDarkGreen, 0, 0);             // PAST FILL
    tint (255, 255, 255, ( 1- ((currentTime - (6 * 3 * 60.0 * 60.0)) / (1 * 3 * 60.0 * 60.0)) ) * 255);  
    image (fLightGreen, 0, 0); 
    tint (255, 255, 255, 255);
  }

  else if (hour () >= 21 && hour () < 24) {
    tint (255, 255, 255, ( 1- ((currentTime - (7 * 3 * 60.0 * 60.0)) / (1 * 3 * 60.0 * 60.0)) ) * 255);  
    image (flDarkGreen, 0, 0); 
    tint (255, 255, 255, 255);
  } 





  // hour order

  if( h == 1) {
    image (orangeLight, 0, 0);
    //REMEMBER DARK GREEN FILL
  }

  if(h == 2) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    //rem.  GREEENNNN !!
  }

  if (h == 3) { 
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    //REMEMBER DARK GREEN FILL 

    //Remember fDarkGreen is here now
    //fLightGreenShouldbegin to load here
  }


  if (h == 4) { 
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
  }

  if (h == 5) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
  } 

  if (h == 6) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  

    //Remember fDarkGreen, fLightGreen are here now
    //fYellowRshould begin to load
  } 

  if (h == 7) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);
  } 

  if (h == 8) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);
    image (fuschiaL, 0, 0);
    image (fYellowL, 0, 0);
  }

  if (h == 9) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);
    image (fuschiaL, 0, 0);
    image (fYellowL, 0, 0);
    image (redL, 0, 0);
    image (redR, 0, 0);     
    // all but fPeachL are loaded... fPeachL should start here
  }

  if (h == 10) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);
    image (fuschiaL, 0, 0);
    image (fYellowL, 0, 0);
    image (redL, 0, 0);
    image (redR, 0, 0);   
    image (pinkLight, 0, 0);
    // all but fPeachL are loaded... fPeachL should start here
  }

  if (h == 11) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);
    image (fuschiaL, 0, 0);
    image (fYellowL, 0, 0);
    image (redL, 0, 0);
    image (redR, 0, 0);   
    image (pinkLight, 0, 0);
    image (grayGreen, 0, 0);  
    // all but fPeachL are loaded... fPeachL should start here
  }


  if (h == 12) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);
    image (fuschiaL, 0, 0);
    image (fYellowL, 0, 0);
    image (redL, 0, 0);
    image (redR, 0, 0);   
    image (pinkLight, 0, 0);
    image (grayGreen, 0, 0);
    image (grayBlue, 0, 0);
    //
  }

  if (h == 13) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);
    image (fuschiaL, 0, 0);
    image (fYellowL, 0, 0);
    image (redL, 0, 0);
    image (redR, 0, 0);   
    image (pinkLight, 0, 0);
    image (grayGreen, 0, 0); 
    // Peach retracts
  }

  if (h == 14) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);
    image (fuschiaL, 0, 0);
    image (fYellowL, 0, 0);
    image (redL, 0, 0);
    image (redR, 0, 0);   
    image (pinkLight, 0, 0);
  }

  if (h == 15) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);
    image (fuschiaL, 0, 0);
    image (fYellowL, 0, 0);
    image (redL, 0, 0);
    image (redR, 0, 0);    
    // all but fPeachL are loaded... fPeachL should start here
  }

  if (h == 16) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);
    image (fuschiaL, 0, 0);
    image (fYellowL, 0, 0);  
    // all but fPeachL are loaded... fPeachL should start here
  }

  if (h == 17) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);  
    image (greenLight, 0, 0);
    image (fLightGreen, 0, 0);  
    // all but fPeachL are loaded... fPeachL should start here
  }

  if (h == 18) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);
    image (peachDark, 0, 0);
    image (greenDark, 0, 0);
  }

  if (h == 19) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
    image (orangeDarkL, 0, 0);
    image (orangeDarkR, 0, 0);   
    //
  } 

  if (h == 20) { 
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    image (fuschiaR, 0, 0);
    //maybe for sec : 
    //image (fYellowR, 0, 0);
    //image (orangeLight, 0, 0);
  }

  if (h == 21) { 
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    image (fPeachR2, 0, 0);
    image (fPeachR1, 0, 0);
    //REMEMBER DARK GREEN FILL    
    //Remember fDarkGreen is here now
    //fLightGreenShouldbegin to load here
  }

  if(h == 22) {
    image (orangeLight, 0, 0);
    image (blueDark, 0, 0);
    image (blueLight, 0, 0);
    //rem.  GREEENNNN !!
  }

  if( h == 23) {
    image (orangeLight, 0, 0);
    //REMEMBER DARK GREEN FILL
  }





 // if (second () >= 0 && second () < 15) { 
   // ratio = (second () - (0 * 15)) / 15;  // this ratio is determining the alpha ratio
    //fill (255, 255, 255, ratio * 255);
   // rect (0, 0, width, height);



    if (currentTime >= 0 && currentTime < 1 * 3600.0) {

      tint (255, 255, 255, (second()/60.0) * 255);
      image (orangeLight, 0, 0);
      tint (255, 255, 255, 255);

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255);
      image (orangeLight, 0, 0);
      tint (255, 255, 255, 255);
    }

    if (currentTime >= 1 * 3600.0 && currentTime < 2 * 3600.0) {

      tint (255, 255, 255, (second()/60.0) * 255);
      image (blueDark, 0, 0);
      tint (255, 255, 255, 255);

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255);
      image (blueLight, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 2 * 3600.0 && currentTime < 3 * 3600.0) {

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255);
      image (fPeachR2, 0, 0); 
      tint (255, 255, 255, 255);  

      tint (255, 255, 255, (second()/60.0) * 255);
      image (fPeachR1, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 3 * 3600.0 && currentTime < 4 * 3600.0) {

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255);
      image (fuschiaR, 0, 0); 
      tint  (255, 255, 255, 255);

      tint (255, 255, 255, (second()/60.0) * 255);
      image (fYellowR, 0, 0);
      tint (255, 255, 255, 255);
    } 



    if (currentTime >= 4 * 3600.0 && currentTime < 5 * 3600.0) {
      tint (255, 255, 255, (second()/60.0) * 255);
      image (orangeDarkR, 0, 0);
      tint (255, 255, 255, 255);

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255);
      image (orangeDarkL, 0, 0);
      tint (255, 255, 255, 255);
    }

    if (currentTime >= 5 * 3600.0 && currentTime < 6 * 3600.0) {

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255);
      image (greenDark, 0, 0);   
      tint (255, 255, 255, 255);

      tint (255, 255, 255, (second()/60.0) * 255); 
      image (peachDark, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 6 * 3600.0 && currentTime < 7 * 3600.0) {

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255);
      image (greenLight, 0, 0);
      tint (255, 255, 255, 255);

      tint (255, 255, 255, (second()/60.0) * 255);  
      //image (blueLight, 0, 0);
      image (fLightGreen, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 7 * 3600.0 && currentTime < 8 * 3600.0) {

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255); 
      tint (255, 255, 255, 255);


      tint (255, 255, 255, (second()/60.0) * 255);    
      image (fuschiaL, 0, 0);
      tint (255, 255, 255, 255);
    } 



    if (currentTime >= 8 * 3600.0 && currentTime < 9 * 3600.0) {

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255); 
      image (redR, 0, 0);  
      tint (255, 255, 255, 255);

      tint (255, 255, 255, (second()/60.0) * 255);
      image (redR, 0, 0);  
      tint (255, 255, 255, 255);
    }

    if (currentTime >= 9 * 3600.0 && currentTime < 10 * 3600.0) {

      tint (255, 255, 255, (second()/60.0) * 255);
      image (fYellowL, 0, 0);
      tint (255, 255, 255, 255);


      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255); 
      image (pinkLight, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 10 * 3600.0 && currentTime < 11 * 3600.0) {

      tint (255, 255, 255, (second()/60.0) * 255);  
      image (fYellowL, 0, 0);
      image (blueLight, 0, 0);
      tint (255, 255, 255, 255);  

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255); 
      image (grayGreen, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 11 * 3600.0 && currentTime < 12 * 3600.0) {


      tint (255, 255, 255, (second()/60.0) * 255);  
      image (fPeachL, 0, 0);
      image (orangeLight, 0, 0);
      image (redR, 0, 0);
      tint (255, 255, 255, 255);  

      tint (255, 255, 255, ((minute() * 60.0) + second ()) / 3600.0 * 255); 
      image (grayBlue, 0, 0);
      tint (255, 255, 255, 255);
    } 



    if (currentTime >= 12 * 3600.0 && currentTime < 13 * 3600.0) {


      tint  (255, 255, 255, ( 1- (second()/60.0) )* 255);  
      image (fPeachL, 0, 0);
      image (orangeLight, 0, 0);
      image (redR, 0, 0);
      tint (255, 255, 255, 255);  

      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255); 
      image (grayBlue, 0, 0);
      tint (255, 255, 255, 255);
    }

    if (currentTime >= 13 * 3600.0 && currentTime < 14 * 3600.0) {

      tint (255, 255, 255,( 1- (second()/60.0) )* 255);  
      image (fYellowL, 0, 0);
      image (blueLight, 0, 0);
      tint (255, 255, 255, 255);  

      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255); 
      image (grayGreen, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 14 * 3600.0 && currentTime < 15 * 3600.0) {

      tint (255, 255, 255, ( 1- (second()/60.0) )* 255);
      image (fYellowL, 0, 0);
      tint (255, 255, 255, 255);


      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255); 
      image (pinkLight, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 15 * 3600.0 && currentTime < 16 * 3600.0) {


      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255); 
      image (redR, 0, 0);  
      tint (255, 255, 255, 255);

      tint (255, 255, 255, ( 1- (second()/60.0) )* 255);
      image (redR, 0, 0);  
      tint (255, 255, 255, 255);
    } 



    if (currentTime >= 16 * 3600.0 && currentTime < 17 * 3600.0) {


      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255); 
      image (redR, 0, 0);  
      tint (255, 255, 255, 255);

      tint (255, 255, 255, ( 1- (second()/60.0) )* 255);
      image (redR, 0, 0);  
      tint (255, 255, 255, 255);
    } 



    if (currentTime >= 17 * 3600.0 && currentTime < 18 * 3600.0) {

      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255); 
      tint (255, 255, 255, 255);


      tint (255, 255, 255,( 1- (second()/60.0) )* 255);    
      image (fuschiaL, 0, 0);
      tint (255, 255, 255, 255);
    }

    if (currentTime >= 18 * 3600.0 && currentTime < 19 * 3600.0) {


      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255);
      image (greenLight, 0, 0);
      tint (255, 255, 255, 255);

      tint (255, 255, 255,( 1- (second()/60.0) )* 255);  
      //image (blueLight, 0, 0);
      image (fLightGreen, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 19 * 3600.0 && currentTime < 20 * 3600.0) {


      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255);
      image (greenDark, 0, 0);   
      tint (255, 255, 255, 255);

      tint (255, 255, 255, ( 1- (second()/60.0) )* 255); 
      image (peachDark, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 20 * 3600.0 && currentTime < 21 * 3600.0) {

      tint (255, 255, 255,( 1- (second()/60.0) )* 255);
      image (orangeDarkR, 0, 0);
      tint (255, 255, 255, 255);

      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255);
      image (orangeDarkL, 0, 0);
      tint (255, 255, 255, 255);
    } 



    if (currentTime >= 21 * 3600.0 && currentTime < 22 * 3600.0) {


      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255);
      image (fuschiaR, 0, 0); 
      tint  (255, 255, 255, 255);

      tint (255, 255, 255, ( 1- (second()/60.0) )* 255);
      image (fYellowR, 0, 0);
      tint (255, 255, 255, 255);
    }

    if (currentTime >= 22 * 3600.0 && currentTime < 23 * 3600.0) {

      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255);
      image (fPeachR2, 0, 0); 
      tint (255, 255, 255, 255);  

      tint (255, 255, 255, ( 1- (second()/60.0) )* 255);
      image (fPeachR1, 0, 0);
      tint (255, 255, 255, 255);
    } 


    if (currentTime >= 23 * 3600.0 && currentTime < 24 * 3600.0) {
      tint (255, 255, 255, ( 1- (second()/60.0) )* 255);
      image (blueDark, 0, 0);
      tint (255, 255, 255, 255);

      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255);
      image (blueLight, 0, 0);
      tint (255, 255, 255, 255);  


      // last hour to fit in

      tint (255, 255, 255, ( 1- (second()/60.0) )* 255);
      image (orangeLight, 0, 0);
      tint (255, 255, 255, 255);

      tint (255, 255, 255, ( 1 - ( (minute() * 60.0) + second ()) / 3600.0) * 255);
      image (orangeLight, 0, 0);
      tint (255, 255, 255, 255);
    } 

    //notes from cliff
    //noStroke();
    //fill(0, ( ((minute() * 60.0) + second ()) /3600.0)*255); 
    //rect(0, 0, 400, 400);
    //
    //tint(255,255,255,(second()/60.0)*255);
    //image(blueDark,0,0);
    //println(second());
    //println(currentTime);
    //was forgeting the .0, and remember that seconds graduation is keyed in to data being imput --> change clocks on comp to me

    // RANDOMLIKE
    //tint(255,255,255,25);
    //tint (255, 255, 255, (second () / 60.0) * 255); 
    //fill (0, (second () / 60.0) * 100); 
    //rect ( 90, 40, 90, 340);
    //tint (255, 255, 255, 50); 

    //tint (255, 255, 255, ( (minute () * 60.0 + second ()) / 3600.0) * 255);   // additional parenthasis for the block strucker avoiding... like thing
    //rect (72, 80, 72, 80);
    //tint (255, 255, 255, 255); 
    //println(second());
    // forgot the .0  !!!! big difference

    //VOID DRAW CLOSING BRACETS
  }


  //if (currentTime >= 0 && currentTime < 1 * 3600.0) {
  //tint
  //images rel. for first hour
  //tint (255, 255, 255, 255);
  //}

  //if (currentTime >= 1 * 3600.0 && currentTime < 2 * 3600.0) {
    


