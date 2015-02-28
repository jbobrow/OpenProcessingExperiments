


/**
* LAVALAMP Cube.
*
* This is a very early sketch of mine and the code is somewhat redundant
* (too many variables)
*/
 
////////////////////////////////////
float jet1,jet2,jet3,jet4,jet5;
float speedjet1,speedjet2,speedjet3,speedjet4,speedjet5;
float directionjet1;
///////////////////
float xmag, ymag = 0;
float newXmag, newYmag = 0; 
float x,y;
float amparo;
///////////////////////////////////
void setup() 
{ 
 size(600, 400,P3D);
 stroke(0,0,0,20);  
 colorMode(HSB,365,100,100,100); 
/////////////////////////
 jet1 = 500;                 
 jet2 = 300;
 jet3 = 50;
 jet4 = 70;
 jet5 = 200;
 ////////////////////
 speedjet1 =2.5;
 speedjet2 =2.5;
 speedjet3 =5;
 speedjet4 =7;
 speedjet5 =2;
 ////////////////////
 directionjet1 =1;
} 
void draw() 
{ 
 background(0,0,0,80); 
///////////////////////////////
 jet1 += speedjet1*directionjet1;                      
if(jet1>100){
  directionjet1 = -directionjet1;
}
if(jet1<20){
  directionjet1 = -directionjet1;
}
//////////
 jet2 -= speedjet2*directionjet1;                       
if(jet2<-10){
  directionjet1 = -directionjet1;
}
if(jet2>300){
  directionjet1 = -directionjet1;
}
//////////////
jet3 += speedjet1*directionjet1;                     
if(jet3>300){
  directionjet1 = -directionjet1;
}
if (jet3<10){
  directionjet1 = -directionjet1;
}
/////////////////////////
jet4 -= speedjet4*directionjet1;
if(jet4<-10){
  directionjet1 = -directionjet1;
}
if (jet4>300){
  directionjet1 = -directionjet1;
}
///////////////
jet5 -= speedjet5*directionjet1;                      
if(jet5<-10){
  directionjet1 = -directionjet1;
}
if(jet5>300){
  directionjet1 = -directionjet1;
}
//////////
amparo = 60; 
/////////////////////////////// 
 pushMatrix(); 
 x+=0.6;  //speed of spin
 y+=0.6;
 translate(width/2, height/2, -5); //width,height position the cube

 newXmag = x/float(width) * TWO_PI;
 newYmag = y/float(height) * TWO_PI;

 float diff = xmag-newXmag;
 if (abs(diff) >  0.01) { xmag -= diff/4.0; }

 diff = ymag-newYmag;
 if (abs(diff) >  0.01) { ymag -= diff/4.0; }

 rotateX(-ymag); 
 rotateY(-xmag); 
 /////////////////////////
 scale(amparo);//bigger makes larger cube. 120 is a decent value.
 beginShape(QUADS);
////////////////////////////////
 fill(jet1, 100, 100); vertex(-1,  1,  1);
 fill(jet3, 100, 100); vertex( 1,  1, 1);
 fill(jet2, 100, 100); vertex( 1, -1, 1);
 fill(jet4, 100, 100); vertex(-1, -1, 1);

 fill(jet5, 100, 100); vertex( 1,  1, 1);
 fill(jet1, 100, 100); vertex( 1,  1, -1);
 fill(jet3, 100,100); vertex( 1, -1, -1);
 fill(jet2, 100, 100); vertex( 1, -1, 1);

 fill(jet4, 100, 100); vertex( 1,  1, -1);
 fill(jet3, 100, 100); vertex(-1,  1, -1);
 fill(jet1, 100, 100); vertex(-1, -1, -1);
 fill(jet5, 100,100); vertex( 1, -1, -1);

 fill(jet3, 100, 100); vertex(-1,  1, -1);
 fill(jet5, 100, 100); vertex(-1,  1,  1);
 fill(jet4, 100, 100); vertex(-1, -1,  1);
 fill(jet1, 100, 100); vertex(-1, -1, -1);

 fill(jet2, 100, 100); vertex(-1,  1, -1);
 fill(jet4, 100, 100); vertex( 1,  1, -1);
 fill(jet5, 100, 100); vertex( 1,  1,  1);
 fill(jet3, 100, 100); vertex(-1,  1,  1);

 fill(jet5, 100, 100); vertex(-1, -1, -1);
 fill(jet3, 100, 100); vertex( 1, -1, -1);
 fill(jet4, 100, 100); vertex( 1, -1,  1);
 fill(jet1, 100, 100); vertex(-1, -1, 1);
 ///////////////
 endShape();
 popMatrix(); 
 
 println(frameCount);
 println(frameRate);
}
void stop()
{
  
}

