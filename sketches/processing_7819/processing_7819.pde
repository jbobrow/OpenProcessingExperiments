
int page = 1;

PFont font;

PImage Q1;
PImage Q2;
PImage Q3;
PImage Q4;
//
PImage Q5;
PImage Q6;
//
PImage Q7;
PImage Q8;
PImage Q9;
PImage Q10;
PImage Q11;
PImage Q12;
//
PImage heart;
PImage diamond;
PImage spade;
PImage club;
PImage heartr;
PImage diamondr;
PImage spader;
PImage clubr;


PImage W1;
PImage W2;

PImage A;
PImage A1;
PImage A2;
PImage A3;

PImage W3;

PImage B;
PImage B1;
PImage B2;
PImage B3;

PImage W4;

PImage C;
PImage C1;
PImage C2;
PImage C3;

PImage W5;

PImage D;
PImage D1;
PImage D2;
PImage D3;

PImage W6;
PImage W7;
PImage X;


int b1x = 180;   // Button 1 x-coordinate
int b1y = 440;  // Button 1 y-coordinate
int b1w = 100;  // Button 1 width
int b1h = 25;   // Button 1 height

int b2x = 380;  // Button 2
int b2y = 440;
int b2w = 100;
int b2h = 25;


void setup(){
  size(640,480);
  smooth();
  
    Q1 = loadImage ("Q1.png");
    Q2 = loadImage ("Q2.png");
    Q3 = loadImage ("Q3.png");    
    Q4 = loadImage ("Q4.png");  
//  
    Q5 = loadImage ("Q5.png");  
    Q6 = loadImage ("Q6.png");  
// 

    Q7 = loadImage ("Q7.png");  
    Q8 = loadImage ("Q8.png"); 
    Q9 = loadImage ("Q9.png");  
    Q10 = loadImage ("Q10.png");    
    Q11 = loadImage ("Q11.png");         
    Q12 = loadImage ("Q12.png");     
    //    
    heart = loadImage ("heart.png");
    diamond = loadImage ("diamond.png");  
    spade = loadImage ("spade.png");
    club = loadImage ("club.png");
    
    heartr = loadImage ("heartr.png");
    diamondr = loadImage ("diamondr.png");  
    spader = loadImage ("spader.png");
    clubr = loadImage ("clubr.png");

//    
    W1 = loadImage ("1.png");
    W2 = loadImage ("2.png");
    A = loadImage ("A.png");
    W3 = loadImage ("3.png");
    B = loadImage ("B.png");
    W4 = loadImage ("4.png");
    C = loadImage ("C.jpg");
    W5 = loadImage ("5.png");
    D = loadImage ("D.png");
    W6 = loadImage ("6.png");
    W7 = loadImage ("7.png");
    X = loadImage ("X.png");
//
    
    A1 = loadImage ("A1.png");
    A2 = loadImage ("A2.png");
    A3 = loadImage ("A3.png");

    B1 = loadImage ("B1.png");
    B2 = loadImage ("B2.png");
    B3 = loadImage ("B3.png");
   
    C1 = loadImage ("C1.png");    
    C2 = loadImage ("C2.png");    
    C3 = loadImage ("C3.png");
    
    D1 = loadImage ("D1.png");
    D2 = loadImage ("D2.png");
    D3 = loadImage ("D3.png");
    
  font = loadFont("GoudyBookletter1911-14.vlw");
  textFont(font);
  
}


void draw() {
  if (page == 1) {
    W1();
  } else if (page == 2) {
    W2(); 
  } else if (page == 3) {
    A(); 
  } else if (page == 4) {
    W3(); 
  } else if (page == 5) {
    B();
  }else if (page == 6) {
    W4();
  }else if (page == 7) {
    C();
  }else if (page == 8) {
    W5();
  }else if (page == 9) {
    D();
  }else if (page == 10) {
    W6();
  }else if (page == 11) {
    W7();
  }else if (page == 12) {
    X();
  }else if (page == 11) {
    W7();
    
    //A
}else if (page == 13) {
    A1();
}else if (page == 14) {
    A2();
}else if (page == 15) {
    A3();
    
    //B
}else if (page == 16) {
    B1();
}else if (page == 17) {
    B2();
}else if (page == 18) {
    B3();
    
    //C
}else if (page == 19) {
    C1();
}else if (page == 20) {
    C2();    
}else if (page == 21) {
    C3();    

   //D
}else if (page == 22) {
    D1();
}else if (page == 23) {
    D2();    
}else if (page == 24) {
    D3();    
}

}

void mousePressed() {
  if (page == 1) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 2; 
    }}
 //
 else if (page == 2) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 3; 
    }} 
  
  // FOOTMAN
  else if (page == 3) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 13; 
    }  else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 4;
    } }
  //
else if (page == 13) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 4; 
    }  else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 14;
    }}   

else if (page == 14) {
if (overButton(b1x, b1y, b1w, b1h) == true) {
  page = 15; 
}  else if (overButton(b2x, b2y, b2w, b2h) == true) {
 page = 12;
}}   
    
else if (page == 15) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 14; 
    }  else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 12;
    }}
    
  
  //
  else if (page == 4) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 5; 
    }}
  
  // SPLIT IN PATH AT CHESHIRE
  else if (page == 5) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 17; 
    }
  else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 18;
    }}
    
     else if (page == 17) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 12; 
    }
  else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 7;
    }}
    
  else if (page == 18) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 7; 
    }
  else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 12;
    }}  
    
  // CATEPILLAR PATH
  else if (page == 6) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 7; 
    }} 
    
else if (page == 7) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 21; 
    }
  else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 19;
    }}  
    //
  else if (page == 19) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 11; 
    }else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 20;
    }}
 
 else if (page == 20) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 21; 
    }else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 12;
    }}    

 else if (page == 21) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 19; 
    }else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 11;
    }}     
    
    // MAD HATTER PATH
  else if (page == 8) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 9; 
    } }
    //
  else if (page == 9) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 10; 
    }else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 22;
    }} 
    
      else if (page == 22) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 10; 
    }else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 23;
    }} 
    
       else if (page == 23) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 24; 
    }else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 12;
    }} 
    
      else if (page == 24) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 23; 
    }else if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 12;
    }} 
    //
  else if (page == 10) {
    if (overButton(b1x, b1y, b1w, b1h) == true) {
      page = 11; 
    }} 
  
  
   // WIN
  else if (page == 11) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 1; 
    }} 
  
  //LOSE
  else if (page == 12) {
    if (overButton(b2x, b2y, b2w, b2h) == true) {
      page = 1; 
    }} 
}



boolean overButton(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
    return true; 
  } 
  else {
    return false; 
  }
}
//1 INTRO

void W1(){
  background(W1);
  fill(0);
  text("CONTINUE", b1x,455);
  if (overButton(b1x,b1y,b1w,b1h) == true){}
  noFill();
  noStroke();
  rect(b1x,b1y,b1w,b1h);
 
}

//2 DOWN the RABBITHOLE
void W2(){
  background(W2);
 fill(0);
  text("CONTINUE", b1x,455);
  if (overButton(b1x,b1y,b1w,b1h) == true){}
  noFill();
  noStroke();
  rect(b1x,b1y,b1w,b1h);
}

//3 FOOTMAN
void A(){
  background(A);
 if (overButton(b1x,b1y,b1w,b1h) == true){
    image(spader,b1x,440);
    image(Q1,110,110);
  }
    else{
      image(spade,b1x,440);
  }

rect(b1x,b1y,b1w,b1h);
text("Ask a question.",b1x+35,456);
  

if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(spader,b2x,-465);
  popMatrix();
         image(Q2,110,110); 
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(spade,b2x,-465);
  popMatrix();
  }

text("Knock on the door.",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();

}



//4
void W3(){
  background(W3);
  if (overButton(b2x,b2y,b2w,b2h) == true){}
  rect(b1x,b1y,b1w,b1h);
  text("CONTINUE", b2x,455);
  noFill();
  noStroke();
}


//
//5 CHESHIRE
//
void B(){
  background(B);
     if (overButton(b1x,b1y,b1w,b1h) == true){
    image(heartr,b1x,440);
     image(Q5,50,130);
  }
    else{
      image(heart,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("Explain.",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(heartr,b2x,-465);
  popMatrix();
      image(Q6,80,170);
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(heart,b2x,-465);
  popMatrix();
  }

text("Get directions.",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();

}

//
//6
//
void W4(){
  background(W4);
  if (overButton(b1x,b1y,b1w,b1h) == true){}
  rect(b1x,b1y,b1w,b1h);
  text("CONTINUE", b1x,455);  
  noFill();
  noStroke();
}

//7 CATEPILLAR
void C(){
  background(C);
  if (overButton(b1x,b1y,b1w,b1h) == true){
    image(clubr,b1x,440);
    image(Q8,345,110); 
  }
    else{
      image(club,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("Ignore and walk past.",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(clubr,b2x,-465);
  popMatrix();
  image(Q7,335,115);  
  }

  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(club,b2x,-465);
  popMatrix();
  }

text("Talk to the caterpillar",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();
}

//8
void W5(){
  background(W5);
  if (overButton(b1x,b1y,b1w,b1h) == true){}
  rect(b1x,b1y,b1w,b1h);
  text("CONTINUE", b1x,455);
  noFill();
  noStroke();
}

//9 MAD HATTER
void D(){
  background(D);
 if (overButton(b1x,b1y,b1w,b1h) == true){
    image(diamondr,b1x,440);
  }
    else{
      image(diamond,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("ask a question",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(diamondr,b2x,-465);
  popMatrix();
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(diamond,b2x,-465);
  popMatrix();
  }

text("ask a question",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();
}

//10
void W6(){
  background(W6);
  if (overButton(b1x,b1y,b1w,b1h) == true){}
  rect(b1x,b1y,b1w,b1h);
  text("CONTINUE", b1x,455);
  noFill();
  noStroke();
}

//11 ROSE - FINISH
void W7(){
  background(W7);
  if (overButton(b2x,b2y,b2w,b2h) == true){}
  text("START AGAIN.",b2x,455);
}


//12 GAME OVER
void X(){
  background(X);
 if (overButton(b2x,b2y,b2w,b2h) == true){}
  text("START AGAIN.",b2x,455);
}



//////////A

void A1(){
  background(A1);
 if (overButton(b1x,b1y,b1w,b1h) == true){
    image(spader,b1x,440);
      image(Q3,110,110);  
  }
    else{
      image(spade,b1x,440);
  }

rect(b1x,b1y,b1w,b1h);
text("Argue.",b1x+35,456);


if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(spader,b2x,-465);

  popMatrix();

      image(Q2,110,110);
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(spade,b2x,-465);
  popMatrix();
  }

text("Knock on the door.",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();

}
/////////////////////
void A2(){
  background(A2);
 if (overButton(b1x,b1y,b1w,b1h) == true){
    image(spader,b1x,440);
    image(Q1,110,110);
  }
    else{
      image(spade,b1x,440);
  }

rect(b1x,b1y,b1w,b1h);
text("Ask again.",b1x+35,456);
  

if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(spader,b2x,-465);
  popMatrix();
       image(Q4,110,110); 
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(spade,b2x,-465);
  popMatrix();
  }

text("Complain.",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();

}
//////////////////////
void A3(){
  background(A3);
 if (overButton(b1x,b1y,b1w,b1h) == true){
    image(spader,b1x,440);
    image(Q1,110,110);
  }
    else{
      image(spade,b1x,440);
  }

rect(b1x,b1y,b1w,b1h);
text("Ask very clearly.",b1x+35,456);
  

if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(spader,b2x,-465);
  popMatrix();
  
      image(Q4,110,110);  
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(spade,b2x,-465);
  popMatrix();
  }

text("Argue.",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();

}

////////////////////////B

//
void B1(){
  background(B1);

}
/////////////////
//
void B2(){
  background(B2);
     if (overButton(b1x,b1y,b1w,b1h) == true){
    image(heartr,b1x,440);
  }
    else{
      image(heart,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("Wander to the left.",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(heartr,b2x,-465);
  popMatrix();
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(heart,b2x,-465);
  popMatrix();
  }

text("Wander to the right.",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();

}

////////////////
//
void B3(){
  background(B3);
     if (overButton(b1x,b1y,b1w,b1h) == true){
    image(heartr,b1x,440);
  }
    else{
      image(heart,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("Go THAT way...",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(heartr,b2x,-465);
  popMatrix();
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(heart,b2x,-465);
  popMatrix();
  }

text("Go right.",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();

}

////////////////////////C

//7 CATEPILLAR
void C1(){
  background(C1);
  if (overButton(b1x,b1y,b1w,b1h) == true){
    image(clubr,b1x,440);
        image(Q9,345,110); 
  }
    else{
      image(club,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("Walk away.",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(clubr,b2x,-465);
  popMatrix();
        image(Q10,345,110); 
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(club,b2x,-465);
  popMatrix();

  }

text("Jog his memory.",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();
}


/////////////////C

//7 CATEPILLAR
void C2(){
  background(C2);
  if (overButton(b1x,b1y,b1w,b1h) == true){
    image(clubr,b1x,440);
            image(Q11,345,110); 
  }
    else{
      image(club,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("Explain yourself.",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(clubr,b2x,-465);
  popMatrix();
          image(Q12,370,125); 
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(club,b2x,-465);
  popMatrix();
  }

text("Debate.",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();
}


//////////////////c

//7 CATEPILLAR
void C3(){
  background(C3);
  if (overButton(b1x,b1y,b1w,b1h) == true){
    image(clubr,b1x,440);
  }
    else{
      image(club,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("Listen",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(clubr,b2x,-465);
  popMatrix();
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(club,b2x,-465);
  popMatrix();
  }

text("Walk away anyways.",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();
}


///////////////////D

//9 MAD HATTER
void D1(){
  background(D1);
 if (overButton(b1x,b1y,b1w,b1h) == true){
    image(diamondr,b1x,440);
  }
    else{
      image(diamond,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("ask a question",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(diamondr,b2x,-465);
  popMatrix();
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(diamond,b2x,-465);
  popMatrix();
  }

text("ask a question",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();
}


//9 MAD HATTER
void D2(){
  background(D2);
 if (overButton(b1x,b1y,b1w,b1h) == true){
    image(diamondr,b1x,440);
  }
    else{
      image(diamond,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("ask a question",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(diamondr,b2x,-465);
  popMatrix();
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(diamond,b2x,-465);
  popMatrix();
  }

text("ask a question",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();
}


//9 MAD HATTER
void D3(){
  background(D3);
 if (overButton(b1x,b1y,b1w,b1h) == true){
    image(diamondr,b1x,440);
  }
    else{
      image(diamond,b1x,440);
  }
  rect(b1x,b1y,b1w,b1h);
  text("ask a question",b1x+35,456);
  noFill();
  noStroke();
  
  
    if (overButton(b2x,b2y,b2w,b2h) == true){
     pushMatrix();
  scale(1.0,-1.0);
  image(diamondr,b2x,-465);
  popMatrix();
    
  }
  else {
  pushMatrix();
  scale(1.0,-1.0);
  image(diamond,b2x,-465);
  popMatrix();
  }

text("ask a question",b2x+35,456);
rect(b2x, b2y, b2w, b2h);
noStroke();
noFill();
}

////////////

//ONE

/*void one(){
  background(one);
  //
  if (overButton(b1x,b1y,b1w,b1h) == true){
   image(Q1,110,110);
   image(s1,149,440);
  }
  
  rect(b1x,b1y,b1w,b1h);
  noFill();
  noStroke();
  
   if (overButton(b2x,b2y,b2w,b2h) == true){
    image(s2,368,440);
    
  }
  else{
    noFill();
  }
  rect(b2x, b2y, b2w, b2h);
}
*/


