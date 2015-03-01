

//PImage bg;


//individual commands for FACE ONE
float face = 50;
float face1 = 20;
float faceX = + 1;
float faceY = -1;

float nose = 50;
float nose1 = 20;
float noseX = +1;
float noseY = -1;

float mouth = 50;
float mouth1 = 05;
float mouthX = +1;
float mouthY= -1;

float pup1 = 30;
float pup1One = 30;
float pup1X = +1;
float pup1Y = -1;

float eye1= 30;
float eye1One = 30;
float eye1X = +1;
float eye1Y = -1;

float eyer = 75;
float eyer1 = 30;
float eyerX = +1;
float eyerY = -1;

float pupr = 75;
float pupr1 = 30;
float puprX = +1;
float puprY = -1;

//individual face TWO commands
//
//
//
//


float faceTwo = 280;
float faceTwo1 = 100;
float faceTwoX = + 1;
float faceTwoY = -1;

float noseTwo = 280;
float noseTwo1 = 100;
float noseTwoX = +1;
float noseTwoY = -1;

float mouthTwo = 280;
float mouthTwo1 = 125;
float mouthTwoX = +1;
float mouthTwoY= -1;

float pup1Two = 260;
float pup1TwoOne = 80;
float pup1TwoX = +1;
float pup1TwoY = -1;

float eye1Two= 260;
float eye1TwoOne = 80;
float eye1TwoX = +1;
float eye1TwoY = -1;

float eyerTwo = 300;
float eyerTwo1 = 80;
float eyerTwoX = +1;
float eyerTwoY = -1;

float puprTwo = 300;
float puprTwo1 = 80;
float puprTwoX = +1;
float puprTwoY = -1;


//individual face THREE Commands//
//
//
//
float face3 = 280;
float face31 = 280;
float face3X = + 1;
float face3Y = -1;

float nose3 = 280;
float nose31 = 280;
float nose3X = +1;
float nose3Y = -1;

float mouth3 = 280;
float mouth31 = 300;
float mouth3X = +1;
float mouth3Y= -1;

float pup13 = 260;
float pup13One = 250;
float pup13X = +1;
float pup13Y = -1;

float eye13= 260;
float eye13One = 250;
float eye13X = +1;
float eye13Y = -1;

float eyer3 = 300;
float eyer31 = 250;
float eyer3X = +1;
float eyer3Y = -1;

float pupr3 = 300;
float pupr31 = 250;
float pupr3X = +1;
float pupr3Y = -1;


//individual commands face FOUR
//
//
//
float face4 = 200;
float face41 = 40;
float face4X = + 1;
float face4Y = -1;

float nose4 = 200;
float nose41 = 40;
float nose4X = +1;
float nose4Y = -1;

float mouth4 = 200;
float mouth41 = 60;
float mouth4X = +1;
float mouth4Y= -1;

float pup14 = 190;
float pup14One = 20;
float pup14X = +1;
float pup14Y = -1;

float eye14= 190;
float eye14One = 20;
float eye14X = +1;
float eye14Y = -1;

float eyer4 = 220;
float eyer41 = 20;
float eyer4X = +1;
float eyer4Y = -1;

float pupr4 = 220;
float pupr41 = 20;
float pupr4X = +1;
float pupr4Y = -1;



void setup () {
 size (400, 400);
 //bg = loadImage("flower.jpg");
  
}
  
  void draw () {
  background (#92EDE8);
// background (bg);
 float slow_circle_size = 20;

 if (random (10) > 5) {
  slow_circle_size = 50;
 }
  
 //face
 fill (#ECDEF5);
ellipse (face,face1,80,90);
face = face + faceX;
face1 = face1 + faceY;


 //nose
fill (#5508FF);
ellipse(nose,nose1,20,20);
nose = nose + noseX;
nose1 = nose1 + noseY;

//mouth
fill (random(200),random(0),random(250));
rectMode(CENTER);
rect(mouth,mouth1,40,random(20));
mouth = mouth + mouthX;
mouth1= mouth1 + mouthY;

//left eye
fill(#C1FF3E);
ellipse(eye1,eye1One,random(50),slow_circle_size);
eye1 = eye1 + eye1X;
eye1One = eye1One + eye1Y;

fill(0);
ellipse (pup1,pup1One,20,20);
pup1 = pup1 + pup1X;
pup1One = pup1One + pup1Y;

//right eye
fill(#C1FF3E);
ellipse(eyer,eyer1,random(50),slow_circle_size);
eyer = eyer + eyerX;
eyer1 = eyer1 + eyerY;

fill(0);
ellipse (pupr,pupr1,20,20);
pupr = pupr + puprX;
pupr1 = pupr1 + puprY;


//eye1 = eye1 + 1;
//if (eye1 >500) {
// eye1 = -200;
//}

//pup1 = pup1+1;
//if (pup1 > 500) {
//  pup1 = -200;
//}

//eyer = eyer + 1;
//if (eyer > 600) {
//  eyer = -100;
//}

//pupr = pupr + 1;
//if (pupr > 600) {
  //pupr = -100;
//}

//face = face +1;
//if (face >550) {
//  face = -150;
//}

//nose = nose + 1;
//if (nose > 550) {
//  nose = -150;
//}

//mouth = mouth + 1;
//if (mouth > 550) {
  //mouth = -150;
//}


//facecommands
if (face > width) {face = width; 
println("too far right");
faceX = -faceX;
}

if (face1 > height) {face1 = height;
println("too far bottom");
faceY=-faceY;
  }
  
if (face < 0) {face = 0;
println("too far left");
faceX = -faceX;
  }

if (face1 < 0) { face1 = 0;
println("too far top");
faceY = -faceY;

  }  
  
//nose commands
//
//

if (nose > width) {nose = width;
println("too far right");
noseX = -noseX;
}

if (nose1 > height) {nose1 = height;
println ("too far bottom");
noseY = -noseY;
}

if (nose < 0) {nose = 0;
println ("too far left");
noseX = -noseX;
}

if (nose1 < 0) {nose1 = 0;
println ("too far top");
noseY = -noseY;
}

//mouth commands
if (mouth > width) {mouth = width;
println("too far right");
mouthX = -mouthX;
}

if (mouth1 > height) {mouth1 = height;
println ("too far bottom");
mouthY = -mouthY;
}

if (mouth < 0) {mouth = 0;
println ("too far left");
mouthX = -mouthX;
}

if (mouth1 < 0) {mouth1 = 0;
println ("too far top");
mouthY = -mouthY;
}

//puple 1 command
//


if (pup1 > width) {pup1 = width;
println("too far right");
pup1X = -pup1X;
}

if (pup1One > height) {pup1One = height;
println ("too far bottom");
pup1Y = -pup1Y;
}

if (pup1 < 0) {pup1 = 0;
println ("too far left");
pup1X = -pup1X;
}

if (pup1One < 0) {pup1One = 0;
println ("too far top");
pup1Y = -pup1Y;
}

//left eye eye1 commands
//
if (eye1 > width) {eye1 = width;
println("too far right");
eye1X = -eye1X;
}

if (eye1One > height) {eye1One = height;
println ("too far bottom");
eye1Y = -eye1Y;
}

if (eye1 < 0) {eye1 = 0;
println ("too far left");
eye1X = -eye1X;
}

if (eye1One < 0) {eye1One = 0;
println ("too far top");
eye1Y = -eye1Y;
}

//right eye commands 
if (eyer > width) {eyer = width;
println("too far right");
eyerX = -eyerX;
}

if (eyer1 > height) {eyer1 = height;
println ("too far bottom");
eyerY = -eyerY;
}

if (eyer < 0) {eyer = 0;
println ("too far left");
eyerX = -eyerX;
}

if (eyer1 < 0) {eyer1 = 0;
println ("too far top");
eyerY = -eyerY;
}

//right puple commands
if (pupr > width) {pupr = width;
println("too far right");
puprX = -puprX;
}

if (pupr1 > height) {pupr1 = height;
println ("too far bottom");
puprY = -puprY;
}

if (pupr < 0) {pupr = 0;
println ("too far left");
puprX = -puprX;
}

if (pupr1 < 0) {pupr1 = 0;
println ("too far top");
puprY = -puprY;

}



//face TWO Commands


  
//void draw () {
 // background (bg);
  //float slow_circle_size = 20;

 // if (random (10) > 5) {
 //   slow_circle_size = 50;
 // }
  
 //face
 fill (#ECDEF5);
ellipse (faceTwo,faceTwo1,80,90);
faceTwo = faceTwo + faceTwoX;
faceTwo1 = faceTwo1 + faceTwoY;


 //nose
fill (#5508FF);
ellipse(noseTwo,noseTwo1,20,20);
noseTwo = noseTwo + noseTwoX;
noseTwo1 = noseTwo1 + noseTwoY;

//mouth
fill (random(200),random(0),random(250));
rectMode(CENTER);
rect(mouthTwo,mouthTwo1,40,random(20));
mouthTwo = mouthTwo + mouthTwoX;
mouthTwo1= mouthTwo1 + mouthTwoY;

//left eye
fill(#C1FF3E);
ellipse(eye1Two,eye1TwoOne,random(50),slow_circle_size);
eye1Two = eye1Two + eye1TwoX;
eye1TwoOne = eye1TwoOne + eye1TwoY;

fill(0);
ellipse (pup1Two,pup1TwoOne,20,20);
pup1Two = pup1Two + pup1TwoX;
pup1TwoOne = pup1TwoOne + pup1TwoY;

//right eye
fill(#C1FF3E);
ellipse(eyerTwo,eyerTwo1,random(50),slow_circle_size);
eyerTwo = eyerTwo + eyerTwoX;
eyerTwo1 = eyerTwo1 + eyerTwoY;

fill(0);
ellipse (puprTwo,puprTwo1,20,20);
puprTwo = puprTwo + puprTwoX;
puprTwo1 = puprTwo1 + puprTwoY;


//eye1 = eye1 + 1;
//if (eye1 >500) {
// eye1 = -200;
//}

//pup1 = pup1+1;
//if (pup1 > 500) {
//  pup1 = -200;
//}

//eyer = eyer + 1;
//if (eyer > 600) {
//  eyer = -100;
//}

//pupr = pupr + 1;
//if (pupr > 600) {
  //pupr = -100;
//}

//face = face +1;
//if (face >550) {
//  face = -150;
//}

//nose = nose + 1;
//if (nose > 550) {
//  nose = -150;
//}

//mouth = mouth + 1;
//if (mouth > 550) {
  //mouth = -150;
//}

//facecommands
if (faceTwo > width) {faceTwo = width; 
println("too far right");
faceTwoX = -faceTwoX;
}

if (faceTwo1 > height) {faceTwo1 = height;
println("too far bottom");
faceTwoY=-faceTwoY;
  }
  
if (faceTwo < 0) {faceTwo = 0;
println("too far left");
faceTwoX = -faceTwoX;
  }

if (faceTwo1 < 0) { faceTwo1 = 0;
println("too far top");
faceTwoY = -faceTwoY;

  }  
  
//nose commands
//
//

if (noseTwo > width) {noseTwo = width;
println("too far right");
noseTwoX = -noseTwoX;
}

if (noseTwo1 > height) {noseTwo1 = height;
println ("too far bottom");
noseTwoY = -noseTwoY;
}

if (noseTwo < 0) {noseTwo = 0;
println ("too far left");
noseTwoX = -noseTwoX;
}

if (noseTwo1 < 0) {noseTwo1 = 0;
println ("too far top");
noseTwoY = -noseTwoY;
}

//mouth commands
if (mouthTwo > width) {mouthTwo = width;
println("too far right");
mouthTwoX = -mouthTwoX;
}

if (mouthTwo1 > height) {mouthTwo1 = height;
println ("too far bottom");
mouthTwoY = -mouthTwoY;
}

if (mouthTwo < 0) {mouthTwo = 0;
println ("too far left");
mouthTwoX = -mouthTwoX;
}

if (mouthTwo1 < 0) {mouthTwo1 = 0;
println ("too far top");
mouthTwoY = -mouthTwoY;
}

//puple 1 command
//


if (pup1Two > width) {pup1Two = width;
println("too far right");
pup1TwoX = -pup1TwoX;
}

if (pup1TwoOne > height) {pup1TwoOne = height;
println ("too far bottom");
pup1TwoY = -pup1TwoY;
}

if (pup1Two < 0) {pup1Two = 0;
println ("too far left");
pup1TwoX = -pup1TwoX;
}

if (pup1TwoOne < 0) {pup1TwoOne = 0;
println ("too far top");
pup1TwoY = -pup1TwoY;
}

//left eye eye1 commands
//
if (eye1Two > width) {eye1Two = width;
println("too far right");
eye1TwoX = -eye1TwoX;
}

if (eye1TwoOne > height) {eye1TwoOne = height;
println ("too far bottom");
eye1TwoY = -eye1TwoY;
}

if (eye1Two < 0) {eye1Two = 0;
println ("too far left");
eye1TwoX = -eye1TwoX;
}

if (eye1TwoOne < 0) {eye1TwoOne = 0;
println ("too far top");
eye1TwoY = -eye1TwoY;
}

//right eye commands 
if (eyerTwo > width) {eyerTwo = width;
println("too far right");
eyerTwoX = -eyerTwoX;
}

if (eyerTwo1 > height) {eyerTwo1 = height;
println ("too far bottom");
eyerTwoY = -eyerTwoY;
}

if (eyerTwo < 0) {eyerTwo = 0;
println ("too far left");
eyerTwoX = -eyerTwoX;
}

if (eyerTwo1 < 0) {eyerTwo1 = 0;
println ("too far top");
eyerTwoY = -eyerTwoY;
}

//right puple commands
if (puprTwo > width) {puprTwo = width;
println("too far right");
puprTwoX = -puprTwoX;
}

if (puprTwo1 > height) {puprTwo1 = height;
println ("too far bottom");
puprTwoY = -puprTwoY;
}

if (puprTwo < 0) {puprTwo = 0;
println ("too far left");
puprTwoX = -puprTwoX;
}

if (puprTwo1 < 0) {puprTwo1 = 0;
println ("too far top");
puprTwoY = -puprTwoY;

}


//face THREE commands
//
//
//

 fill (#ECDEF5);
ellipse (face3,face31,80,90);
face3 = face3 + face3X;
face31 = face31 + face3Y;


 //nose
fill (#5508FF);
ellipse(nose3,nose31,20,20);
nose3 = nose3 + nose3X;
nose31 = nose31 + nose3Y;

//mouth
fill (random(200),random(0),random(250));
rectMode(CENTER);
rect(mouth3,mouth31,40,random(20));
mouth3 = mouth3 + mouth3X;
mouth31= mouth31 + mouth3Y;

//left eye
fill(#C1FF3E);
ellipse(eye13,eye13One,random(50),slow_circle_size);
eye13 = eye13 + eye13X;
eye13One = eye13One + eye13Y;

fill(0);
ellipse (pup13,pup13One,20,20);
pup13 = pup13 + pup13X;
pup13One = pup13One + pup13Y;

//right eye
fill(#C1FF3E);
ellipse(eyer3,eyer31,random(50),slow_circle_size);
eyer3 = eyer3 + eyer3X;
eyer31 = eyer31 + eyer3Y;

fill(0);
ellipse (pupr3,pupr31,20,20);
pupr3 = pupr3 + pupr3X;
pupr31 = pupr31 + pupr3Y;



//facecommands
if (face3 > width) {face3 = width; 
println("too far right");
face3X = -face3X;
}

if (face31 > height) {face31 = height;
println("too far bottom");
face3Y=-face3Y;
  }
  
if (face3 < 0) {face3 = 0;
println("too far left");
face3X = -face3X;
  }

if (face31 < 0) { face31 = 0;
println("too far top");
face3Y = -face3Y;

  }  
  
//nose commands
//
//

if (nose3 > width) {nose3 = width;
println("too far right");
nose3X = -nose3X;
}

if (nose31 > height) {nose31 = height;
println ("too far bottom");
nose3Y = -nose3Y;
}

if (nose3 < 0) {nose3 = 0;
println ("too far left");
nose3X = -nose3X;
}

if (nose31 < 0) {nose31 = 0;
println ("too far top");
nose3Y = -nose3Y;
}

//mouth commands
if (mouth3 > width) {mouth3 = width;
println("too far right");
mouth3X = -mouth3X;
}

if (mouth31 > height) {mouth31 = height;
println ("too far bottom");
mouth3Y = -mouth3Y;
}

if (mouth3 < 0) {mouth3 = 0;
println ("too far left");
mouth3X = -mouth3X;
}

if (mouth31 < 0) {mouth31 = 0;
println ("too far top");
mouth3Y = -mouth3Y;
}

//puple 1 command
//


if (pup13 > width) {pup13 = width;
println("too far right");
pup13X = -pup13X;
}

if (pup13One > height) {pup13One = height;
println ("too far bottom");
pup13Y = -pup13Y;
}

if (pup13 < 0) {pup13 = 0;
println ("too far left");
pup13X = -pup13X;
}

if (pup13One < 0) {pup13One = 0;
println ("too far top");
pup13Y = -pup13Y;
}

//left eye eye1 commands
//
if (eye13 > width) {eye13 = width;
println("too far right");
eye13X = -eye13X;
}

if (eye13One > height) {eye13One = height;
println ("too far bottom");
eye13Y = -eye13Y;
}

if (eye13 < 0) {eye13 = 0;
println ("too far left");
eye13X = -eye13X;
}

if (eye13One < 0) {eye13One = 0;
println ("too far top");
eye13Y = -eye13Y;
}

//right eye commands 
if (eyer3 > width) {eyer3 = width;
println("too far right");
eyer3X = -eyer3X;
}

if (eyer31 > height) {eyer31 = height;
println ("too far bottom");
eyer3Y = -eyer3Y;
}

if (eyer3 < 0) {eyer3 = 0;
println ("too far left");
eyer3X = -eyer3X;
}

if (eyer31 < 0) {eyer31 = 0;
println ("too far top");
eyer3Y = -eyer3Y;
}

//right puple commands
if (pupr3 > width) {pupr3 = width;
println("too far right");
pupr3X = -pupr3X;
}

if (pupr31 > height) {pupr31 = height;
println ("too far bottom");
pupr3Y = -pupr3Y;
}

if (pupr3 < 0) {pupr3 = 0;
println ("too far left");
pupr3X = -pupr3X;
}

if (pupr31 < 0) {pupr31 = 0;
println ("too far top");
pupr3Y = -pupr3Y;

}


//face four commands

 fill (#ECDEF5);
ellipse (face4,face41,80,90);
face4 = face4 + face4X;
face41 = face41 + face4Y;


 //nose
fill (#5508FF);
ellipse(nose4,nose41,20,20);
nose4 = nose4 + nose4X;
nose41 = nose41 + nose4Y;

//mouth
fill (random(200),random(0),random(250));
rectMode(CENTER);
rect(mouth4,mouth41,40,random(20));
mouth4 = mouth4 + mouth4X;
mouth41= mouth41 + mouth4Y;

//left eye
fill(#C1FF3E);
ellipse(eye14,eye14One,random(50),slow_circle_size);
eye14 = eye14 + eye14X;
eye14One = eye14One + eye14Y;

fill(0);
ellipse (pup14,pup14One,20,20);
pup14 = pup14 + pup14X;
pup14One = pup14One + pup14Y;

//right eye
fill(#C1FF3E);
ellipse(eyer4,eyer41,random(50),slow_circle_size);
eyer4 = eyer4 + eyer4X;
eyer41 = eyer41 + eyer4Y;

fill(0);
ellipse (pupr4,pupr41,20,20);
pupr4 = pupr4 + pupr4X;
pupr41 = pupr41 + pupr4Y;



//facecommands
if (face4 > width) {face4 = width; 
println("too far right");
face4X = -face4X;
}

if (face41 > height) {face41 = height;
println("too far bottom");
face4Y=-face4Y;
  }
  
if (face4 < 0) {face4 = 0;
println("too far left");
face4X = -face4X;
  }

if (face41 < 0) { face41 = 0;
println("too far top");
face4Y = -face4Y;

  }  
  
//nose commands
//
//

if (nose4 > width) {nose4 = width;
println("too far right");
nose4X = -nose4X;
}

if (nose41 > height) {nose41 = height;
println ("too far bottom");
nose4Y = -nose4Y;
}

if (nose4 < 0) {nose4 = 0;
println ("too far left");
nose4X = -nose4X;
}

if (nose41 < 0) {nose41 = 0;
println ("too far top");
nose4Y = -nose4Y;
}

//mouth commands
if (mouth4 > width) {mouth4 = width;
println("too far right");
mouth4X = -mouth4X;
}

if (mouth41 > height) {mouth41 = height;
println ("too far bottom");
mouth4Y = -mouth4Y;
}

if (mouth4 < 0) {mouth4 = 0;
println ("too far left");
mouth4X = -mouth4X;
}

if (mouth41 < 0) {mouth41 = 0;
println ("too far top");
mouth4Y = -mouth4Y;
}

//puple 1 command
//


if (pup14 > width) {pup14 = width;
println("too far right");
pup14X = -pup14X;
}

if (pup14One > height) {pup14One = height;
println ("too far bottom");
pup14Y = -pup14Y;
}

if (pup14 < 0) {pup14 = 0;
println ("too far left");
pup14X = -pup14X;
}

if (pup14One < 0) {pup14One = 0;
println ("too far top");
pup14Y = -pup14Y;
}

//left eye eye1 commands
//
if (eye14 > width) {eye14 = width;
println("too far right");
eye14X = -eye14X;
}

if (eye14One > height) {eye14One = height;
println ("too far bottom");
eye14Y = -eye14Y;
}

if (eye14 < 0) {eye14 = 0;
println ("too far left");
eye14X = -eye14X;
}

if (eye14One < 0) {eye14One = 0;
println ("too far top");
eye14Y = -eye14Y;
}

//right eye commands 
if (eyer4 > width) {eyer4 = width;
println("too far right");
eyer4X = -eyer4X;
}

if (eyer41 > height) {eyer41 = height;
println ("too far bottom");
eyer4Y = -eyer4Y;
}

if (eyer4 < 0) {eyer4 = 0;
println ("too far left");
eyer4X = -eyer4X;
}

if (eyer41 < 0) {eyer41 = 0;
println ("too far top");
eyer4Y = -eyer4Y;
}

//right puple commands
if (pupr4 > width) {pupr4 = width;
println("too far right");
pupr4X = -pupr4X;
}

if (pupr41 > height) {pupr41 = height;
println ("too far bottom");
pupr4Y = -pupr4Y;
}

if (pupr4 < 0) {pupr4 = 0;
println ("too far left");
pupr4X = -pupr4X;
}

if (pupr41 < 0) {pupr41 = 0;
println ("too far top");
pupr4Y = -pupr4Y;

}
}
