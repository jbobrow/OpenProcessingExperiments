
int canvasWidth = 1920;
int canvasHeight = 1080;


float[] Pos21x ;  float[] Pos21y ;

char[]  Key5 ; char[]  Key21 ;  char[] KeyType; int KeyTypeNum; int PastKeyTypeNum; String KeyTypeAll;


float[] bezX ; float[] bezY ;

float[] PX ;  float[] PY ;

int Pnum; int MaxPnum; int PnumPast;
int textX; int textY;
float angle ;
float rot1; float rot2;
float cosE; float rot;

int Ang;
float rotNum1; float rotNum2; float rotNum[];

float[] rotMag;   int MaxrotMag; int indexMag;

float rivision = PI*3/2;
float bolder;
Boolean Ent = false;
Boolean Ing = false;

PImage img;
PFont font;


void setup() {
  
  img = loadImage("jaum2.png");
  font = createFont("ACaslonPro-Bold-48",32);
  MaxrotMag = 120;
  MaxPnum = 20;
  bolder = 7;
  textX = -350;
  textY = -350;
  frameRate(60);
  background(255);
  
  size(canvasWidth, canvasHeight);
  
  noFill();


  
  Pos21x = new float[21];
  Pos21y = new float[21];
  Key5 = new char[5];
  Key21 = new char[21];    
  bezX = new float[200];
  bezY = new float[200];
  PX = new float[200];
  PY = new float[200];
  rotMag = new float[MaxrotMag+1];
  KeyType = new char[MaxPnum];
  rotNum = new float[MaxPnum];
  
  rotMag[0] = 1;
  rotMag[19] = 0;
  indexMag = MaxrotMag;
  for(int i = 1; i < MaxrotMag - 1 ; i++)
      rotMag[i] = rotMag[i-1] / (1 + i*0.1/((float)MaxrotMag) )  ;
  



  for (int i =0; i<21; i++)
  {
    Pos21x[i] = 200*cos(2*PI*i/21 + rivision );  
    Pos21y[i] = 200*sin(2*PI*i/21 + rivision );
  }

  Key5[0] = 'a';   Key5[1] = 'i';   Key5[2] = 'u';   Key5[3] = 'o';   Key5[4] = 'e';  Key21[0] = 'b';  Key21[1] = 'c';  Key21[2] = 'd';  Key21[3] = 'f';  
  Key21[4] = 'g';  Key21[5] = 'h';  Key21[6] = 'j';  Key21[7] = 'k';  Key21[8] = 'l';  Key21[9] = 'm';  Key21[10] = 'n';  Key21[11] = 'p';  Key21[12] = 'q';
  Key21[13] = 'r';  Key21[14] = 's';  Key21[15] = 't';  Key21[16] = 'v';  Key21[17] = 'w';  Key21[18] = 'x';  Key21[19] = 'y';  Key21[20] = 'z';


  Pnum = 0;
  KeyTypeNum = 0;
  
  rotNum1 = 0;
  rotNum2 = 0;
  PnumPast = 0;
  PastKeyTypeNum = 0;

}

void draw() {
  if(Ing == false )
  {
      if(PnumPast > Pnum){
          PnumPast = Pnum;
          indexMag = 0;
          Ing = true;
    
      }    
      else if(PnumPast < Pnum){
          PnumPast++;
          indexMag = 0;
          Ing = true;
      } 
      else {
        
          if(KeyTypeNum != PastKeyTypeNum){
              indexMag = MaxrotMag;
              moving(PnumPast);
              PastKeyTypeNum = KeyTypeNum;
          }
      }
  }
  else
  {
      if(indexMag < MaxrotMag){
          moving(PnumPast);
    
      }
      
      else if( indexMag == MaxrotMag){
          moving(PnumPast);
          Ing = false;
      }    

   }
    print(Pnum);
    print(PnumPast); 
    print(Ing);
    println(indexMag);
   
}


void moving(int PnumN){
      background(255);
      translate(canvasWidth/2, canvasHeight/2);
         
         KeyTypeAll = "";
         for(int i = 0; i<KeyTypeNum; i++)
              KeyTypeAll += KeyType[i]; 
         
         textFont(font, 30);  
         text(KeyTypeAll,textX,textY);
                   
                   
      if(PnumN > 1)
      {
          rotate(-2*(1-rotMag[indexMag])*PI*rotNum[PnumN]/21 );
          rotate(-2*rotMag[indexMag]*PI*rotNum[PnumN-1]/21 );
      }
          
      image(img, -273, -277);          
      fill(0);
      strokeWeight(0);
      if(PnumN > 1)
         ellipse(1.5 *PX[PnumN-1] , 1.5 *PY[PnumN-1]  , 20*(1-rotMag[indexMag])*(1-rotMag[indexMag]) , 20*(1-rotMag[indexMag])*(1-rotMag[indexMag]));    
    
      noFill();
      strokeWeight(5);
      stroke(0);
      beginShape();
      if (PnumN>1)
      { 
          
      
                for (int i=0; i< PnumN-1; i++)
                {
                  
                  for (float j=0; j < bolder; j++) {
                  
                  
                  
                  if(i == PnumN - 2  )
                  {
                      bezier(
                      PX[i],
                      PY[i],
                      PX[i] + (1-rotMag[indexMag])*bezX[i]+bolder*j, 
                      PY[i] + (1-rotMag[indexMag])*bezY[i] -bolder*j, 
                      PX[i]*rotMag[indexMag]+(1-rotMag[indexMag])*(PX[i+1] - (1-rotMag[indexMag])*bezX[i+1]), 
                      PY[i]*rotMag[indexMag]+(1-rotMag[indexMag])*(PY[i+1] - (1-rotMag[indexMag])*bezY[i+1]), 
                      PX[i]*rotMag[indexMag]+(1-rotMag[indexMag])* PX[i+1], 
                      PY[i]*rotMag[indexMag]+(1-rotMag[indexMag])* PY[i+1]);
                  
                  }
                  else
                  {
                      bezier(PX[i], PY[i], (PX[i] + bezX[i]+bolder*j), PY[i]+ bezY[i], 
                      PX[i+1] - bezX[i+1], PY[i+1]- bezY[i+1], 
                      PX[i+1] , 
                      PY[i+1]); 

                  }
                  
                }
          }
      }
      endShape();  


      
      indexMag++; 
}


void keyPressed() {
  
  if(key == ENTER)
      KeyType[KeyTypeNum] = '.';
  else if(key != BACKSPACE) 
      KeyType[KeyTypeNum] = key;
  else
  {
      if( KeyTypeNum > 0)
        KeyTypeNum = KeyTypeNum - 1 ;
  }
      
  Pnum = 0;
  for(int k = 0; k <= KeyTypeNum; k++)
   {
        for (int i=0; i<5; i++)
        {
          if ( KeyType[k] == Key5[i])
          {
            Ang = i;
            Ent = true;
  
          }
        }
        
        for (int i=0; i<21; i++)
        {
          if ( KeyType[k] == Key21[i]){
            
            
          
                PX[Pnum] = Pos21x[i];
                PY[Pnum] = Pos21y[i];
                bezX[Pnum] = 500*cos(2*PI*i/21+2*PI*Ang/5 + rivision);
                bezY[Pnum] = 500*sin(2*PI*i/21+2*PI*Ang/5 + rivision);
                
                if(Pnum<MaxPnum)
                    Pnum++;
                
                rotNum[Pnum] = (float)i;              
                Ent = false;
  
          }
        }
      
        if ((KeyType[k] == '.'  )&&Ent&& Pnum > 0)
        {
                PX[Pnum] = 0;
                PY[Pnum] = 0;
                bezX[Pnum] = bezX[Pnum-1];
                bezY[Pnum] = bezX[Pnum-1];
                
                if(Pnum<MaxPnum)
                    Pnum++;
        }
   } 

  if(KeyTypeNum < MaxPnum-1 && key != BACKSPACE)
        KeyTypeNum++;

}
