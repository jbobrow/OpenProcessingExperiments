
PFont f;
PFont f2;
PImage bg;
PImage app;
PImage pear;
color AppFat=color(255,100,0,50);
color AppVitC=color(255,100,0,50);
color AppPot=color(255,100,0,50);
color AppSug=color(255,100,0,50);
color peaFat=color(0,250,0,50);
color peaVitC=color(0,250,0,50);
color peaPot=color(0,250,0,50);
color peaSug=color(0,250,0,50);
float xpos;
float xpos2;
float xpos3;
float xpos4;
float ppos;
float ppos2;
float ppos3;
float ppos4;

void setup(){
  size(1000,600);
  f = loadFont("AmericanCaptain-48.vlw");
  f2 = loadFont("MoolBoran-48.vlw");
  bg = loadImage("graph.png");
  app=loadImage("apples2.png");
  pear=loadImage("Pear.png");
  xpos=10;
  xpos2=10;
  xpos3=10;
  xpos4=10;
  ppos=10;
  ppos2=10;
  ppos3=10;
  ppos4=10;
  smooth();
}

void draw() {
 //framework//
  background(255);
 image(bg, 0, 0, width, height);
  textFont(f,22);
 textAlign(CENTER);
 fill(0,0,0);
 String touch = "Touch the Fruit";
 textSize(36);
 textLeading(40);
 text(touch,500,100); 
 textSize(26);
 text("to Find out More!",500,130);
 textFont(f2);
 textSize(20);
 text("(per serving)",500,150);

 ///Display Apple pic
 if((xpos>=15)&&(ppos<=15)){
 image(app, 350,210,300,300);
 textFont(f2,22);
 textAlign(CENTER);
 fill(255,0,0);
 textSize(26);
 text("APPLE NUTRITION",500,510);
 }
 
///Display Pear Pic
  if((ppos>=15)&&(xpos<=15)){
 image(pear, 350,200,300,300);
 textFont(f2,22);
 textAlign(CENTER);
 fill(27,122,3);
 textSize(26);
 text("PEAR NUTRITION",500,520);
 }
 
/////////////Apple Total Fat
 fill(AppFat);
 rect(165,253,100,-xpos);
//Display net fat amount
if (xpos>=190){
  textFont(f2,28);
  textAlign(CENTER);
  fill(20,40,100);
  text("0.3g",215,45);
  AppFat=color(250,0,0,99);
}


////Apple Vitamin C
 fill(AppVitC);
 rect(780,253,100,-xpos2);
/////Display net vitamin text
if (xpos2>=170){
  textFont(f2,28);
  textAlign(CENTER);
  fill(20,40,100);
  text("14%",835,70);
   AppVitC=color(250,0,0,99);
}

//////Apple Potassium
 fill(AppPot);
 rect(165,561,100,-xpos3);
/////Display net Potassium text
if (xpos3>=140){
  textFont(f2,28);
  textAlign(CENTER);
  fill(20,40,100);
  text("195g",215,405);
  AppPot=color(250,0,0,99);
}

/////////Display Sugar bar
 fill(AppSug);
 rect(780,561,100,-xpos4);
/////Display net sugar text
if (xpos4>=150){
  textFont(f2,28);
  textAlign(CENTER);
  fill(20,40,100);
  text("19g",835,400);
   AppSug=color(250,0,0,99);
}



///////////////////////
///END OF APPLE////////////////////////////////
////////////////////

//Pear Total Fat
 fill(peaFat);
 rect(165,253,100,-ppos);
//Display net fat amount
if (ppos>=110){
  textFont(f2,28);
  textAlign(CENTER);
  fill(20,40,100);
  text("0.2g",215,124);
  peaFat=color(0,250,0,99);
}


////pear Vitamin C
 fill(peaVitC);
 rect(780,253,100,-ppos2);
/////Display net vitamin text
if (ppos2>=140){
  textFont(f2,28);
  textAlign(CENTER);
  fill(20,40,100);
  text("12%",835,100);
   peaVitC=color(0,250,0,99);
}

//////pear Potassium
 fill(peaPot);
 rect(165,561,100,-ppos3);
/////Display net Potassium text
if (ppos3>=170){
  textFont(f2,28);
  textAlign(CENTER);
  fill(20,40,100);
  text("206g",215,375);
  peaPot=color(0,250,0,99);
}

/////////Display Pear Sugar bar
 fill(peaSug);
 rect(780,561,100,-ppos4);
/////Display net sugar text
if (ppos4>=135){
  textFont(f2,28);
  textAlign(CENTER);
  fill(20,40,100);
  text("17g",835,405);
   peaSug=color(0,250,0,99);
}





}





void keyPressed(){
  //APPLE IS DOWN & PEAR IS UP!!!
 if(keyCode == DOWN){
   ppos=0;
   ppos2=0;
   ppos3=0;
   ppos4=0;
   
   ////Apple net fat
   xpos=xpos+5;
   AppFat=color(250,0,0,95);
      if(xpos>=200){
          xpos=200;
   }
   ///Apple Vitamin C
   xpos2=xpos2+5;
   AppVitC=color(250,0,0,95);
   if(xpos2>=180){
     xpos2=179;
   }
   
   ///Apple Potassium
   xpos3=xpos3+5;
   AppPot=color(250,0,0,95);
   if(xpos3>=150){
     xpos3=149;
   }
   
   ///Apple Sugar
   xpos4=xpos4+5;
   AppSug=color(250,0,0,95);
   if(xpos4>=155){
     xpos4=154;
   }

 }
 //////////////////////////////////////////
 ///////End of KeyCode == DOWN//apple/////////////////////
 /////////////////////////////////////////////
 
 if(keyCode == UP){
   xpos=0;
   xpos2=0;
   xpos3=0;
   xpos4=0;
   ////pea net fat
   ppos=ppos+5;
   peaFat=color(0,250,0,95);
      if(ppos>=122){
          ppos=122;
   }
   ///pea Vitamin C
   ppos2=ppos2+5;
   peaVitC=color(0,250,0,95);
   if(ppos2>=150){
     ppos2=149;
   }
   
   ///pea Potassium
   ppos3=ppos3+5;
   peaPot=color(0,250,0,95);
   if(ppos3>=180){
     ppos3=179;
   }
   
   ///pea Sugar
   ppos4=ppos4+5;
   peaSug=color(0,250,0,95);
   if(ppos4>=150){
     ppos4=149;
   }
   
   
 
}
///End of KeyCode == UP

}
   
   
   
 


   
    


