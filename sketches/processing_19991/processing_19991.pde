
void setup () {

  size (600, 600);
  background (255);
  smooth ();
  
}

//control panel

//Path Controls
float PRand = 7;      //changes the degree of randomness within the path

//Cyan Path
float CxPath = 300;   //starting x coordinate (suggested: half of width)
float CyPath = 300;   //starging y coordinate (suggested: half of height)

//Magenta Path
float MxPath = 300;
float MyPath = 300;

//Yellow Path
float YxPath = 300;
float YyPath = 300;

//Black Path
float KxPath = 300;
float KyPath = 300;

//scribble controls
float Xrand = 8;    //the level of randomness within the scribble (x)
float Yrand = 8;    //the level of randomness within the scriblle (y)
float SS = 10;      //scribble size
float SSR = 10;     //scribble reset size

int Counter = 0;

void draw () {

  for (int frames = 0; Counter < 2; frames++) {  //The 'Counter' argument limits total number of cycles SS can make

    SS = SS - 0.02;    //scribble rate of change

    if (SS < -SSR) {   //scribble reset
      SS = SSR;
      Counter++;   
    }

    stroke (0, 255);
    
    /*Cyan Scribble*/
    fill (0 + abs(SS)*12, 170, 204, 50); //scribble size affects red hue
    scribble (CxPath += random (-PRand, PRand), CyPath += random (-PRand, PRand), SS, SS);

    /*Magenta Scribble*/
    fill (255, 0, 153 + abs(SS)*6, 50); //scribble size affects blue hue
    scribble (MxPath += random (-PRand, PRand), MyPath += random (-PRand, PRand), SS, SS);


    /*Yellow Scribble*/
    fill (255, 204, 0 + abs(SS)*6, 50); //scribble size affects blue hue
    scribble (YxPath += random (-PRand, PRand), YyPath += random (-PRand, PRand), SS, SS);

    /*Black Scribble*/
    fill (100 + SS*4, 50);        //scribble size affects black saturation 
    scribble (KxPath += random (-PRand, PRand), KyPath += random (-PRand, PRand), abs(SS), abs(SS));
  }



}



//custom 'scribble' function


void scribble (float x, float y, float sx, float sy) {

  beginShape();
  curveVertex(x + (-sx) + random (-Xrand, Xrand),y + (-sy) + random (-Yrand, Yrand));
  curveVertex(x + (-sx) + random (-Xrand, Xrand),y + (sy) + random (-Yrand, Yrand));
  curveVertex(x + (sx) + random (-Xrand, Xrand),y + (sy) + random (-Yrand, Yrand));
  curveVertex(x + (sx) + random (-Xrand, Xrand),y + (-sy) + random (-Yrand, Yrand));
  curveVertex(x + (-sx) + random (-Xrand, Xrand),y + (-sy) + random (-Yrand, Yrand));
  curveVertex(x + (-sx) + random (-Xrand, Xrand),y + (sy) + random (-Yrand, Yrand));
  curveVertex(x + (sx) + random (-Xrand, Xrand),y + (sy) + random (-Yrand, Yrand));


  endShape();
}
                
