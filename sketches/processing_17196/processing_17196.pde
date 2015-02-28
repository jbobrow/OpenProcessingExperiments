




/*
Verkefni

?dim ´ pian´i of ofarlega, hafa fyrir nedan? ut af c-i

xxx(styrofoam) fyrir nedan og minna?, jafnvel bara styro
xxxxredundant bæði sul A og styro


xxxdiminuendo, skrytid ad birtast. . . , i lengra lagi kannski fyrir merki? veit ekki kannski i lagi



xxx11111grænt skrímsli með sul A

xxxdiminuendo of hatt uppi fyrir fidlu (m'a vera lengra)


xxxarco á trillu of nalaegt tr. , tr. ma vera nedar


xxxklessukommar í endann
xxxklessukommar í endann

*/

String[] kafli;



void setup(){

kafli = loadStrings("vargard.txt");
   
font1 = createFont("Century", 14);
font2 = loadFont("CourierNew36.vlw");

 size(1024, 768);
 frameRate(25);
 smooth();
}





void draw(){
 background(0);

 fill(255);
textFont(font1);
text("Vln", 50, 70, 140);

text("Pno", 50, 356, 140);




f1.draw(1, 0, 1, 5);
//f2.draw(3, 180, 1, 1);
f3.draw(1, 360, 1, 5);
//f4.draw(2, 540, 1, 5);
f5.draw(2, 540, 1, 5);



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

 

 String[] gildi0 = split(tala0, ","); 
 String[] gildi1 = split(tala1, ",");
 String[] gildi2 = split(tala2, ",");
 String[] gildi3 = split(tala3, ",");
 String[] gildi4 = split(tala4, ",");
 String[] gildi5 = split(tala5, ",");
 String[] gildi6 = split(tala6, ",");

 

int ill0 = Integer.parseInt(gildi0[0]);
int ill1 = Integer.parseInt(gildi1[0]);
int ill2 = Integer.parseInt(gildi2[0]);
int ill3 = Integer.parseInt(gildi3[0]);
int ill4 = Integer.parseInt(gildi4[0]);
int ill5 = Integer.parseInt(gildi5[0]);
int ill6 = Integer.parseInt(gildi6[0]);


 if(active){                                  //CHECK IF THE PROGRAM IS ON
  currenttime = millis() - starttime;        //CHECK HOW fineCH TIMEHASELAPSED SINCE TRIGGER

  if(  (ill0*speed) <= (currenttime - leadin)){   //CHECK IFTHE NEXT EVENT IN THE QUE SHOULD BE TRIGGERED, LEADIN SPECIFIESDELAYAT BEGINNING

    

    timi = (ill1 - ill0)*speed;
    timi2 = (ill2 - ill1)*speed;
    timi3 = (ill3 - ill2)*speed;
    timi4 = (ill4 - ill3)*speed;
    timi5 = (ill5 - ill4)*speed;
    timi6 = (ill6 - ill5)*speed;

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
    
    ka1.reset(timi, index);
    ka2.reset(timi2, index+1);
    ka3.reset(timi3, index+2);
    ka4.reset(timi4, index+3);
    ka5.reset(timi5, index+4);
    ka6.reset(timi6, index+5);

    kc1.reset(timi, index);
    kc2.reset(timi2, index+1);
    kc3.reset(timi3, index+2);
    kc4.reset(timi4, index+3);
    kc5.reset(timi5, index+4);
    kc6.reset(timi6, index+5);

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



   pushMatrix();
   translate(0, -05);
   k1.draw(2, 72, 1, 74, 75, 76, 1, 1, 1, gerdur1, notur1, almennur1, langur1);
   translate(k1.l, 0);
   k2.draw(180, 72, 1, 74, 75, 76, 1, 1, 1, gerdur2,  notur2, almennur2, langur2);
   translate(k2.l, 0);
   k3.draw(150, 72, 1, 74, 75, 76, 1, 1, 1, gerdur3,  notur3, almennur3, langur3);
   translate(k3.l, 0);
   k4.draw(120, 72, 1, 74, 75, 76, 1, 1, 1, gerdur4,  notur4, almennur4, langur4);
   translate(k4.l, 0);
   k5.draw(90, 72, 1, 74, 75, 76, 1, 1, 1, gerdur5,  notur5, almennur5, langur5);
   translate(k5.l, 0);
   k6.draw(50, 72, 1, 74, 75, 76, 1, 1, 1, gerdur6,  notur6, almennur6, langur6);
   popMatrix();

   pushMatrix();
   translate(0, -05);
   ka1.draw(2, 87, 100, 73, 1, 1, 77, 78, 79, gerdur1, notur1, almennur1, langur1);
   translate(k1.l, 0);
   ka2.draw(180, 87, 100, 73, 1, 1, 77, 78, 79, gerdur2,  notur2, almennur2, langur2);
   translate(k2.l, 0);
   ka3.draw(150, 87, 100, 73, 1, 1, 77, 78, 79, gerdur3,  notur3, almennur3, langur3);
   translate(k3.l, 0);
   ka4.draw(120, 87, 100, 73, 1, 1, 77, 78, 79, gerdur4,  notur4, almennur4, langur4);
   translate(k4.l, 0);
   ka5.draw(90, 87, 100, 73, 1, 1, 77, 78, 79, gerdur5,  notur5, almennur5, langur5);
   translate(k5.l, 0);
   ka6.draw(50, 87, 100, 73, 1, 1, 77, 78, 79, gerdur6,  notur6, almennur6, langur6);
   popMatrix();





   pushMatrix(); 
   translate(0, 283);
   kc1.draw(2, 60, 61, 62, 63, 64, 65, 66, 67, gerdur1, notur1, almennur1, langur1);
   translate(kc1.l, 0);
   kc2.draw(180, 60, 61, 62, 63, 64, 65, 66, 67, gerdur2,  notur2, almennur2, langur2);
   translate(kc2.l, 0);
   kc3.draw(150, 60, 61, 62, 63, 64, 65, 66, 67, gerdur3,  notur3, almennur3, langur3);
   translate(kc3.l, 0);
   kc4.draw(120, 60, 61, 62, 63, 64, 65, 66, 67, gerdur4,   notur4, almennur4, langur4);
   translate(kc4.l, 0);
   kc5.draw(90, 60, 61, 62, 63, 64, 65, 66, 67, gerdur5, notur5, almennur5, langur5);
   translate(kc5.l, 0);
   kc6.draw(50, 60, 61, 62, 63, 64, 65, 66, 67, gerdur6,  notur6, almennur6, langur6);
   popMatrix();


 
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

  


 if( (key == ' ') || (key == 'p') ){                       //THIS START OR RESETS THE PROGRAM
 starttime = millis();
 index = 0;
 active = true;
 println("start");
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




