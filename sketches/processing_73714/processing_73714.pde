
//1003 2012 Hanbyul Jo
// I just picked this sentence from http://amnonp5.wordpress.com/ for no reason. 

String str =
"What if you want a 2D background behind a 3D sketch? Or put a 2D display on top of a 3D sketch? If you try to do this, you will quickly find that the 3D settings make your life difficult. The solution is to reset everything to basic 2D temporarily by placing the necessary code at the beginning or end of the draw loop() respectively. Different situations, will require slightly different solutions. But useful techniques are disabling the depth test with hint, resetting the camera(), turning off the lights, and sometimes using pushMatrix and popMatrix. Check out the following non-runnable code snippet.";
//Word[] words;
Alphabet[] als;

float dp = 0.57;

void setup() {

  size(600, 600);

  textAlign(CENTER);

  als = new Alphabet[str.length()];


  float textL = 0;

  for (int i=0; i<str.length(); i++) {  


    char tempC = str.charAt(i);
    float tempW = textWidth(tempC);
    float n = (tempW/(dp*(i+1)));      // Be careful with devider, it sould not be 0.

    //send charcter to be desplayed, totla Length of the string, and the point of this charcter as arguments.
    als[i] = new Alphabet(str.charAt(i), textL, -dp*i);

    textL +=n;
  }
}



void draw() {

  background(255);

  for (int i=0; i< als.length; i++) {  
    als[i].draw();
  }
}

class Alphabet{

 float x;
 float y;
 float a;
 float d;
 float dP;
 float size;
 int i;
 float textL;
 char c;
  
 
 Alphabet( char c,float a,float d ){
  
   this.x = width/2;
   this.y = height/2;
   this.c = c;
   this.a = a;
   this.d = d;
   this. i = i;
   this.size= random(13,20);
  //println(
  
 }

 void draw(){
  
   move();

   pushMatrix();
   //spiral movement
   translate(x+d*cos(a),y+d*sin(a));
   rotate(a+PI/2);
  if( d>10)   {   textSize(size); fill(0);text(c,0,0);}
   popMatrix();
 
 }
 
 void move(){
 
   if(abs(d-0)<0.5) d+=1;
   d+=dp;
   a+=0.01;
   
   
 }
    
  
}
