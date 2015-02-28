
/*this code is based on*/
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/35536*@* */


PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10, img11, img12, img13, img14, img15, img16, img17, img18, img19, img20, img21
, img22, img23, img24, img25, img26, img27, img28, img29;


void setup() {
  setupAudio();
  size(500, 400, P2D);
  img1 = loadImage("001.jpg");
  img2 = loadImage("002.jpg");
  img3 = loadImage("003.jpg");
  img4 = loadImage("004.jpg");
  img5 = loadImage("005.jpg");
  img6 = loadImage("006.jpg");
  img7 = loadImage("007.jpg");
  img8 = loadImage("008.jpg");
  img9 = loadImage("009.jpg");
  img10 = loadImage("010.jpg");
  img11 = loadImage("011.jpg");
  img12 = loadImage("012.jpg");
  img13 = loadImage("013.jpg");
  img14 = loadImage("014.jpg");
  img15 = loadImage("015.jpg");
  img16 = loadImage("016.jpg");
  img17 = loadImage("017.jpg");
  img18 = loadImage("018.jpg");
  img19 = loadImage("019.jpg");
  img20 = loadImage("020.jpg");
  img21 = loadImage("021.jpg");
  img22 = loadImage("022.jpg");
  img23 = loadImage("023.jpg");
  img24 = loadImage("024.jpg");
  img25 = loadImage("025.jpg");
  img26 = loadImage("026.jpg");
  img27 = loadImage("027.jpg");
  img28 = loadImage("028.jpg");
  img29 = loadImage("029.jpg");
}

void draw() {
  background(0); 
  smooth();
  image(img29, 1, 10);

  float X =volume; 
  float Y =volume; 
  float Z=volume;
  float M =volume; 
  float V=volume; 
  float R =volume; 
  float W=volume;
  float I =volume; 
  float I1 =volume; 
  float I2 =volume; 
  float I3 =volume; 
  float I4 =volume; 
  float I5 =volume; 
  float I6 =volume; 
  float I7 =volume;  
  float I8 =volume; 
  float I9 =volume; 
  float U1 =volume; 
  float U2 =volume; 
  float U3 =volume; 
  float U4 =volume; 
  float U5 =volume; 
  float U6 =volume; 
  float U7 =volume; 
  float U8 =volume; 
  float U9 =volume; 
  float C =volume; 
  float C1 =volume; 
  float C2 =volume;  
  float A =volume; 
  float G =volume; 

  //every frame of homer
  getVolume(); // this call fetches the mic volume for the current frame.
  //  float X = map(volume, 0,100, 2,120); //map(value,lower value of current range, upper, lower target range, upper)
  if (X > 10) {
    X = 10;
    image(img29, 1, X);
  } 

  getVolume(); // this call fetches the mic volume for the current frame.
  if (Y > 20) {
    Y = 20;
    image(img28, 1, X);
  } 


  getVolume(); // this call fetches the mic volume for the current frame.
  if (Z > 30) {
    Z = 30;
    image(img27, 1, X);
  }

  getVolume(); // this call fetches the mic volume for the current frame.
  if (M > 40) {
    M = 40;
    image(img26, 1, X);
  } 

  getVolume(); // this call fetches the mic volume for the current frame.
  if (V > 50) {
    V = 50;
    image(img25, 1, X);
  } 

  getVolume(); // this call fetches the mic volume for the current frame.
  if (R > 60) {
    R = 60;
    image(img24, 1, X);
  } 

  getVolume(); // this call fetches the mic volume for the current frame.
  if (W > 70) {
    W = 70;
    image(img23, 1, X);
  } 

  getVolume(); // this call fetches the mic volume for the current frame.
  if (I > 80) {
    I = 80;
    image(img22, 1, X);
  } 


  getVolume(); // this call fetches the mic volume for the current frame.
  if (I1 > 90) {
    I1 = 90;
    image(img21, 1, X);
  } 

  getVolume(); // this call fetches the mic volume for the current frame.
  if (I2 > 100) {
    I2 = 100;
    image(img20, 1, X);
  } 

  getVolume(); // this call fetches the mic volume for the current frame.
  if (I3 > 110) {
    I3 = 110;
    image(img20, 1, X);
  } 

  getVolume(); // this call fetches the mic volume for the current frame.
  if (I4 > 120) {
    I4 =120;
    image(img19, 1, X);
  } 


  getVolume(); // this call fetches the mic volume for the current frame.
  if (I5 > 130) {
    I5 =130;
    image(img18, 1, X);
  } 

  getVolume(); // this call fetches the mic volume for the current frame.
  if (I6 > 140) {
    I6 =140;
    image(img17, 1, X);
  }  

  getVolume(); // this call fetches the mic volume for the current frame.
  if (I7 > 150) {
    I7 =150;
    image(img16, 1, X);
  }  

  getVolume(); // this call fetches the mic volume for the current frame.
  if (I8 > 160) {
    I8 =160;
    image(img15, 1, X);
  }   

  getVolume(); // this call fetches the mic volume for the current frame.
  if (I9 > 170) {
    I9 =170;
    image(img14, 1, X);
  }  

  getVolume(); // this call fetches the mic volume for the current frame.
  if (U1 > 180) {
    U1 =180;
    image(img13, 1, X);
  }  

  getVolume(); // this call fetches the mic volume for the current frame.
  if (U2 > 190) {
    U2 =190;
    image(img12, 1, X);
  }  

  getVolume(); // this call fetches the mic volume for the current frame.
  if (U3 > 200) {
    U3 =200;
    image(img11, 1, X);
  }  


  getVolume(); // this call fetches the mic volume for the current frame.
  if (U4 > 210) {
    U4 =210;
    image(img10, 1, X);
  }  

  getVolume(); // this call fetches the mic volume for the current frame.
  if (U5 > 220) {
    U5 =220;
    image(img9, 1, X);
  }  

  getVolume(); // this call fetches the mic volume for the current frame.
  if (U6 > 230) {
    U6 =230;
    image(img8, 1, X);
  }  


  getVolume(); // this call fetches the mic volume for the current frame.
  if (U7 > 240) {
    U7 =240;
    image(img7, 1, X);
  }  

  getVolume(); // this call fetches the mic volume for the current frame.
  if (U8 > 250) {
    U8 =250;
    image(img6, 1, X);
  }  

  getVolume(); // this call fetches the mic volume for the current frame.
  if (U9 > 260) {
    U9 =260;
    image(img5, 1, X);
  }  

  getVolume(); // this call fetches the mic volume for the current frame.
  if (C > 270) {
    C =270;
    image(img4, 1, X);
  }  


  getVolume(); // this call fetches the mic volume for the current frame.
  if (C1 > 280) {
    C1 =280;
    image(img4, 1, X);
  }  


  getVolume(); // this call fetches the mic volume for the current frame.
  if (C2 > 290) {
    C2 =290;
    image(img3, 1, X);
  }  


  getVolume(); // this call fetches the mic volume for the current frame.
  if (A > 300) {
    A =300;
    image(img2, 1, X);
  } 

  getVolume(); // this call fetches the mic volume for the current frame.
  if (G > 310) {
    G =310;
    image(img1, 1, X);
  }
}  


