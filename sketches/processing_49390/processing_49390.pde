

String[] kafli;

void setup(){
  
kafli = loadStrings("LaurBrass.txt");
   
font1 = createFont("Century", 14);
font2 = loadFont("CourierNew36.vlw");


 size(1024, 768);
 frameRate(25);
    k1.reset(timi, index);
    k2.reset(timi2, index+1);
    k3.reset(timi3, index+2);
    k4.reset(timi4, index+3);
    k5.reset(timi5, index+4);
    k6.reset(timi6, index+5);
    k7.reset(timi7, index+6);
    k8.reset(timi8, index+7);
    
    
    ka1.reset(timi, index);
    ka2.reset(timi2, index+1);
    ka3.reset(timi3, index+2);
    ka4.reset(timi4, index+3);
    ka5.reset(timi5, index+4);
    ka6.reset(timi6, index+5);
    ka7.reset(timi7, index+6);
    ka8.reset(timi8, index+7);    
    
    kb1.reset(timi, index);
    kb2.reset(timi2, index+1);
    kb3.reset(timi3, index+2);
    kb4.reset(timi4, index+3);
    kb5.reset(timi5, index+4);
    kb6.reset(timi6, index+5);
    kb7.reset(timi7, index+6);
    kb8.reset(timi8, index+7);    
    
    
    kc1.reset(timi, index);
    kc2.reset(timi2, index+1);
    kc3.reset(timi3, index+2);
    kc4.reset(timi4, index+3);
    kc5.reset(timi5, index+4);
    kc6.reset(timi6, index+5);
    kc7.reset(timi7, index+6);
    kc8.reset(timi8, index+7);

    
    kd1.reset(timi, index);
    kd2.reset(timi2, index+1);
    kd3.reset(timi3, index+2);
    kd4.reset(timi4, index+3);
    kd5.reset(timi5, index+4);
    kd6.reset(timi6, index+5);
    kd7.reset(timi7, index+6);
    kd8.reset(timi8, index+7);    
    
    
 smooth();
}

void draw(){
 background(0);


 String tala0 = kafli[index]; 
 String tala1 = kafli[index+1];
 String tala2 = kafli[index+2];
 String tala3 = kafli[index+3];
 String tala4 = kafli[index+4];
 String tala5 = kafli[index+5];
 String tala6 = kafli[index+6];
 String tala7 = kafli[index+7];
 String tala8 = kafli[index+8];
// String tala9 = kafli[index+9];
// String tala10 = kafli[index+10];
// String tala11 = kafli[index+11];
// String tala12 = kafli[index+12];
 
 
 

 String[] gildi0 = split(tala0, ","); 
 String[] gildi1 = split(tala1, ",");
 String[] gildi2 = split(tala2, ",");
 String[] gildi3 = split(tala3, ",");
 String[] gildi4 = split(tala4, ",");
 String[] gildi5 = split(tala5, ",");
 String[] gildi6 = split(tala6, ",");
 String[] gildi7 = split(tala7, ",");
 String[] gildi8 = split(tala8, ",");
// String[] gildi9 = split(tala9, ",");
// String[] gildi10 = split(tala10, ",");
// String[] gildi11 = split(tala11, ",");
// String[] gildi12 = split(tala12, ",");
 
 

int ill0 = Integer.parseInt(gildi0[0]);
int ill1 = Integer.parseInt(gildi1[0]);
int ill2 = Integer.parseInt(gildi2[0]);
int ill3 = Integer.parseInt(gildi3[0]);
int ill4 = Integer.parseInt(gildi4[0]);
int ill5 = Integer.parseInt(gildi5[0]);
int ill6 = Integer.parseInt(gildi6[0]);
int ill7 = Integer.parseInt(gildi7[0]);
int ill8 = Integer.parseInt(gildi8[0]);
//int ill9 = Integer.parseInt(gildi9[0]);
//int ill10 = Integer.parseInt(gildi10[0]);
//int ill11 = Integer.parseInt(gildi11[0]);
//int ill12 = Integer.parseInt(gildi12[0]);





 fill(255);
textFont(font1);
text("Horn", dia, 82, 140);
text("Trumpet", dia, 265, 140);
text("Trombone", dia, 458, 140);
//text("Alt 2", dia, 522, 140);
//text("Bassi 1", dia, 665, 140);


f1.draw(1, 10, 1, 5);
f2.draw(1, 240, 1, 5);
f3.draw(2, 480, 1, 5);
//f4.draw(1, 560, 1, 5);
//f5.draw(1, 740, 1, 5);




 strokeWeight (5);
 stroke(40,116,217);
 line(width/4, 0, width/4, height);

 if(active){                                  //CHECK IF THE PROGRAM IS ON
  currenttime = millis() - starttime;        //CHECK HOW fineCH TIMEHASELAPSED SINCE TRIGGER

  if(  (ill0*speed) <= (currenttime - leadin)){   //CHECK IFTHE NEXT EVENT IN THE QUE SHOULD BE TRIGGERED, LEADIN SPECIFIESDELAYAT BEGINNING

    

    timi = (ill1 - ill0)*speed;
    timi2 = (ill2 - ill1)*speed;
    timi3 = (ill3 - ill2)*speed;
    timi4 = (ill4 - ill3)*speed;
    timi5 = (ill5 - ill4)*speed;
    timi6 = (ill6 - ill5)*speed;
    timi7 = (ill7 - ill6)*speed;
    timi8 = (ill8 - ill7)*speed;
  
  /*
    timi9 = (ill9 - ill8)*speed;
    timi10 = (ill10 - ill9)*speed;
    timi11 = (ill11 - ill10)*speed;
    timi12 = (ill12 - ill11)*speed;
  */
  
  
  
    index++;                                  //MOVE TO NEXT EVENT IN THE QUE



    gerdur1 = Integer.parseInt(gildi0[1]);
    notur1  = Integer.parseInt(gildi0[2]);  
    almennur1 = Integer.parseInt(gildi0[3]);
    langur1 = Integer.parseInt(gildi0[4]);

    gerdur2 = Integer.parseInt(gildi1[1]);
    notur2  = Integer.parseInt(gildi1[2]);  
    almennur2 = Integer.parseInt(gildi1[3]);
    langur2 = Integer.parseInt(gildi1[4]);

    gerdur3 = Integer.parseInt(gildi2[1]);
    notur3  = Integer.parseInt(gildi2[2]);  
    almennur3 = Integer.parseInt(gildi2[3]);
    langur3 = Integer.parseInt(gildi2[4]);

    gerdur4 = Integer.parseInt(gildi3[1]);
    notur4  = Integer.parseInt(gildi3[2]);  
    almennur4 = Integer.parseInt(gildi3[3]);
    langur4 = Integer.parseInt(gildi3[4]);

    gerdur5 = Integer.parseInt(gildi4[1]);
    notur5  = Integer.parseInt(gildi4[2]);  
    almennur5 = Integer.parseInt(gildi4[3]);
    langur5 = Integer.parseInt(gildi4[4]);

    gerdur6 = Integer.parseInt(gildi5[1]);
    notur6  = Integer.parseInt(gildi5[2]);  
    almennur6 = Integer.parseInt(gildi5[3]);
    langur6 = Integer.parseInt(gildi5[4]);
    
    
    gerdur7 = Integer.parseInt(gildi6[1]);
    notur7  = Integer.parseInt(gildi6[2]);  
    almennur7 = Integer.parseInt(gildi6[3]);
    langur7 = Integer.parseInt(gildi6[4]);    
    
    gerdur8 = Integer.parseInt(gildi7[1]);
    notur8  = Integer.parseInt(gildi7[2]);  
    almennur8 = Integer.parseInt(gildi7[3]);
    langur8 = Integer.parseInt(gildi7[4]);   

    /*
    gerdur9 = Integer.parseInt(gildi8[1]);
    notur9  = Integer.parseInt(gildi8[2]);  
    almennur9 = Integer.parseInt(gildi8[3]);
    langur9 = Integer.parseInt(gildi8[4]);

    gerdur10 = Integer.parseInt(gildi9[1]);
    notur10  = Integer.parseInt(gildi9[2]);  
    almennur10 = Integer.parseInt(gildi9[3]);
    langur10 = Integer.parseInt(gildi9[4]);
    
    
    gerdur11 = Integer.parseInt(gildi10[1]);
    notur11  = Integer.parseInt(gildi10[2]);  
    almennur11 = Integer.parseInt(gildi10[3]);
    langur11 = Integer.parseInt(gildi10[4]);    
    
    gerdur12 = Integer.parseInt(gildi11[1]);
    notur12  = Integer.parseInt(gildi11[2]);  
    almennur12 = Integer.parseInt(gildi11[3]);
    langur12 = Integer.parseInt(gildi11[4]);   
    */
    
    k1.reset(timi, index);
    k2.reset(timi2, index+1);
    k3.reset(timi3, index+2);
    k4.reset(timi4, index+3);
    k5.reset(timi5, index+4);
    k6.reset(timi6, index+5);
    k7.reset(timi7, index+6);
    k8.reset(timi8, index+7);
    
    
    ka1.reset(timi, index);
    ka2.reset(timi2, index+1);
    ka3.reset(timi3, index+2);
    ka4.reset(timi4, index+3);
    ka5.reset(timi5, index+4);
    ka6.reset(timi6, index+5);
    ka7.reset(timi7, index+6);
    ka8.reset(timi8, index+7);    
    
    kb1.reset(timi, index);
    kb2.reset(timi2, index+1);
    kb3.reset(timi3, index+2);
    kb4.reset(timi4, index+3);
    kb5.reset(timi5, index+4);
    kb6.reset(timi6, index+5);
    kb7.reset(timi7, index+6);
    kb8.reset(timi8, index+7);    
    
    
    kc1.reset(timi, index);
    kc2.reset(timi2, index+1);
    kc3.reset(timi3, index+2);
    kc4.reset(timi4, index+3);
    kc5.reset(timi5, index+4);
    kc6.reset(timi6, index+5);
    kc7.reset(timi7, index+6);
    kc8.reset(timi8, index+7);

    
    kd1.reset(timi, index);
    kd2.reset(timi2, index+1);
    kd3.reset(timi3, index+2);
    kd4.reset(timi4, index+3);
    kd5.reset(timi5, index+4);
    kd6.reset(timi6, index+5);
    kd7.reset(timi7, index+6);
    kd8.reset(timi8, index+7);    
    
 
  }

 if(currenttime > leadin){
 float x = (width/4);
 
 if (gerdur1 == 109){
   active = false;
   println("done");
   index = 0;
 }
 
 

 
 if (gerdur1 == 108){
     textFont(font2);
   text("starting", 80, 40);     
   text("starting", 80, 380);
   text("starting", 80, 580);
 }

 

 

//vinstri

 noStroke();
 smooth();


   
   // Horn 
 
 pushMatrix(); 
   translate(0, 4);
   kc1.draw(2, 74, 73, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 750, 0, gerdur1, notur1, almennur1, langur1);
   translate(kb1.l, 0);
   kc2.draw(180, 74, 73, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 750, 0, gerdur2,  notur2, almennur2, langur2);
   translate(kb2.l, 0);
   kc3.draw(150, 74, 73, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 750, 0, gerdur3,  notur3, almennur3, langur3);
   translate(kb3.l, 0);
   kc4.draw(120, 74, 73, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 750, 0, gerdur4,   notur4, almennur4, langur4);
   translate(kb4.l, 0);
   kc5.draw(90, 74, 73, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 750, 0, gerdur5, notur5, almennur5, langur5);
   translate(kb5.l, 0);
   kc6.draw(50, 74, 73, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 750, 0, gerdur6,  notur6, almennur6, langur6);
    translate(kb6.l, 0);
   kc7.draw(50, 74, 73, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 750, 0, gerdur7,  notur7, almennur7, langur7);
    translate(kb7.l, 0);
   kc8.draw(50, 74, 73, 0, 0, 75, 0, 0, 0, 0, 0, 0, 0, 750, 0, gerdur8,  notur8, almennur8, langur8);
   popMatrix();
   
   
   

   
   
// Trompet

   pushMatrix(); 
   translate(0, 188);
   kb1.draw(2, 0, 0, 77, 0, 78, 79, 0, 0, 0, 0, 0, 0, 780, 0, gerdur1, notur1, almennur1, langur1);
   translate(kb1.l, 0);
   kb2.draw(180, 0, 0, 77, 0, 78, 79, 0, 0, 0, 0, 0, 0, 780, 0, gerdur2,  notur2, almennur2, langur2);
   translate(kb2.l, 0);
   kb3.draw(150, 0, 0, 77, 0, 78, 79, 0, 0, 0, 0, 0, 0, 780, 0, gerdur3,   notur3, almennur3, langur3);
   translate(kb3.l, 0);
   kb4.draw(120, 0, 0, 77, 0, 78, 79, 0, 0, 0, 0, 0, 0, 780, 0, gerdur4,   notur4, almennur4, langur4);
   translate(kb4.l, 0);
   kb5.draw(90, 0, 0, 77, 0, 78, 79, 0, 0, 0, 0, 0, 0, 780, 0, gerdur5,   notur5, almennur5, langur5);
   translate(kb5.l, 0);
   kb6.draw(50, 0, 0, 77, 0, 78, 79, 0, 0, 0, 0, 0, 0, 780, 0, gerdur6,   notur6, almennur6, langur6);
   translate(kb6.l, 0);
   kb7.draw(50, 0, 0, 77, 0, 78, 79, 0, 0, 0, 0, 0, 0, 780, 0, gerdur7,  notur7, almennur7, langur7);
    translate(kb7.l, 0);
   kb8.draw(50, 0, 0, 77, 0, 78, 79, 0, 0, 0, 0, 0, 0, 780, 0, gerdur8,  notur8, almennur8, langur8);
   popMatrix();
   
   
   
   
   
// Básúna

   pushMatrix(); 
   translate(0, 264);
   kd1.draw(2, 82, 0, 81, 0, 80, 83, 0, 0, 0, 0, 0, 0, 800, 0, gerdur1, notur1, almennur1, langur1);
   translate(kd1.l, 0);
   kd2.draw(180,82, 0, 81, 0, 80, 83, 0, 0, 0, 0, 0, 0, 800, 0, gerdur2,  notur2, almennur2, langur2);
   translate(kd2.l, 0);
   kd3.draw(150, 82, 0, 81, 0, 80, 83, 0, 0, 0, 0, 0, 0, 800, 0, gerdur3,  notur3, almennur3, langur3);
   translate(kd3.l, 0);
   kd4.draw(120, 82, 0, 81, 0, 80, 83, 0, 0, 0, 0, 0, 0, 800, 0, gerdur4,  notur4, almennur4, langur4);
   translate(kd4.l, 0);
   kd5.draw(90, 82, 0, 81, 0, 80, 83, 0, 0, 0, 0, 0, 0, 800, 0, gerdur5,  notur5, almennur5, langur5);
   translate(kd5.l, 0);
   kd6.draw(50, 82, 0, 81, 0, 80, 83, 0, 0, 0, 0, 0, 0, 800, 0, gerdur6,  notur6, almennur6, langur6);
   translate(kd6.l, 0);
   kd7.draw(50, 82, 0, 81, 0, 80, 83, 0, 0, 0, 0, 0, 0, 800, 0, gerdur7,  notur7, almennur7, langur7);
   translate(kd7.l, 0);
   kd8.draw(50, 82, 0, 81, 0, 80, 83, 0, 0, 0, 0, 0, 0, 800, 0, gerdur8,  notur8, almennur8, langur8);
   popMatrix(); 
   
   
/*

   pushMatrix(); 
   translate(0, 444);
   ka1.draw(2, 3, 3, 48, 3, 3, 3, 53, 3, 3, 3, 480, gerdur1, notur1, almennur1, langur1);
   translate(ka1.l, 0);
   ka2.draw(180, 3, 3, 48, 3, 3, 3, 53, 3, 3, 3, 480, gerdur2,  notur2, almennur2, langur2);
   translate(ka2.l, 0);
   ka3.draw(150, 3, 3, 48, 3, 3, 3, 53, 3, 3, 3, 480, gerdur3,  notur3, almennur3, langur3);
   translate(ka3.l, 0);
   ka4.draw(120, 3, 3, 48, 3, 3, 3, 53, 3, 3, 3, 480, gerdur4,  notur4, almennur4, langur4);
   translate(ka4.l, 0);
   ka5.draw(90, 3, 3, 48, 3, 3, 3, 53, 3, 3, 3, 480, gerdur5,  notur5, almennur5, langur5);
   translate(ka5.l, 0);
   ka6.draw(50, 3, 3, 48, 3, 3, 3, 53, 3, 3, 3, 480, gerdur6,  notur6, almennur6, langur6);
   translate(ka6.l, 0);
   ka7.draw(50, 3, 3, 48, 3, 3, 3, 53, 3, 3, 3, 480, gerdur7,  notur7, almennur7, langur7);
   translate(ka7.l, 0);
   ka8.draw(50, 3, 3, 48, 3, 3, 3, 53, 3, 3, 3, 480, gerdur8,  notur8, almennur8, langur8);
   popMatrix();
 
 
 
 

 
   pushMatrix(); 
   translate(0, 588);
   k1.draw(2, 30, 3, 31, 3, 32, 3, 3, 35, 34, 3, 300, gerdur1, notur1, almennur1, langur1);
   translate(k1.l, 0);
   k2.draw(180, 30, 3, 31, 3, 32, 3, 3, 35, 34, 3, 300, gerdur2,  notur2, almennur2, langur2);
   translate(k2.l, 0);
   k3.draw(150, 30, 3, 31, 3, 32, 3, 3, 35, 34, 3, 300, gerdur3,  notur3, almennur3, langur3);
   translate(k3.l, 0);
   k4.draw(120, 30, 3, 31, 3, 32, 3, 3, 35, 34, 3, 300, gerdur4,  notur4, almennur4, langur4);
   translate(k4.l, 0);
   k5.draw(90, 30, 3, 31, 3, 32, 3, 3, 35, 34, 3, 300, gerdur5,  notur5, almennur5, langur5);
   translate(k5.l, 0);
   k6.draw(50, 30, 3, 31, 3, 32, 3, 3, 35, 34, 3, 300, gerdur6,  notur6, almennur6, langur6);
   translate(k6.l, 0);
   k7.draw(50, 30, 3, 31, 3, 32, 3, 3, 35, 34, 3, 300, gerdur7,  notur7, almennur7, langur7);
   translate(k7.l, 0);
   k8.draw(50, 30, 3, 31, 3, 32, 3, 3, 35, 34, 3, 300, gerdur8,  notur8, almennur8, langur8);
   popMatrix();


   */





 }
 }



 if (active == false){
 
   
   if (lare >= 0){
   textFont(font1, 80);
   text("0000000", 300, 330);
   }
  
 
  }
 
 
}



void keyPressed(){
 if( (key == ' ') || (key == 'p') ){                       //THIS START OR RESETS THE PROGRAM
 starttime = millis();
 index = 0;
 active = true;
 println("start");
 }

if (key == 'o'){
  active = false;
  index = 0;
  println("snarstopp");
  lare=0;
}

if(key == '1'){
kafli = loadStrings("LaurBrass.txt");
index=0;
lare=1;
}


if(key == '8'){
kafli = loadStrings("RuglLaurTutti.txt");
index=0;
lare=1;
}

if(key == '9'){
kafli = loadStrings("LaurTutti.txt");
index=0;
lare=1;
}


}



