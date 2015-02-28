
float h,k; 
float directionh,directionk;
float speedh,speedk;
float cont,lite1;  
float cont2;
void setup()
{
  colorMode(HSB,360,100,100,100);
  size(600,400);   
  float h=1;
  float k=140;
  float col = 40;
  float directionk = 1; 
  float directionh = -1;
  float speedk = 0.16;
  float speedh = 0.16; 
/////////// //////
   
}
  
void draw()
{
 // background(0,0,h,1);
  noStroke();
  fill(0,0,100,1); 
  rect(0,0,width,height);
 h += speedh*directionh;                       
if(h>60){
  directionh = -directionh;
}
if(h<1){
  directionh = -directionh;
}
///////////// 
 lite1 = 150-h*PI;//to adjust spectrum, change 155
frameRate(20); //vary this, interesting
smooth();
translate(width/2,height/2);
noStroke();                    
  for (int i =0; i<8; i++)
  {
    ///////////////////
    float speedk = 0.006;
        float k=30;
        float directionk = 1;  
       k += speedk*directionk;                       
        if(k>200){
           directionk = -directionk;
              }
               if(k<10){
               directionk = -directionk;
              } 
              //////////////
    for (float cont=0; cont<TWO_PI; cont = cont + PI/k)
     
    {
      fill(lite1*cont,100,100,40);
     bezier(
         mouseX/4*sin(cont2-6*cont), //movement
         cont*height/PI,
         2+cont*10,(10+cont*10),
         mouseY/8.0*sin(cont2-6*cont),
         cont*height/PI,
         h+cont*60,20+cont*80);
        ////////////////////
      fill(0,0,0,20);
       rect(
         mouseX/8.0*sin(cont2-6*cont),
         cont*height/PI,
         4+cont*6,(4+cont*6),
         mouseY/2.0*cos(cont2-6*cont),
         cont*height/PI,
         2+cont*6,40+cont*6);
          
    }
    
     cont2 = cont2 + PI/360;
     rotate(TWO_PI/8);
  }  
  println(frameCount);
  println(frameRate);  
  }
 
    
  

