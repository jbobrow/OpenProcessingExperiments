
//bitvox//Alejandro Gonzalez//60rpm.tv//2009////////////Dominio Púbico// 
//A minimal sound sculptor//////////////////////////////////////////////
//Featuring: 'spooky ambiance with heartbeat' by blacklizard77//////////
//here:  http://www.freesound.org/samplesViewSingle.php?id=23873////////
//and under:  Creative Commons Sampling Plus 1.0 License ///////////////
//here: http://creativecommons.org/licenses/sampling+/1.0///////////////
////////////////////////////////////////////////////////////////////////
//Thought for GL but I kept it in P3D for openp5////////////////////////
////////////////////////////////////////////////////////////////////////

import peasy.*;               //camera 
import ddf.minim.*;           //Sound

Minim minim;                  
AudioPlayer s;                
PeasyCam cam;                 

int N=1024,                   //Size of sound buffer 
nM=int(sqrt(N)),              //Number of modules per side 
mS=50,                        //Initial size of a module       
a =200,                       //Amplifying factor//here it's quite high cause this is a short sampler
tS=nM*mS;                     //Initial length of the side of the container
float[] e;                    //An array to store the size of the modules
float[] m;                    //An array to store the analysis of the current sounds
color wh=0xAAFFFFFF;

void stop (){s.close();minim.stop();super.stop();}

void setup(){
  size(500,500,P3D);noStroke();noCursor();fill(wh);frameRate(24); //General settings
  minim = new Minim(this);s= minim.loadFile("s.mp3",N);s.play(); //Minim settings                            
  cam = new PeasyCam(this,tS*.5,tS*.6,0,N*2.5);cam.rotateX(-PI/5);cam.rotateY(-PI/3);//camera settings
  e=new float[N];m=new float[N];for(int i=0;++i<N;){e[i]=0;} //Variable settings 
}

void draw(){
  lights(); 
  background(0x50AAAAAA);
  m=s.mix.toArray();
  if(key=='w'){noFill();stroke(wh);}else if(key=='s'){noStroke();fill(wh);}
  for (int i=0;i<N; i++){       
      pushMatrix();
      translate (i%nM*mS,floor(i/nM*mS),0);    
      box(e[i]+=(m[i]*a)); 
      popMatrix();
   }        
}

