
// Día 11, corredor.
// ssbeltran


// - - - - - - DECLARO VARIABLES


int portishead = 11;
float [] aro = new float [portishead];
float [] varA = new float [portishead];
float [] ruidoA = new float [portishead];
float [] posX = new float [portishead];
float [] ruidoX = new float [portishead];
float [] varX = new float [portishead];
float [] posY = new float [portishead];
float [] ruidoY = new float [portishead];
float [] varY = new float [portishead];


float rot;
float ruidoR;
float varR;

// - - - - - - - - - SETUP

void setup (){
  
size (800,800);
smooth ();
background (255);

 playMachine ();


}

// - - - - DRAW

void draw () {
 
 MachineGun ();
  

  

  
  
  
}

