

//3 pink circles are seconds
//biggest green clock is hour- this is the only one with numbers 
// left green-blue clock is the only minute clock, changes colors as minute passes by
//out of the two white outline circles going around, 
          //one is minute (goes around the whole page), and one is second (goes around the bottom left corner)
          
//there are three second clocks for visual stimulation


int s;
int m;
int h;
int totalpoints=20;
int [] x= new int [totalpoints];
int []y= new int [totalpoints];


void setup () {
  size (800,800);
  smooth ();
   s= second ();
   m= minute ();
   h= hour ();
   frameRate (50);
   
}
   

void draw () {
  background (#D8CAB8);
  s= second ();
  m= minute ();
  h= hour ();
  
  
   
 
 pushMatrix (); // lower left minuteclock 
 translate (300, height-300);
 float hourcolor= map (s, 0,300,0, width);
 fill (0, hourcolor, 63);
 ellipse (30, -350, 10+h*20, 10+h*20);
 fill (0);
 stroke (100);
 textAlign (CENTER, CENTER);

 text (h,30,-350);
 noFill ();
 rotate (radians (m*2));

 popMatrix ();
 
 
 
 
 
  pushMatrix (); //biggest hour clock 
  translate (100, height-100);
    float minutecolor = map (s,0,100,0,width );
  fill(0, minutecolor, 140);
  ellipse (0,-250, 10+m*3, 10+m*3);
  fill (0);
  stroke (250);
 
  noFill();
  rotate (radians (s*2));
  ellipse(0,-250,50,50); 
 
  popMatrix ();
  
  
  
  pushMatrix (); // white secondclock circle on bottom right corner
  translate (width/2, height/2);
  fill (222+s, 0,0,63);
  ellipse (200,200, 10+s*5, 10+s*5);
  fill (20);
  stroke (250);
  rotate (radians (s*8));
  popMatrix ();
  
  
  
  pushMatrix (); //center secondclock
  translate (width/2, height/2);
fill (210+m, 0,0, 30);
ellipse (0,0,10+s*1, 10+s*1);
fill (0);
stroke (250);
noFill();
rotate (radians (s*2));
popMatrix();


  pushMatrix (); //top right orange secondclock
  translate (width/2, height/2);
  fill(255+s, 0,0, 63);
  ellipse (200,-150, 10+s*3, 10+s*3);
  fill (0);
  stroke (250);

  noFill();
  rotate (radians (m*6)); 
  

  ellipse(200,-150,50,50); //moves around the whole canvas draws a circle as minutes pass by
  popMatrix ();

}

