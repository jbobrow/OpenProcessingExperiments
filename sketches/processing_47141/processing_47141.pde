


String[] kafli;

import oscP5.*;
import netP5.*;


OscP5 oscP5;
NetAddress myBroadcastLocation; 
NetAddress myRemoteLocation; 
String host = "localhost";


int portSend = 32000;
int portReceive = 12000;
boolean sendOSC = true;

String myConnectPattern = "/server/connect";
String myDisconnectPattern = "/server/disconnect";


void setup(){

 
  
kafli = loadStrings("fundni.txt");
   
font1 = createFont("Century", 14);
font2 = loadFont("CourierNew36.vlw");

  oscP5 = new OscP5(this, portReceive);
  myBroadcastLocation = new NetAddress(host, portSend);  
  myRemoteLocation = new NetAddress(host, 12001); 
 size(1024, 500);
 frameRate(25);

 size(1024, 768);
 frameRate(25);
  
 smooth();
}

void draw(){
 background(0);

 fill(255);
textFont(font1);
text("1.dos", 50, 80, 140);
text("2.dos", 50, 160, 140);
text("3.dos", 50, 240, 140);
text("4.dos", 50, 320, 140);
text("5.dos", 50, 400, 140);
text("6.dos", 50, 480, 140);
text("7.dos", 50, 560, 140);
text("8.dos", 50, 640, 140);


f1.draw(4, -100, 1, 1);
f2.draw(4,  0, 1, 1);
f3.draw(4, 100, 1, 1);
f4.draw(4, 200, 1, 1);
f5.draw(4, 300, 1, 1);
f6.draw(4, 400, 1, 1);
f7.draw(4, 500, 1, 1);
f8.draw(4, 600, 1, 1);


 strokeWeight (5);
 stroke(40,116,217);
 line(width/4, 0, width/4, height);


 String tala0 = kafli[index]; 
 String tala1 = kafli[index+1];
 String tala2 = kafli[index+2];
 String tala3 = kafli[index+3];
 String tala4 = kafli[index+4];
 String tala5 = kafli[index+5];
 String tala6 = kafli[index+6];
 String tala7 = kafli[index+7];
 String tala8 = kafli[index+8];
 String tala9 = kafli[index+9];

 String[] gildi0 = split(tala0, ","); 
 String[] gildi1 = split(tala1, ",");
 String[] gildi2 = split(tala2, ",");
 String[] gildi3 = split(tala3, ",");
 String[] gildi4 = split(tala4, ",");
 String[] gildi5 = split(tala5, ",");
 String[] gildi6 = split(tala6, ",");
 String[] gildi7 = split(tala7, ",");
 String[] gildi8 = split(tala8, ","); 
 String[] gildi9 = split(tala9, ","); 

int ill0 = Integer.parseInt(gildi0[0]);
int ill1 = Integer.parseInt(gildi1[0]);
int ill2 = Integer.parseInt(gildi2[0]);
int ill3 = Integer.parseInt(gildi3[0]);
int ill4 = Integer.parseInt(gildi4[0]);
int ill5 = Integer.parseInt(gildi5[0]);
int ill6 = Integer.parseInt(gildi6[0]);
int ill7 = Integer.parseInt(gildi7[0]);
int ill8 = Integer.parseInt(gildi8[0]);
int ill9 = Integer.parseInt(gildi9[0]);


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
    timi9 = (ill9 - ill8)*speed;
    
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
 
    gerdur9 = Integer.parseInt(gildi8[1]);
    notur9  = Integer.parseInt(gildi8[2]);  
    almennur9 = Integer.parseInt(gildi8[3]);
    langur9 = Integer.parseInt(gildi8[4]);
 
   if (gerdur1 == 5){
   active = false;
   println("done");
   index = 0;
 }

    if (active == true){
     julli = 1; 
    }else if (active == false){
     julli = 0; 
    }
    
    k1.reset(timi, index);
    k2.reset(timi2, index+1);
    k3.reset(timi3, index+2);
    k4.reset(timi4, index+3);
    k5.reset(timi5, index+4);
    k6.reset(timi6, index+5);
    k7.reset(timi7, index+6);
    k8.reset(timi8, index+7);
    k9.reset(timi9, index+8);

    ka1.reset(timi, index);
    ka2.reset(timi2, index+1);
    ka3.reset(timi3, index+2);
    ka4.reset(timi4, index+3);
    ka5.reset(timi5, index+4);
    ka6.reset(timi6, index+5);
    ka7.reset(timi7, index+6);
    ka8.reset(timi8, index+7);
    ka9.reset(timi9, index+8);
    
    kb1.reset(timi, index);
    kb2.reset(timi2, index+1);
    kb3.reset(timi3, index+2);
    kb4.reset(timi4, index+3);
    kb5.reset(timi5, index+4);
    kb6.reset(timi6, index+5);
    kb7.reset(timi7, index+6);  
    kb8.reset(timi8, index+7);
    kb9.reset(timi9, index+8);
    
    kc1.reset(timi, index);
    kc2.reset(timi2, index+1);
    kc3.reset(timi3, index+2);
    kc4.reset(timi4, index+3);
    kc5.reset(timi5, index+4);
    kc6.reset(timi6, index+5);
    kc7.reset(timi7, index+6);    
    kc8.reset(timi8, index+7);
    kc9.reset(timi9, index+8);
    
    kd1.reset(timi, index);
    kd2.reset(timi2, index+1);
    kd3.reset(timi3, index+2);
    kd4.reset(timi4, index+3);
    kd5.reset(timi5, index+4);
    kd6.reset(timi6, index+5);
    kd7.reset(timi7, index+6);    
    kd8.reset(timi8, index+7);
    kd9.reset(timi9, index+8);
    
    ke1.reset(timi, index);
    ke2.reset(timi2, index+1);
    ke3.reset(timi3, index+2);
    ke4.reset(timi4, index+3);
    ke5.reset(timi5, index+4);
    ke6.reset(timi6, index+5);
    ke7.reset(timi7, index+6);
    ke8.reset(timi8, index+7);
    ke9.reset(timi9, index+8);
        
    kf1.reset(timi, index);
    kf2.reset(timi2, index+1);
    kf3.reset(timi3, index+2);
    kf4.reset(timi4, index+3);
    kf5.reset(timi5, index+4);
    kf6.reset(timi6, index+5);
    kf7.reset(timi7, index+6);
    kf8.reset(timi8, index+7);
    kf9.reset(timi9, index+8);
    
    kg1.reset(timi, index);
    kg2.reset(timi2, index+1);
    kg3.reset(timi3, index+2);
    kg4.reset(timi4, index+3);
    kg5.reset(timi5, index+4);
    kg6.reset(timi6, index+5);
    kg7.reset(timi7, index+6);
    kg8.reset(timi8, index+7);
    kg9.reset(timi9, index+8);

    kh1.reset(timi, index);
    kh2.reset(timi2, index+1);
    kh3.reset(timi3, index+2);
    kh4.reset(timi4, index+3);
    kh5.reset(timi5, index+4);
    kh6.reset(timi6, index+5);    
    kh7.reset(timi7, index+6);
    kh8.reset(timi8, index+7);
    kh9.reset(timi9, index+8);
  }
    


if (currenttime > leadin){





 if (gerdur1 == 5){
   active = false;
   println("done");
   index = 0;
 }
 
 if (gerdur1 == 4){
     textFont(font2);
   text("starting", 80, 40);     
   text("starting", 80, 320);
   text("starting", 80, 620);
 }

 noStroke();
 smooth();


  // if ((gerdur1 == 84) || (gerdur2 == 84) || (gerdur3 == 84) || (gerdur4 == 84) || (gerdur5 == 84) || (gerdur6 == 84) || (gerdur7 == 84) ){
   pushMatrix();
   translate(0, 300);
   k1.draw(2, 36,84,38,39,40,41,42,43, gerdur1, notur1, almennur1, langur1);
   translate(k1.l, 0);
   k2.draw(180, 36,84,38,39,40,41,42,43, gerdur2,  notur2, almennur2, langur2);
   translate(k2.l, 0);
   k3.draw(150, 36,84,38,39,40,41,42,43, gerdur3,  notur3, almennur3, langur3);
   translate(k3.l, 0);
   k4.draw(120, 36,84,38,39,40,41,42,43, gerdur4,  notur4, almennur4, langur4);
   translate(k4.l, 0);
   k5.draw(90, 36, 84,38,39,40,41,42,43, gerdur5,  notur5, almennur5, langur5);
   translate(k5.l, 0);
   k6.draw(50, 36,84,38,39,40,41,42,43, gerdur6,  notur6, almennur6, langur6);
   translate(k6.l, 0);
   k7.draw(50, 36,84,38,39,40,41,42,43, gerdur7,  notur7, almennur7, langur7);
   translate(k7.l, 0);
   k8.draw(50, 36,84,38,39,40,41,42,43, gerdur8,  notur8, almennur8, langur8);
   translate(k8.l, 0);
   k9.draw(50, 36,84,38,39,40,41,42,43, gerdur9,  notur9, almennur9, langur9);
   popMatrix();
 //  }
  
 //  if ((gerdur1 == 85) || (gerdur2 == 85) || (gerdur3 == 85) || (gerdur4 == 85) || (gerdur5 == 85) || (gerdur6 == 85) || (gerdur7 == 85) ){
   pushMatrix(); 
   translate(0, 60);
   ka1.draw(2, 4,85,6,7,8,9,9,9, gerdur1, notur1, almennur1, langur1);
   translate(ka1.l, 0);
   ka2.draw(180, 4,85,6,7,8,9,9,9, gerdur2,  notur2, almennur2, langur2);
   translate(ka2.l, 0);
   ka3.draw(150, 4,85,6,7,8,9,9,9, gerdur3,  notur3, almennur3, langur3);
   translate(ka3.l, 0);
   ka4.draw(120, 4,85,6,7,8,9,9,9, gerdur4,  notur4, almennur4, langur4);
   translate(ka4.l, 0);
   ka5.draw(90, 4,85,6,7,8,9,9,9, gerdur5,  notur5, almennur5, langur5);
   translate(ka5.l, 0);
   ka6.draw(50, 4,85,6,7,8,9,9,9, gerdur6,  notur6, almennur6, langur6);
   translate(ka6.l, 0);
   ka7.draw(50, 4,85,6,7,8,9,9,9, gerdur7,  notur7, almennur7, langur7);
   translate(ka7.l, 0);
   ka8.draw(50, 4,85,6,7,8,9,9,9, gerdur8,  notur8, almennur8, langur8);
   translate(ka8.l, 0);
   ka9.draw(50, 4,85,6,7,8,9,9,9, gerdur9,  notur9, almennur9, langur9);
   popMatrix();
   //}
  
 //  if ((gerdur1 == 86) || (gerdur2 == 86) || (gerdur3 == 86) || (gerdur4 == 86) || (gerdur5 == 86) || (gerdur6 == 86) || (gerdur7 == 86) ){
   pushMatrix(); 
   translate(0, 380);
   kb1.draw(2, 96,86,102,99,10,11,12,13, gerdur1, notur1, almennur1, langur1);
   translate(kb1.l, 0);
   kb2.draw(180, 96,86,102,99,10,11,12,13, gerdur2,  notur2, almennur2, langur2);
   translate(kb2.l, 0);
   kb3.draw(150, 96,86,102,99,10,11,12,13, gerdur3,   notur3, almennur3, langur3);
   translate(kb3.l, 0);
   kb4.draw(120, 96,86,102,99,10,11,12,13, gerdur4,   notur4, almennur4, langur4);
   translate(kb4.l, 0);
   kb5.draw(90, 96,86,102,99,10,11,12,13, gerdur5,   notur5, almennur5, langur5);
   translate(kb5.l, 0);
   kb6.draw(50, 96,86,102,99,10,11,12,13, gerdur6,   notur6, almennur6, langur6);
   translate(kb6.l, 0);
   kb7.draw(50, 96,86,102,99,10,11,12,13, gerdur7,   notur7, almennur7, langur7);
   translate(kb7.l, 0);
   kb8.draw(50, 96,86,102,99,10,11,12,13, gerdur8,   notur8, almennur8, langur8);
   translate(kb8.l, 0);
   kb9.draw(50, 96,86,102,99,10,11,12,13, gerdur9,   notur9, almennur9, langur9);
   popMatrix();
 //   }
  
 //  if ((gerdur1 == 87) || (gerdur2 == 87) || (gerdur3 == 87) || (gerdur4 == 87) || (gerdur5 == 87) || (gerdur6 == 87) || (gerdur7 == 87) ){
    pushMatrix(); 
   translate(0, -100);
   kc1.draw(2, 72, 87, 100, 75, 76, 77, 78, 79, gerdur1, notur1, almennur1, langur1);
   translate(kc1.l, 0);
   kc2.draw(180, 72, 87, 100, 75, 76, 77, 78, 79, gerdur2,  notur2, almennur2, langur2);
   translate(kc2.l, 0);
   kc3.draw(150, 72, 87, 100, 75, 76, 77, 78, 79, gerdur3,  notur3, almennur3, langur3);
   translate(kc3.l, 0);
   kc4.draw(120, 72, 87, 100, 75, 76, 77, 78, 79, gerdur4,   notur4, almennur4, langur4);
   translate(kc4.l, 0);
   kc5.draw(90, 72, 87, 100, 75, 76, 77, 78, 79, gerdur5, notur5, almennur5, langur5);
   translate(kc5.l, 0);
   kc6.draw(50, 72, 87, 100, 75, 76, 77, 78, 79, gerdur6,  notur6, almennur6, langur6);
   translate(kc6.l, 0);
   kc7.draw(50, 72, 87, 100, 75, 76, 77, 78, 79, gerdur7,  notur7, almennur7, langur7);
   translate(kc7.l, 0);
   kc8.draw(50, 72, 87, 100, 75, 76, 77, 78, 79, gerdur8,  notur8, almennur8, langur8);
   translate(kc8.l, 0);
   kc9.draw(50, 72, 87, 100, 75, 76, 77, 78, 79, gerdur9,  notur9, almennur9, langur9);
   popMatrix();
 //   }
  
   // if (gerdur == 88){
   pushMatrix(); 
   translate(0, -20);
   ke1.draw(2, 4,88,101,7,8,9,9,9, gerdur1, notur1, almennur1, langur1);
   translate(ke1.l, 0);
   ke2.draw(180, 4,88,101,7,8,9,9,9, gerdur2,  notur2, almennur2, langur2);
   translate(ke2.l, 0);
   ke3.draw(150, 4,88,101,7,8,9,9,9, gerdur3,  notur3, almennur3, langur3);
   translate(ke3.l, 0);
   ke4.draw(120, 4,88,101,7,8,9,9,9, gerdur4,  notur4, almennur4, langur4);
   translate(ke4.l, 0);
   ke5.draw(90, 4,88,101,7,8,9,9,9, gerdur5,  notur5, almennur5, langur5);
   translate(ke5.l, 0);
   ke6.draw(50, 4,88,101,7,8,9,9,9, gerdur6,  notur6, almennur6, langur6);
   translate(ke6.l, 0);
   ke7.draw(50, 4,88,101,7,8,9,9,9, gerdur7,  notur7, almennur7, langur7);
   translate(ke7.l, 0);
   ke8.draw(50, 4,88,101,7,8,9,9,9, gerdur8,  notur8, almennur8, langur8);
   translate(ke8.l, 0);
   ke9.draw(50, 4,88,101,7,8,9,9,9, gerdur9,  notur9, almennur9, langur9);
   popMatrix();
 //  }
  
 // if (gerdur == 89){
   pushMatrix(); 
   translate(0, 460);
   kf1.draw(2, 96,89,98,99,10,11,12,13, gerdur1, notur1, almennur1, langur1);
   translate(kf1.l, 0);
   kf2.draw(180, 96,89,98,99,10,11,12,13, gerdur2,  notur2, almennur2, langur2);
   translate(kf2.l, 0);
   kf3.draw(150, 96,89,98,99,10,11,12,13, gerdur3,   notur3, almennur3, langur3);
   translate(kf3.l, 0);
   kf4.draw(120, 96,89,98,99,10,11,12,13, gerdur4,   notur4, almennur4, langur4);
   translate(kf4.l, 0);
   kf5.draw(90, 96,89,98,99,10,11,12,13, gerdur5,   notur5, almennur5, langur5);
   translate(kf5.l, 0);
   kf6.draw(50, 96,89,98,99,10,11,12,13, gerdur6,   notur6, almennur6, langur6);
   translate(kf6.l, 0);
   kf7.draw(50, 96,89,98,99,10,11,12,13, gerdur7,   notur7, almennur7, langur7);
   translate(kf7.l, 0);
   kf8.draw(50, 96,89,98,99,10,11,12,13, gerdur8,   notur8, almennur8, langur8);
   translate(kf8.l, 0);
   kf9.draw(50, 96,89,98,99,10,11,12,13, gerdur9,   notur9, almennur9, langur9);
   popMatrix();
 //   }
  
 //   if (gerdur == 90){
    pushMatrix(); 
   translate(0, 140);
   kg1.draw(2, 72, 90, 74, 75, 76, 77, 78, 79, gerdur1, notur1, almennur1, langur1);
   translate(kg1.l, 0);
   kg2.draw(180, 72, 90, 74, 75, 76, 77, 78, 79, gerdur2,  notur2, almennur2, langur2);
   translate(kg2.l, 0);
   kg3.draw(150, 72, 90, 74, 75, 76, 77, 78, 79, gerdur3,  notur3, almennur3, langur3);
   translate(kg3.l, 0);
   kg4.draw(120, 72, 90, 74, 75, 76, 77, 78, 79, gerdur4,   notur4, almennur4, langur4);
   translate(kg4.l, 0);
   kg5.draw(90, 72, 90, 74, 75, 76, 77, 78, 79, gerdur5, notur5, almennur5, langur5);
   translate(kg5.l, 0);
   kg6.draw(50, 72, 90, 74, 75, 76, 77, 78, 79, gerdur6,  notur6, almennur6, langur6);
   translate(kg6.l, 0);
   kg7.draw(50, 72, 90, 74, 75, 76, 77, 78, 79, gerdur7,  notur7, almennur7, langur7);
   translate(kg7.l, 0);
   kg8.draw(50, 72, 90, 74, 75, 76, 77, 78, 79, gerdur8,  notur8, almennur8, langur8);
   translate(kg8.l, 0);
   kg9.draw(50, 72, 90, 74, 75, 76, 77, 78, 79, gerdur9,  notur9, almennur9, langur9);  
   popMatrix();   
 //     }
  
 //   if (gerdur == 91){
       pushMatrix(); 
   translate(0, 220);
   kh1.draw(2, 72, 91, 74, 75, 76, 77, 78, 79, gerdur1, notur1, almennur1, langur1);
   translate(kh1.l, 0);
   kh2.draw(180, 72, 91, 74, 75, 76, 77, 78, 79, gerdur2,  notur2, almennur2, langur2);
   translate(kh2.l, 0);
   kh3.draw(150, 72, 91, 74, 75, 76, 77, 78, 79, gerdur3,  notur3, almennur3, langur3);
   translate(kh3.l, 0);
   kh4.draw(120, 72, 91, 74, 75, 76, 77, 78, 79, gerdur4,   notur4, almennur4, langur4);
   translate(kh4.l, 0);
   kh5.draw(90, 72, 91, 74, 75, 76, 77, 78, 79, gerdur5, notur5, almennur5, langur5);
   translate(kh5.l, 0);
   kh6.draw(50, 72, 91, 74, 75, 76, 77, 78, 79, gerdur6,  notur6, almennur6, langur6);
   translate(kh6.l, 0);
   kh7.draw(50, 72, 91, 74, 75, 76, 77, 78, 79, gerdur7,  notur7, almennur7, langur7);
   translate(kh7.l, 0);
   kh8.draw(50, 72, 91, 74, 75, 76, 77, 78, 79, gerdur8,  notur8, almennur8, langur8);
   translate(kh8.l, 0);
   kh9.draw(50, 72, 91, 74, 75, 76, 77, 78, 79, gerdur9,  notur9, almennur9, langur9);
   popMatrix();
//    }
 
 }
 }

 if (active == false){
  if (lare == 0){
   textFont(font1, 80);
   text("0000000", 300, 330);
   }

  }
 
}





void keyPressed(){

  
   OscMessage m;
  switch(key) {
    case('c'):
      /* connect to the broadcaster */
      m = new OscMessage("/server/connect",new Object[0]);
      oscP5.flush(m,myBroadcastLocation);  
      break;
    case('d'):
      /* disconnect from the broadcaster */
      m = new OscMessage("/server/disconnect",new Object[0]);
      oscP5.flush(m,myBroadcastLocation);  
      break;
  } 

 if( (key == ' ') || (key == 'p') ){                       //THIS START OR RESETS THE PROGRAM
 starttime = millis();
 index = 0;
 active = true;
 println("start");
 }
 
 
 if(key == '1'){
kafli = loadStrings("deikokeitiponsa-pt1.txt");
index=0;

}
if(key == '2'){
kafli = loadStrings("deikokeitiponsa-pt2.txt");
index=0;

}
if(key == '3'){
kafli = loadStrings("deikokeitiponsa-pt3.txt");
index=0;

}
 
if(key == '4'){
kafli = loadStrings("koblakist-pt1.txt");
index=0;

}
if(key == '5'){
kafli = loadStrings("koblakist-pt2.txt");
index=0;

}
if(key == '6'){
kafli = loadStrings("koblakist-pt3.txt");
index=0;

}

 if(key == 'a'){
 speed = 1.0;
 }
 if(key == 's'){
 speed = 1.5;
 }
 if(key == 'd'){
 speed = 2.0;
 }
 if(key == 'f'){
 speed = 2.5;
 }

if (key == 'o'){
  active = false;
  index = 0;
  println("skyndistopp");
  lare=0;
}


}



/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* get and print the address pattern and the typetag of the received OscMessage */
  println("### received an osc message with addrpattern "+theOscMessage.addrPattern()+" and typetag "+theOscMessage.typetag());
  theOscMessage.print();
}


