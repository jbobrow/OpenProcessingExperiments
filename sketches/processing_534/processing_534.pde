
//boolean sunSet=false;
float yW=0;
float speedW=0.2;

 //sky
 void dSky () {
 for (int i=0; i<height/4; i++) {
   stroke (0, 180+i/3,240-i/2);
   line (0,i,width,i);
  }
 }

 /* sun
 void dSun () {
 noStroke ();
 fill (255,0,0);
 ellipse (mouseX,60,40,40);
   
   if (sunSet) {
     fill(0,100);
     rect (width/2,height/2,width,height);
   }
 }
 
 void mousePressed() {
   if (mouseY>100) {
   sunSet = true;
   }
 }*/
 
 //shore
void dShore () {
 noStroke ();
 fill (240,220,190);
 rect (width/2, 10*height/16, width, 6*height/8);
}
  
 //sea
void dSea () {
  for (float k=4*height/16; k<=6*height/16-0.001; k++) {
   stroke (0, 100-k/20,240+k/20,255-k*1.5+22);
   line (0,k,width,k);
  }
}
 
 void dParasole () {
 // parasole
 strokeCap (ROUND);
 strokeWeight (3);
 stroke (120,60,0);
 line (75,185,102,290);
 noStroke ();
 fill (250,100,10);
 arc (88,240,100,100,11*PI/12,23*PI/12);
 fill (240,220,190);
 ellipse(52,255,25,25);
 ellipse(76,248,25,25);
 ellipse(104,241,25,25);
 ellipse(127,234,25,25);
}

