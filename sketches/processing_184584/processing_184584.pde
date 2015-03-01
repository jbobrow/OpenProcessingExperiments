
int quant=25;

float [] vX = new float [quant];
float[] vY = new float [quant];
float [] pX = new float [quant];
float[] pY = new float [quant];

float[][] colors = new float[quant][3];

float radiint=25;
float radi=250;

float angle;
float limX;
float limY;
float x;
float y;

float vel =7;
 
void setup() {
  size(800,600);
 pos (400,300);
 velrand();
  colrand();

}


     
void draw() {
 
 /* print (pX[0]);
  smooth();
  
  print ("/// vY= ");
  print (vY[1]); */
    
 background(0);
 fill(255);
 strokeWeight(0);
 ellipse (400,300, radiint*2+radi*2, radiint*2+radi*2);

  
  //pilota
 for (int i = 0; i<quant; i++) 
   {
    fill(colors[i][0],colors[i][1], colors[i][2]);
    stroke(0,0,0);
    strokeWeight(2);
    ellipse (pX[i],pY[i], radiint*2,radiint*2);
        
    //avasar
     pX[i]=pX[i]+vX[i];
     pY[i]=pY[i]+vY[i];
    
    //condici rebot    
    //0 al centre
    y=(height/2)-pY[i];
    x=pX[i]-(width/2);  
   
   //calcul angle
   angle = atan2 (y,x);
   
   //calcul limits exteriors
     limX= cos(angle)*radi;
    limX=abs(limX);
    limY= sin(angle)*radi;
    limY=abs(limY);
  
    //control interior
    if(pX[i]>((width/2)-limX)&&pX[i]<((width/2)+limX)&&pY[i]>=((height/2)-limY)&&pY[i]<=((height/2)+limY)) {}
      else{
     // print ("SORTIDA!!!!");
       vX[i]=-vX[i];
       vY[i]=-vY[i];
    
        }        
 
}

//FALTA CONTROLAR EL BUG FORA DEL CERCLE

}


void mousePressed() {
     
   //posicio
   pos (mouseX, mouseY);
   //color random   
   colrand();
   //vel random
   velrand();
     
}


void pos (int xi, int yi) {
  
   //condici rebot    
    //0 al centre
    y=(height/2)-yi;
    x=xi-(width/2);  
   
   //calcul angle
   angle = atan2 (y,x);
   
   //calcul limits exteriors
     limX= cos(angle)*radi;
    limX=abs(limX);
    limY= sin(angle)*radi;
    limY=abs(limY);
  
    //control interior
    if(xi>((width/2)-limX)&&xi<((width/2)+limX)&&yi>=((height/2)-limY)&&yi<=((height/2)+limY)) {}
      else{
     // print ("SORTIDA!!!!");
       xi=400;
       yi=300;
    
        }        
  
  
  
   for (int i = 0; i < quant; i++) 
   {
    pX[i]=xi;
    pY[i]=yi;
   }
  
}


void colrand() {

   for (int i = 0; i < quant; i++) 
   {
    colors[i][0]=random(0,255);
    colors[i][1]=random(0,255);
    colors[i][2]=random(0,255);
   }
   
}


void velrand() {
  
   for (int i = 0; i < quant; i++) 
   {
   vX[i]=random(-vel,vel);
   vY[i]=random(-vel,vel);
   }
 
}
