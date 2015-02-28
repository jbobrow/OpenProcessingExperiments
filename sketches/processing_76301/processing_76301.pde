
//Dana Silberberg Sahar
//Home Assignment #6 _ Oct.22nd.2012 
//Trig & Fun-ctions

//Declaring my variables:
int angle;
int flag;
int  FlagDir;
int stern;
int  strDir;
//int   angDir;
float rad;


//Set Up:  
  void setup(){
  colorMode (HSB,360,100,100,100);
  size (800,800);
  smooth();
  background (0,0,0,100);
  
  //Defining variables
   angle=0;
   rad=0;
   flag=0;
   FlagDir=flag+1;
//   stern=3;
 // strDir=stern+1;
  // angDir=angle+1;
}

void draw(){
float x=angle/130*cos(radians(angle));  
//println (angle/17);
float y=angle/130*sin(radians(angle));
fill (flag,100,100,random (15));
stroke (flag,100,100,random (15));
strokeWeight (random(15));
flag+=FlagDir;  
//angle+=angDir;  

//ellipse (x+width/2,y+height/2,x,y);
ellipse (x+width/2,y+height/2,20,20);
 rad+=.75;
 angle+=22.5;
 fill (0,0,100,100);
star(5, x+width/2,y+height/2,5, 0.50);  
//stern++;
//println(rainbow);
//println(rad);
       //  if (stern>5){
        //  strDir=-1;
     //    }
  //        if (flag<3){
      //     strDir=1;
      //    fill (360,100,100,100);
     //    }
          if (flag>360){
          FlagDir=-1;
         }
          if (flag<-30){
           FlagDir=1;
          fill (360,100,100,100);
          }
          
         //       if (angle>1000){
         //       angDir=-1;
         //    }
         //       if (angle<0){
         //      angDir=1;
         //      }          

if (mousePressed){
 fill (0,0,100,100);
 star(12, mouseX, mouseY, 19, .50);  

} 

}







//DO NOT DELETE THIS LINE: "void star" taken from processing.org/learning/anatomy/ (Thank you!! their star is much more "star-ish" than mine...)
void star(int n, float cx, float cy, float r, float proportion)
{
  star(n, cx, cy, 2.0 * r, 2.0 * r, 0.0, proportion);
}

void star(int n, float cx, float cy, float w, float h,
  float startAngle, float proportion)
{
  if (n > 2)
  {
    float angle = TWO_PI/ (2 *n);  // twice as many sides
    float dw; // draw width
    float dh; // draw height
    
    w = w / 2.0;
    h = h / 2.0;
    
    beginShape();
    for (int i = 0; i < 2 * n; i++)
    {
      dw = w;
      dh = h;
      if (i % 2 == 1) // for odd vertices, use short radius
      {
        dw = w * proportion;
        dh = h * proportion;
      }
      vertex(cx + dw * cos(startAngle + angle * i),
        cy + dh * sin(startAngle + angle * i));
    }
    endShape(CLOSE);

  }}

