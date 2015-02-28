
import sms.*;  //sudden motion sensor library

import traer.physics.*;  //physics library


  PFont font;
ArrayList enemies;
  
ArrayList hellaballs;  //declare new array list 
float gravity=1;      //gravity variable
float drag=.007;    //drag 
  float randx= 150;
     float  randy= 250;
   static  int num=50;
 int scroll=2;

 ParticleSystem physics= new ParticleSystem( gravity, drag );   //create particle system "physics"
                      //object array to hold enemies
static float[] randomx= new float [num];
static  float []randomy= new float [num];
PShape face;
PShape facehit;

//static boolean[] destroy=new boolean[num];





void setup(){

  size( 640,480);
  smooth();
  fill( 0 );
 
  frameRate(30);
  face=loadShape("face.svg");
  facehit=loadShape("facehit.svg");
   font = loadFont("ArialRoundedMTBold-48.vlw"); 
     for (int i=0; i<num; i++){

  randx+=random(200,350);
    randomx[i]=randx;
  }
  
  for (int i=0; i<num; i++){

   randy+=random(-50,50);
    randomy[i]=randy;
  }
  
  
  hellaballs=new ArrayList();                        //hellaballs array list
   //add SlapBall object to array list
 
 
}



void draw() {                    // draw 
  background(200);
  int[] tilt=Unimotion.getSMSArray(); 
 //get accelerometer data
  int slap=tilt[0];                      //x axis
  int upslap=tilt[1];  


  
  if (tilt[0]>=20){                      //CREATE BALL

    hellaballs.add(new SlapBall(gravity,width/2,0,drag,slap,slap));
    //add a new SlapBall to hellaballs array list with dimensions based on slap strength 
    delay(200);
                                                           //debounce accelerometer
  }

  for (int i = hellaballs.size()-1; i >= 0; i--) {                   //self filling array list 
    
  
    SlapBall baller = (SlapBall) hellaballs.get(i);            //cast new SlapBall, retrive last object

 
  
//  baller.enemydraw();
    
      baller.drawballs();
   float score=  baller.update(slap,upslap);   
  baller.enemyupdate();
   baller.enemydraw(); 
   

    
//update, send accelerometer input to ball class
    
  textFont(font, 48); 
text(score, 15, 50);
    
 if(baller.finished()==true){                                 //terminate old particles from array list
  
   hellaballs.remove(i);
 }
   else if(baller.finished()==false){
     
   slap=0;
   }

 
   
  }

physics.tick();                                      //update physics

}

void mousePressed(){
  setup();
}






