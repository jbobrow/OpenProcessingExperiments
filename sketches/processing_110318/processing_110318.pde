
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

 import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim minim;
AudioInput in;
BeatDetect beat;
float eRadius;

void setup()
{
    size( displayWidth, displayHeight );
    
    
    minim = new Minim( this );
    
    in = minim.getLineIn( Minim.STEREO,520);
    
     beat = new BeatDetect();
  
  
  eRadius = 20;
 

    background(1000);
   
   
}

boolean sketchFullScreen() {
  return true;
}
void draw()
{


        fill(random  (1)*random (0)*log (random (1)), random (100)*random (3)+random (200),random (-10)*random (-10)+ random (10));
    
    
    rect( 0, 0, width, height);
    
    fill(random (255),255-random (255),random (250));
        
         float r = 2.;
    for ( int i = 1; i < in.bufferSize(); i++ ) {
        r += -sin( in.mix.get( i ) + tan(in.mix.get( i ))-0.0000009 ) *2* (sq( in.mix.get( i ))+sin (sq (exp( in.mix.get( i )))));
  colorMode(HSB, random (350/log(random (r))+sin (i*i))+height, random (100/r)- random (sq (r/10))/ height, random (i/50,100)+height/700);

float v =sin( in.mix.get( i ));
stroke( random (200),random(100%v), random(20*i),random(r) );

  }

    
    stroke(r+r,r,r*r*5);   
fill(random (255),random (255),random (255));
ambient(100*r,100,100);
rect(0,850/(r+(r/10)),width,height/random(200*log(r-1)));

stroke(r,r,r*r);   
fill(random (223+log (r-10)),255,255,50+(r*6));
ambient(100*r,100,100);
rect(0,850/(r+(r/10)),width,height/random(100*log (r-1)));


stroke(random (r*100),r,r*r);   
fill(random (223+ (r-10)),random(255),255,random (50+(r*6)));
ambient(100*r,100,100);
rect(0,850/random(r+(r/10)),width,height/random(100*log (r-1)));


    ellipse( width/2, height/2, r*r, r*r/ (atan (r/(-1))));
    
     


fill(89+r,140-r,r+r*r);
    ellipse( width/2, height/2, r*((r+r)/(atan (r))), sq(r+100)/ (cos (log(r)/(-2))));
    
    strokeCap(ROUND);
    strokeWeight(abs (r)/abs (sin(r)));
    stroke(100,r);
    
    fill(255,abs ((r*100)-r),r * tan (abs(r*r))); // secpnd flash
    ellipse( width/2, height/4.05, r*100, -r);// second flash
    
    fill(255,abs (r),10/10 * tan (abs(r)));
    ellipse( width/2, height/4, r*100+ sqrt(r), -r);
    
    ellipse( width/2, (height)-(tan(11+r)), r*100, -r); //new neon
    
ellipse( width/2, height/(0.005+ ceil (r)), r*100, r);


    
    fill( random (abs (r)*r),  (abs(r)*20),abs (r)*10);
    ellipse( width/2, height/4, 10+r/ ( (0.65*r/(1%r))), (r*r*0.05)%r);
    stroke(200,r-50,r*r);
    
    
   fill (HSB,sqrt (abs (r)),r*r,r*r*r);
    stroke(abs (100-r),r*r,floor (r)/3);
    
    ellipse( width/2, height/2,  sq(exp (ceil (r)))+r, atan2(r*r,r-100) + cos ((tan(r))));
   ellipse( width/2, height/2, r%abs(r), abs(r)/ (tan (cos(r)/(-0.5))));
       
  
 ellipse( width/2, height/2, r%abs(r), abs(r)/ (tan (atan(r)/(-2))));
 
 ellipse( width/2, height/2, r+abs(r), abs(r)* (tan (atan(r)/(-0.25))));
 
   
    ellipse( (width/2)-4, height/sin (1.5-r), r/ ( (r/(-1))), atan(r*150));
    
    ellipse( (width/2)-4, height/tan (1.5+r), r/ ( (r/(-1))), r*55);
    
    ellipse( (width/2)-3, height/(3-r), r/ ( (r/(-1))), r/10);
  
    
    ellipse( (width/2), height/(1.5-r), (r*0.005)/ ( (r/(-1))), r*0.09);

    ellipse( (width/2)+3, height/(3-r), r/ ( (r/(-1))), r/10);
    
    ellipse( (width/2)+3, height/sqrt (r), log (r+ ( (r/(-1)))), r*sqrt(r));
    
    ellipse( (width/2)+4, height/sin (1.5-r), r/ ( (r/(-1))), atan(r*150));
    
    fill ((ceil (r+190)),255,r*r*r* exp (r));
    stroke(230,100,r*r*r*r*tan(r));
    ellipse( width/2, height/(-r), r%abs(sqrt(r/1000000000-(r*r*r*r*r*r*r*r)%r)),sqrt (abs ((r/100000)+sqrt(-r/r*1%r)))/ (abs(r)/(-1)));
 
    ellipse( width/2, height/2, r*abs((r+r)/500), exp(r)/ (cos (abs(r)/(-10))));
    

   fill(HSB,255,100*r,0);
   ellipse( width/2, height/tan(-r), r+100, +r);
    fill( r,  (abs(r)*209.25), 255);
   
   ellipse( (width/2)-7, height/(1.2+abs (r)), r/  ( (r/(sin (r)))), ((width + height)/(r*10)));

  

ellipse( (width/2)-99, height/(1.2+abs (r)), r/ ( (r/(-1))), width/(r*15));
ellipse( (width/2)-99, height/(0.1+abs (r)), exp (r)/ ( (r/(-1))), log (width)/(r));    
    ellipse( (width/2)+7, height/(1.2+ abs (r)), r/ ( (r/(sin (r)))), ((width+height) /(r*10)));
    
   

ellipse( (width/2)+99, height/(1.2+abs (r)), r/ ( (r/(-1))), width/(r*15)); 
ellipse( (width/2)+99, height/(0.1+abs (r)), exp(r)/ ( (r/(-1))),log  (width)/(r)); 
        
 

  
  
  float a = map(eRadius*r*r, 100* ceil (r), sqrt (r), eRadius, r%r);
  fill(random (r*a), sqrt (r), tan (a*r), tan (r));
  if ( beat.isOnset() ) eRadius = r;
  ellipse(width/2, (height/2)-100/r, 0.5+ (eRadius*r/100+a), -tan (eRadius%r));
  eRadius *= 0.1;
  if (( eRadius < 20 ) || (eRadius>0)) eRadius = r;
 
  ellipse( (width/2)-90, height/(1.2+abs (r+a)), r/  ( (r/(-1))), width/(r*10+a*a));
   ellipse( (width/2)+ 90, height/(1.2+abs (r+a)), r/ ( (r/(-1))), width/(r*10+a*a));



fill (255,255,tan (a*a*r));
stroke (255,r*0.100/a%r,a* (a%r));
ellipse( (width/2)+45, height/3, ((a))/  ( (a/(-1))), width/3/(r*3.5+a*a%r));
ellipse( (width/2)+50, height/3, ((a))/  ( (a/(-1))), width/3/(r*4+a*a%r));
ellipse( (width/2)+55, height/3, ((a))/  ( (a/(-1))), width/3/(r*4.5+a*a%r));
rect( (width/2)+95, height/3, ((a))/  ( cos(r%a/(-20))), width/4/(r-a-a%r));

ellipse( (width/2)-45, height/3, ((a))/  ( (a/(-1))), width/3/(r*3.5+a*a%r));
ellipse( (width/2)-50, height/3, ((a))/  ( (a/(-1))), width/3/(r*4+a*a%r));
ellipse( (width/2)-55, height/3, ((a))/  ( (a/(-1))), width/3/(r*4.5+a*a%r));
rect( (width/2)-95, height/3, ((a))/  (-cos(r%a/(-20))), width/4/(r-a-a%r));





stroke(a*r+10,r*r*10,tan (r*a+r));
fill((a*8)+r*2,r*3,200-a);

//new grpund
stroke(random (200+a),a+r*10,random (255-r));   
fill(HSB,55+a+r,a*r*r+4,random (255-r));
arc (width/2,(height/2),1200*a+r-PI,1200*a+r-PI,QUARTER_PI /log (sq (a) * -( sq (r))),PI/(asin (r)/sin (sqrt((r)*0.55))));  
        


stroke(200+a,20-r+a,255-r);   
fill(255,255,80-a* tan (r+a));
arc (width/2,(height/2),r*r*r*r*r*2,r*r*r*r*r*2,sin (log (sq (a)) * -( sq (r))),QUARTER_PI/(asin (r)/sin (sqrt((r)*0.05))));  


 fill(r*a*3,200+a,ceil (r*r*a*a/10));  
     arc (width/2,(height/2),150*(a+sq (r))*r,150*(a+sq (r))*r,PI*TWO_PI*(r/a),random (-QUARTER_PI)/((1+a)*0.1));

stroke(a+231,a*10,108 +sin (r+a));    
fill(190+a,200-a,a*a*a+78);    
arc (width/2,(height/2),floor (600/exp(r)),-TWO_PI +floor (600/exp(r)),PI*r/(a /atan (QUARTER_PI)),-QUARTER_PI/(exp(r+100)));


stroke(r+r+90,a*r*r+67, (r*a));   
fill(HSB,0,10,200+a);
arc (width/2,(height/2),200*r,200*r,-PI*PI*(cos(-r-a)),QUARTER_PI/sin(r/a));

 fill(r*a,200+a,ceil (r*r*a/100));  
     arc (width/2,(height/2),150*(a+sq (r))*r,150*(a+sq (r))*r,TWO_PI*(r/a),QUARTER_PI/(a*0.1));

stroke(a*a*r+100,a*10,atan (r+a));    
fill(190-a,200-a,r*a*a*a+78);    
arc (width/2,(height/2),220*r,220*r,r+(a /atan (QUARTER_PI)),-QUARTER_PI/(exp(r+100)));


stroke(r+r+100,a+r*30, (r+a)*2);   
fill(10+a,20-a,180); 
arc (width/2,(height/2),100*a,100*a,(PI)*QUARTER_PI*(log(a+ cos (a))),-QUARTER_PI/log(r/a));

 //exp blak
stroke(20+a,a+r*100,255-r);   
fill(200-(a*3),ceil (255/r),random (255));
arc (width/2,(height/2),1250*a,1250*a,-QUARTER_PI *log (sq (a) * -( sq (r))),a-PI/(asin (r)/sin (sqrt((r)*0.55))));  

// new arcs

stroke(a*r+10,r*r*10,tan (r*a+r));
fill((a*8)+r*2,r*3,200-a);
    arc ((width/2)-250,(height/4)+100,250+(a*r),250+(a*r),PI*(a*r),-PI/(a));

stroke(a*r*10,r*r*10,atan (r*a+r));
fill((a*8)-r*2,r*3,200-a);
    arc ((width/2)-250,(height/4)+100,250+sq(a+r),250+sq(a+r),QUARTER_PI*(a*r),-TWO_PI/(a));
    
    
stroke(a*a*r,a*10,sin (r/a));    
fill(190-a,200-a,r*a*a*a+78);    
arc ((width/2)-250,(height/4)+100,220*(r),220*(r),r/(a*PI), PI/(r+100));

stroke(255,cos(a)*cos(r),(r*a*2));   
fill(30+a,a*a,r*r*r-a);
arc ((width/2)-250,(height/4)+100,190,190,r/(a%100),-PI/(r-100));

stroke(0,a*r*r,sqrt (r*a));   
fill(a,a*a*a*a-r,100);
arc ((width/2)-250,(height/4)+100,160,160,-TWO_PI*(-r-a),-PI/(r-a));

stroke(sin (a),a+r,cos (r*a));   
fill(r+r+r,a*r+245,r*r+100);
arc ((width/2)-250,(height/4)+100,130,130,-r*sqrt(a*r),PI/(r* tan (r)/(2+a)));
   

  
// stroke(200,r*a,255);   
//fill(5*a,a*r*r+4,200-r,80+a-r);  
 // ellipse( (width/2)-250, height/exp (sq (ceil (a/r-r))), exp(r)/ ( (r/(-1))),log  (width+height)/(tan (a))/r); 

stroke(sin (a),a+r*a*r*100,cos (r*a*log (a)));   
fill(25-r,255-r,255+a);
arc ((width/2)-250,(height/4)+100,(180*a)/r,(180*a)/r,PI/a,-TWO_PI/(r* tan (r)/100));
   
stroke(25+a,r*r*r*cos(r),255,90+a);   
fill(255,a*r+200,255);
arc ((width/2)-250,(height/4)+100,100,100,a*r,-PI*(cos (r)+sin (sqrt((r)*0.25))));   

stroke(200,a*10000,255);   
fill(55+a+r,a*r*r+4,200-r,80+a*ceil (r));
arc ((width/2)-250,(height/4)+100,1200*a,1200*a,sq (a) * sq (r),TWO_PI/(asin (r)/sin (sqrt((r)*0.55))));  
 
 stroke(sin (a),a+r,cos (r*a));   
fill(r+r+r,a*r+245,r*r+100);
arc ((width/2)+250,(height/4)+100,130-random(r),130- random (r),-r*sqrt(a*r),PI/(r* tan (r)/(2+a)));
   

 //new arcs 2
 
stroke(a*r+10,r*r*10,tan (r*a+r));
fill((a*8)+r*2,r*3,200-a);
    arc ((width/2)+250,(height/4)+100,250+(a*r),250+(a*r),PI*(a*r),-PI/(a));

stroke(a*r*10,r*r*10,atan (r*a+r));
fill((a*8)-r*2,r*3,200-a);
    arc ((width/2)+250,(height/4)+100,250+sq(a+r),250+sq(a+r),QUARTER_PI*(a*r),-TWO_PI/(a));
    
stroke(a*a*r,a*10,sin (r/a));    
fill(190-a,200-a,r*a*a*a+78);    
arc ((width/2)+250,(height/4)+100,220*r,220*r,r/(a*PI), PI/(r+100));

stroke(255,cos(a)*cos(r),(r*a*2));   
fill(30+a,a*a,r*r*r-a);
arc ((width/2)+250,(height/4)+100,190,190,r/(a%100),-PI/(r-100));

stroke(0,a*r*r,sqrt (r*a));   
fill(a,a*a*a*a-r,100);
arc ((width/2)+250,(height/4)+100,160,160,-TWO_PI*(-r-a),-PI/(r-a));

stroke(sin (a),a+r,cos (r*a));   
fill(r+r+r,a*r+245,r*r+100);
arc ((width/2)+250,(height/4)+100,130,130,-r*sqrt(a*r),PI/(r* tan (r)/(2+a)));
   

  
// stroke(200,r*a,255);   
//fill(5*a,a*r*r+4,200-r,80+a-r);  
 // ellipse( (width/2)-250, height/exp (sq (ceil (a/r-r))), exp(r)/ ( (r/(-1))),log  (width+height)/(tan (a))/r); 

stroke(sin (a),a+r*a*r*100,cos (r*a*log (a)));   
fill(25-r,255-r,255+a);
arc ((width/2)+250,(height/4)+100,(180*a)/r,(180*a)/r,PI/a,-TWO_PI/(r* tan (r)/100));
   
stroke(25+a,r*r*r*cos(r),255,90+a);   
fill(255,a*r+200,255);
arc ((width/2)+250,(height/4)+100,100,100,a*r,-PI*(cos (r)+sin (sqrt((r)*0.25))));   

stroke(200,a*10000,255);   
fill(55+a+r,a*r*r+4,200-r,80+a*ceil (r));
arc ((width/2)+250,(height/4)+100,1200*a,1200*a,sq (a) * sq (r),TWO_PI/(asin (r)/sin (sqrt((r)*0.55))));  
 
 
 // arc center
 
 fill(19+a,200-a,r*r*a*a-100);  
     arc (width/2,(height/4),150*(a+r)*r,150*(a+r)*r,TWO_PI*(r/a),QUARTER_PI/(a*0.1));

stroke(a*a*r+100,a*10,sin (r/a));    
fill(190-a,200-a,r*a*a*a+78);    
arc (width/2,(height/4),random (220*r),random (220*r),r/(a+ atan (QUARTER_PI)),QUARTER_PI/(r+100));

stroke(255,cos(a)*cos(r),(r*a*2));   
fill(30+a,a*a,r*r*r-a);
arc (width/2,(height/4),190,190,(a+r)/(a),-PI/(r-100));

stroke(0,a*r*r,sqrt (r*a));   
fill(a,a*a*a*a-r,100);
arc (width/2,(height/4),160*r,160*r,-TWO_PI*(-r-a),QUARTER_PI/(r-a));

stroke(sin (a)+r,a+r,cos (r*a)+r);   
fill(r+r+r+sq (a),a*r+245,r*r+100);
arc (width/2,(height/4),130,130,-r*sqrt(a*r),PI/(r* tan (r)/(2+a)));
   

  //black

stroke(floor (sq (a+r)),r*r*r*sq(r),125,90+a);   
fill(a+20,r+10,a+50,60+a);
arc ((width/2),(height/2),300+(a*a*r)/exp (random(a)),300+(a*a*r)/exp (random(a)),a*(r+r+r),PI/(r* tan (r-a)/175));   

//===
 
 
 stroke(200,r*a,255);   
fill(5*a,a*r*r+4,200-r,80+a-r);  
 ellipse( width/2, height/exp (sq (ceil (a/r-r))),QUARTER_PI * exp(r)/ ( (r/(-1))),QUARTER_PI*log  (width+height)/(tan (a))/r); 

stroke(sin (a),a+r*a*r*100,cos (r*a*log (random (a+a))));   
fill(25-r,255-r,255+a);
arc (width/2,(height/4),(180*a)/r,(180*a)/r,QUARTER_PI/a,PI/(r* tan (r-a)/100));
   
stroke(a+155,a/r*r+log(r),5*r,90+a);   
fill(255,r*r,r*a,100-a);
arc (width/2,(height/4),250-a+r,250-a+r,a/QUARTER_PI,-PI/(cos (r)+ QUARTER_PI * sin (sqrt((r)*100))));   

stroke(200+a,a*10000,255-r);   
fill(random (55+a+r)+r,a*r*r+4,200-r,80+a*ceil (r+a));
arc (width/2,(height/4),1200*a+r,1200*a+r,log (sq (a) * -( sq (r))),QUARTER_PI/(asin (r)/sin (sqrt((r)*0.55))));  

stroke(200+a,20-r,255-r);   
fill(255,0,80+a* tan (r+a));
arc (width/2,(height/4),r*r*r*r*r,r*r*r*r*r,log (sq (a) * -( sq (r))),QUARTER_PI/(asin (r)/sin (sqrt((r)*0.05))));  

//center 2

arc (width/2,(height/4),150*(a+r)*r,150*(a+r)*r,TWO_PI*(r/random (a)),QUARTER_PI/(a*0.1));

stroke(a*a*r+100,a*10,sin (r/a));    
fill(190-a,200-a,r*a*a*a+78);    
arc (width/2,(height/4),220*r,220*r,r/(a+ atan (QUARTER_PI)),QUARTER_PI/(r+100));

stroke(255,cos(a)*cos(r),(r*a*2));   
fill(30+a,a*a,r*r*r-a);
arc (width/2,(height/4),190,190,(a+r)/random(a),-PI/(r-100));

stroke(0,a*r*r,sqrt (r*a));   
fill(a,a*a*a*a-r,100);
arc (width/2,(height/4),160*r,160*r,-TWO_PI*(-r-a),QUARTER_PI/random(a-r));

stroke(sin (a)+r,random (a+r),cos (r*a)+r);   
fill(r+r+r+sq (a),a*r+245,r*r+100);
arc (width/2,(height/4),130,130,-r*sqrt(a*r),PI/(r* tan (r)/(1/random (a/r))));
   

  //black

stroke(floor (sq (a+r)),r*r*r*sq(r),125,90+a);   
fill(random (a+20),r+10,a+50,random (60+a));
arc ((width/2),(height/2),300+(a*a*r)/exp (a),300+(a*a*r)/exp (a),a*(r+r+r),random (PI)/(r* tan (r-a)/random (175)));   

//===
 
 
 stroke(200,random (r*a),random (255));   
fill(5*a,a*r*r+4,200-r,80+a-r);  
 ellipse( width/2, height/exp (sq (ceil (a/r-r))),QUARTER_PI * exp(r)/ ( (r/(-1))),QUARTER_PI*log  (width+height)/(tan (a))/r); 

stroke(sin (a),a+r*a*r*100,cos (r*a*log (a)));   
fill(random (25-r),255-r,255+a);
arc (width/2,(height/4),(180* random (a+a))/r,(180*random (a+a))/r,QUARTER_PI/a,PI/random (r* tan (r-a)/100));
   
stroke(a+155,a/r*r+log(r),5*r,90+a);   
fill(255,r*r,r*a,100-a);
arc (width/2,(height/4),250-a+r,250-a+r,a/QUARTER_PI,-PI/(cos (r)+ QUARTER_PI * sin (sqrt((r)*100))));   

stroke(200+a,a*10000,random (255-r));   
fill(55+a+r,a*r*r+4,200-r,80+a*ceil (r+a));
arc (width/2,(height/4),1200*a+r,1200*a+r,log (sq (a) * -( sq (random(r)))),QUARTER_PI/(asin (r)/sin (sqrt(random(r)*0.55))));  

stroke(200+a,20-r,255-r);   
fill(random (255),random (a+r),80+a* tan (r+a));
arc (width/2,(height/4),random (r*r*r*r*r),random (r*r*r*r*r),log (sq (a) * -( sq (r))),random (PI)/(asin (r)/sin (sqrt((r)*0.05))));  



  }


void stop()
{
    in.close();
    minim.stop();
    super.stop();
}



