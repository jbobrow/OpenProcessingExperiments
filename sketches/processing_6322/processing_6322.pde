





int index = 0;

float speed = 1;

int leadin = 1000;          //DELAY BEFORE STARTING THE PROGRAM
kassi k1 = new kassi();
kassi k2 = new kassi();
kassi k3 = new kassi();
kassi k4 = new kassi();
kassi k5 = new kassi();
kassi k6 = new kassi();
kassi k7 = new kassi();
kassi k8 = new kassi();
kassi k9 = new kassi();


int snar;

int ged;

int track;

float starttime = 0;
float currenttime;  
boolean active = false;      //TO KNOW IF THE PROGRAM SHOULD BE RUNNING OR NOT
float timi = 0;
float timi2 = 0;
float timi3 = 0;
float timi4 = 0;
float timi5 = 0;
float timi6 = 0;
float timi7 = 0;
float timi8 = 0;
float timi9 = 0;


float gamalltimi = 0;

int dia = 23;
float y = -1000;

void setup(){

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
 k9.reset(timi9, index+8); 


 

 smooth();
}

void draw(){
 background(0);
 
 strokeWeight (5);
 stroke(10,176,117);





 pushMatrix();
 scale(1, 1.78);
 translate(0, -13);
 strokeWeight(2);
 stroke(255);
 line(0, dia*2, width, dia*2);
 line(0, dia*3, width, dia*3);
 line(0, dia*4, width, dia*4);
 line(0, dia*5, width, dia*5);
 line(0, dia*6, width, dia*6);
// line(width/4, dia*7, width/3, dia*7); 
 line(0, dia*8, width, dia*8);
 line(0, dia*9, width, dia*9);
 line(0, dia*10, width, dia*10);
 line(0, dia*11, width, dia*11);
 line(0, dia*12, width, dia*12);

 line(0, dia*14, width, dia*14);
 line(0, dia*15, width, dia*15);
 line(0, dia*16, width, dia*16);
// line(0, dia*17, width, dia*17);


 popMatrix();
 

pushMatrix();
translate(0,-45);
 noFill();
 beginShape();
vertex(100, 300);
vertex(100, 50);
bezierVertex(140, 150, 80, 230, 70, 230);
vertex(70, 230);
vertex(140, 260);
vertex(125, 210);
vertex(90, 220);
 endShape();
 popMatrix();
 
 pushMatrix();
 translate(0, -95);
 beginShape();
 vertex(70, 460);
 bezierVertex(100, 380, 210, 350, 100, 600); 
 endShape();
 point(170, 425);
 point(170, 460);
 popMatrix();
 
 stroke(255);
 line(100, 540, 100, 640);
 line(140, 540, 140, 640);
 
 
 
 stroke(40,116,217);
 line(width/4, 0, width/4, height);


 if(active){                                  //CHECK IF THE PROGRAM IS ON
  currenttime = millis() - starttime;        //CHECK HOW MUCH TIMEHASELAPSED SINCE TRIGGER
  if(index + 6 > ormitt.length){
    active = false;
    index = 0;
  }
  else if(  ( (ormitt[index][0]) * speed) <= (currenttime - leadin)){   //CHECK IFTHE NEXT EVENT IN THE QUE SHOULD BE TRIGGERED, LEADIN SPECIFIESDELAYAT BEGINNING
    if(index + 6 >= ormitt.length){          //AND IF WE ARE OUTOFEVENTS, STOP THE QUE
    track=millis();
    active = false;
    println("done");
    }
    gamalltimi=timi;
    timi = (ormitt[index + 1][0] - ormitt[index][0])*speed;
    timi2 = (ormitt[index + 2][0] - ormitt[index + 1][0])*speed;
    timi3 = (ormitt[index + 3][0] - ormitt[index + 2][0])*speed;
    timi4 = (ormitt[index + 4][0] - ormitt[index + 3][0])*speed;
    timi5 = (ormitt[index + 5][0] - ormitt[index + 4][0])*speed;
    timi6 = (ormitt[index + 6][0] - ormitt[index + 5][0])*speed;
    timi7 = (ormitt[index + 7][0] - ormitt[index + 6][0])*speed;
    timi8 = (ormitt[index + 8][0] - ormitt[index + 7][0])*speed;

    
   
    index++;                                  //MOVE TO NEXT EVENT IN THE QUE

    snar = ormitt[index - 1][1];
    ged  = ormitt[index - 1][2]; 
  

 

    k1.reset(timi, index);

    k2.reset(timi2, index+1);
    
    k3.reset(timi3, index+2);

    k4.reset(timi4, index+3);
    
    k5.reset(timi5, index+4);

    k6.reset(timi6, index+5);
    
    k7.reset(timi7, index+6);
    
    k8.reset(timi8, index+7);
    
    k9.reset(timi9, index+8);
    
  }

 if(currenttime > leadin){
 int x = width/4;

 noStroke();
 smooth();
 fill(215,85,110,96);

   pushMatrix();
   translate(0,10); 
   k1.draw(2, snar, ged );
   translate(k1.l, 0);
   k2.draw(1, ormitt[index][1],  ormitt[index][2]);
   translate(k2.l, 0);
   k3.draw(1, ormitt[index + 1][1],  ormitt[index+1][2]);
   translate(k3.l, 0);
   k4.draw(1, ormitt[index + 2][1],   ormitt[index+2][2]);
   translate(k4.l, 0);
   k5.draw(1, ormitt[index + 3][1], ormitt[index+3][2]);
   translate(k5.l, 0);
   k6.draw(1, ormitt[index + 4][1],  ormitt[index+4][2]);
   translate(k6.l, 0);
   k7.draw(1, ormitt[index + 5][1],   ormitt[index+5][2]);
   translate(k7.l, 0);
   k8.draw(1, ormitt[index + 6][1], ormitt[index+6][2]);
   translate(k8.l, 0);
   k9.draw(1, ormitt[index + 7][1],  ormitt[index+7][2]);
   popMatrix();
  
  


 }
 }
}



void keyPressed(){
 if(key == ' '){                       //THIS START OR RESETS THE PROGRAM
 starttime = millis();
 index = 0;
 active = true;
 println("start");
 }
 else if(key == 'q' || key == 'Q'){
 starttime = millis();
 index = 0;
 active = false;
 println("stopped");
 }

}

void senda(int byrja){
 if(byrja == 1){
 starttime = millis();
 index = 0;
 active = true;
 println("start");
 }else{
  
   starttime = millis();
 index = 0;
 active = false;
 println("stopped");
 }  
}

