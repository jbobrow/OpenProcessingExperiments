
/// [x,y,z] = rossler(nSmp,x0,y0,z0,a,b,c,dt,dec)
//% nSmp = 100000;
//% -24 11
  float newX, newY, newZ;
  float x0,y0,z0;

float a=0.2;
float b=0.2; 
float c=5.7;

float Bstep=0.05;
int  nSmp = 800;
float dt=0.05;

float dec = -4; 
boolean keepReset= false;
boolean cancel =true;
background(0);
void setup()
{
    size(500*2, 500*2);
    strokeWeight(1);

  x0=0;
  y0=0;
  z0=0;
}
void draw()
{ 
   strokeWeight(0.3);
   if (cancel==true) {background(0,0,0); strokeWeight(1);}
  if ( keepReset==true) { x0=0; y0=0; z0=0;   } //background(150);
 // blendMode( EXCLUSION );

  float printX, printY, printZ ; 
  float[] x = new float[nSmp];
  float[] y = new float[nSmp];
  float[] z = new float[nSmp];
  x[1]= x0;  y[1]= y0; z[1]=z0;
 //for (float b=0; b<2; b=b+0.001 ) {
 a= map(mouseY, 0, height, 0,0.5); //random(0,1); //b+Bstep;
 b= map(mouseX, 0, width, 0,3); //random(0,1); //b+Bstep;
for ( int s = 2; s<nSmp; s++)
    {
    PVector  d= RosslerDelta (x[s-1],y[s-1],z[s-1]);
    PVector  now= RosslerNow (d, x[s-1],y[s-1],z[s-1]);
    x[s]=now.x;
    y[s]=now.y;
    z[s]=now.z;
   //   stroke(colorTrans( abs(now.x)/10+ a*d.x ), colorTrans( abs(now.y) +b*d.y), colorTrans(c*d.z), 5); //d.x, b. b*d.y// abs(x[s])/3 +
   stroke(colorTrans(d.x), colorTrans(d.y), colorTrans(d.z), 50 );
   line( printVal(x[s]) ,  printVal(y[s]) -height/5,  printVal(x[s-1]) , printVal(y[s-1])- height/5);
   line( printVal(x[s]),  printVal(z[s]  /5)  ,  printVal(x[s-1]), printVal(z[s-1] /5)  );
   line(   printVal( -z[s]  /5)- width/4 , printVal(y[s])-height/5,  printVal(- z[s-1] /5)-width/4 , printVal( y[s-1])-height/5 );
  // point( printVal(x[s]*2) , printVal(b*5) );

   }
   if (keepReset==false) {   x0=x[nSmp-1]; y0=y[nSmp-1]; z0=z[nSmp-1];}
}



float colorTrans(float dx){
// float ct =map( log(1+dx), 0, 4, 100,255);
 float  ct= 255-(dx)*50;
return ct;
}
float printVal(float val){
   //val = val +20*sin(val/5);
   val =val*height/50 + 3*height/5 ;
  return val;
}

PVector RosslerDelta (float x, float y, float z ){
    PVector d = new PVector();
    d.x = -y -z ;
    d.y = x +a*y ;
    d.z = b+z *(x -c);
    return d;
}

PVector RosslerNow ( PVector d, float x, float y, float z ){ 
     PVector now =new PVector();
    now.x = x+ dt* d.x ;
    now.y = y+ dt* d.y ;
    now.z = z+ dt* d.z ; 
    return now;
}
void mousePressed() {
  if (mouseButton ==LEFT){keepReset = !keepReset;};
  if (mouseButton ==RIGHT){ cancel = !cancel ; }
}


  //float          printOldX= (x[s-1]+2*cos(z[s-1])+2* sin(y[s-1])  )*magFactor+width/ 2.5;
  //float          printOldY= (y[s-1]+2*sin(z[s-1])+2* cos(x[s-1])  )*magFactor+height/2; 
  //float          printOldZ= (z[s-1]+2*sin(x[s-1])+2* sin(x[s-1])  )*magFactor+height/2; 
  //float          printNewX= (x[s]+2*cos(z[s])+2* cos(y[s]) )*magFactor+width/ 2.5;
  //float          printNewY= (y[s]+2*sin(z[s])+2* sin(x[s]) )*magFactor+height/2;
  //float          printNewZ= (z[s]+2*sin(x[s])+2* cos(x[s]) )*magFactor+height/2;
  //      stroke(map(sqrt(abs(dx)), 0, collim, 0,255), map(sqrt(abs(dy)), 0, collim+10, 0,255),map(newX,0,1 ,0,255), 3 ); //map(cos(frameCount/1000) , -1, 1, 0,255)
      //stroke(colorTrans(dx+1+sqrt(b)), colorTrans(dy+log(b)),colorTrans(dz+log(b)), 5 ); //map(cos(frameCount/1000) , -1, 1, 0,255)
      //line(printOldX, printOldY,printNewX, printNewY );
     // int roundedB= round(map(b ,0,6,0,width)); //+random(-0.5,0.5) );//round(map(log(1+b),0,5,0,width));
//            printY = printVal(y[s]);
//       printX = printVal(x[s]);
//       printZ = printVal(z[s]);

//   line( printVal(x[s]) ,  printVal(y[s]) -height/5,  printVal(x[s-1]) , printVal(y[s-1])- height/5);
//   //strokeWeight(1);   point( printVal(x[s]*2) , printVal(b*5) );
//   line( printVal(x[s]),  printVal(z[s]  /5)  ,  printVal(x[s-1]), printVal(z[s-1] /5)  );
//   line(   printVal( -z[s]  /5)- width/4 , printVal(y[s])-height/5,  printVal(- z[s-1] /5)-width/4 , printVal( y[s-1])-height/5 );

