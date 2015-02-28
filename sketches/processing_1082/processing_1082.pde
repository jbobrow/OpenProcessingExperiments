


int index = 0;
int leadin = 1000;          //DELAY BEFORE STARTING THE PROGRAM
kassi k1 = new kassi();
kassi k2 = new kassi();
kassi k3 = new kassi();
kassi k4 = new kassi();
kassi k5 = new kassi();
kassi k6 = new kassi();

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

float location = 0;

float gamalltimi = 0;


float speed=9.5;
int dia= 30;
float y = -1000;
float dir = 1.0;

void setup(){


 PFont fontA = loadFont("CourierNew36.vlw");
 textFont(fontA, 36);
 
//img = loadImage("photo.jpg");

 size(600, 600);
 frameRate(25);
 k1.reset(timi, index);
 k2.reset(timi2, index+1);
 k3.reset(timi3, index+2);
 k4.reset(timi4, index+3);
 k5.reset(timi5, index+4);
 k6.reset(timi6, index+5); 
 smooth();
}

void draw(){

 background(0);

 
 //draw the boundary lines for the ball
 strokeWeight (5);
 stroke(10,176,117);
 line(width/4-dia, dia, width/4+dia, dia);
 line(width/4-dia, height-dia, width/4+dia, height-dia);
 
 strokeWeight (2);
 line(width/4, 0, width/4, height);


 if(active){                                  //CHECK IF THE PROGRAM IS ON
  currenttime = millis() - starttime;        //CHECK HOW MUCH TIMEHASELAPSED SINCE TRIGGER
  if(index + 6 > smarud.length){
    active = false;
    index = 0;
  }
  else if(smarud[index][0] <= (currenttime - leadin)){   //CHECK IFTHE NEXT EVENT IN THE QUE SHOULD BE TRIGGERED, LEADIN SPECIFIESDELAYAT BEGINNING
    if(index + 1 >= marud.length){          //AND IF WE ARE OUTOFEVENTS, STOP THE QUE
    track=millis();
    active = false;
    println("done");
    }
    gamalltimi=timi;
    timi = smarud[index + 1][0] - smarud[index][0];
    timi2 = smarud[index + 2][0] - smarud[index + 1][0];
    timi3 = smarud[index + 3][0] - smarud[index + 2][0];
    timi4 = smarud[index + 4][0] - smarud[index + 3][0];
    timi5 = smarud[index + 5][0] - smarud[index + 4][0];
    timi6 = smarud[index + 6][0] - smarud[index + 5][0];

   
    index++;                                  //MOVE TO NEXT EVENT IN THE QUE

    if(smarud[index-1][1] == 60){
     y = dia + dia / 2;
     dir = 1.0;
     println(millis() - track + " " + gamalltimi);
     track = (int)millis();
     
     
    }else if(smarud[index-1][1] == 48){
     y = height - (dia + dia / 2);
     dir = -1.0;
     println(millis() - track + " " + gamalltimi);
     track = (int)millis();
     
     
   }
     location = 0;
 

    k1.reset(timi, index);

    k2.reset(timi2, index+1);
    
    k3.reset(timi3, index+2);

    k4.reset(timi4, index+3);
    
    k5.reset(timi5, index+4);

    k6.reset(timi6, index+5);
    
  }

 if(currenttime > leadin){
 int x = width/4;

 noStroke();
 smooth();
 fill(215,85,110,96);
 //draw ball
   
   
   k1.draw(255, 1, smarud[index][2], smarud[index][3] );
   pushMatrix();
   translate(k1.l, 0);
   k2.draw(180, -1,  smarud[index + 1][2], smarud[index+1][3]);
   translate(k2.l, 0);
   k3.draw(100, 1, smarud[index + 2][2], smarud[index+2][3]);
   translate(k3.l, 0);
   k4.draw(70, -1,  smarud[index + 3][2], smarud[index+3][3]);
   translate(k4.l, 0);
   k5.draw(40, 1, smarud[index + 4][2], smarud[index+4][3]);
   translate(k5.l, 0);
   k6.draw(20, 1, smarud[index + 5][2], smarud[index+5][3]);
  
  
   popMatrix();
 stroke(5,150);  
 fill(215,85,110,96);
 ellipse(x, y + location, dia, dia);

 speed = (height - (2 * dia) - (.5 * dia)) / frameRate * 1000.0 / timi;
 location = location + speed * dir;



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





