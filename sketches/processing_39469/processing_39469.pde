
//homework 6
// Copyright Paul Bracchitta September 2011 Pittsburgh, PA 15289


float x, y, wd, ht;

void setup() {
  
size( 400, 400);
background(0,0,0);
smooth();
strokeWeight(4);
x = 200;
y = 200;
wd = x + 150;
ht = y + 150;

frameRate(30);
ellipseMode(CENTER);
}

void draw() {
  background(0);
  fill(0);
  
  x = 400;
  y = 400;
  initials(x,y,wd,ht);
  //   while ( x > 50) {
       while ( x >= 50) {
        // if ( x <= 0 )
       //  {
         // x = 0;
          //y = 0;
        // x = x + 50;
        // y = y + 50; 
       //  }
   
     //while ( x > 0)
  //{   
       initials (x,y,wd,ht);
  // initials (x,y,wd,ht);
  // initials (x,y,wd,ht);
  // initials (x,y,wd,ht);
   x = x - 50;
   y = y - 50;
   wd = x;
   ht = y;
   
//   while ( x <= width)
//   {
//     
//     initials ( x, y, wd, ht);
//     x = x - 50;
//     y = y - 50;
//     wd = x;
//     ht = y;
//     
//   }
  //} 
   }
    
   
}  
  

void initials (float x, float y, float wd, float ht) {

  fill(0);
  ellipse(x,y,wd,ht);
  stroke(255);
  ellipse(x, y, wd, ht);

//guidelines:
strokeWeight(1);
noFill();
ellipse(x, y, .9*wd, ht); //vertical
ellipse(x, y, .8*wd, ht);
ellipse(x, y, .7*wd, ht);
ellipse(x, y, .6*wd, ht);
ellipse(x, y, .5*wd, ht);
ellipse(x, y, .4*wd, ht);
ellipse(x, y, .3*wd, ht);
ellipse(x, y, .2*wd, ht);
ellipse(x, y, .1*wd, ht);
line(x, y-(ht/2), x, y+(ht/2));
ellipse(x, y, wd, .9*ht); //horizontal
ellipse(x, y, wd, .8*ht);
ellipse(x, y, wd, .7*ht);
ellipse(x, y, wd, .6*ht);
ellipse(x, y, wd, .5*ht);
ellipse(x, y, wd, .4*ht);
ellipse(x, y, wd, .3*ht);
ellipse(x, y, wd, .2*ht);
ellipse(x, y, wd, .1*ht);
line(x-(wd/2), y, x+(wd/2), y);
// end guidlines

strokeWeight(x/50);
stroke(145,10,0);
//Begin P
beginShape();
  //point(x-100,y+120);
  //point(x-137, y+86);
  //point(x-110, y+108);
  
  //point(x-158, y);
  //point(x-140,y);
  
  //point(x-137,y-86);
  //point(x-110,y-108);
  
  //point(x-119,y+114);
  //point(x-90,y+134);
  //point(x-90,y-134);
  //point(x-119,y-114);
  
  curveVertex(x-.68*(wd/2),y+.651428*(ht/2));
  curveVertex(x-.78285*(wd/2),y+.49142857*(ht/2));
  curveVertex(x-.9028*(wd/2),y);
  curveVertex(x-.78285*(wd/2),y-.49142857*(ht/2));
  curveVertex(x-.68*(wd/2),y-.651428*(ht/2));
endShape(); //end of left leg

beginShape();
  curveVertex(x-.5142857*(wd/2),y+.765714*(ht/2));
  curveVertex(x-.6285714*(wd/2),y+.6171428571*(ht/2));
  curveVertex(x-.8*(wd/2),y);
  curveVertex(x-.6285714*(wd/2),y-.6171428571*(ht/2));
  curveVertex(x-.5142857*(wd/2),y-.765714*(ht/2));
endShape(); // end of right leg P

line(x-.6285714*(wd/2),y+.61714285*(ht/2),x-.78285714*(wd/2),y+.4914*(ht/2));
line(x-.6285714*(wd/2),y-.61714285*(ht/2),x-.78285714*(wd/2),y-.4914*(ht/2));
 bezier(x-.6285714*(wd/2),y-.61714285*(ht/2),x-.3142*(wd/2),y-.3142*(ht/2),x-.1142*(wd/2),y-.1142*(ht/2),x-.8*(wd/2),y);
 
//end P

strokeWeight(x/40);
stroke(23,63,145);
//begin A
beginShape();
  curveVertex(x+.2857*(wd/2),y+1.0857*(ht/2));
  curveVertex(x-.0857*(wd/2),y+.9714*(ht/2));
  curveVertex(x-.22857*(wd/2),y);
  curveVertex(x,y-.9714*(ht/2));
  curveVertex(x+.2857*(wd/2),y-1*(ht/2));
endShape(); // left leg A

beginShape();
  curveVertex(x-.2857*(wd/2),y+1.0857*(ht/2));
  curveVertex(x+.0857*(wd/2),y+.9714*(ht/2));
  curveVertex(x+.22857*(wd/2),y);
  curveVertex(x,y-.9714*(ht/2));
  curveVertex(x-.2857*(wd/2),y-1*(ht/2));
endShape(); //right leg A

beginShape();
  curveVertex(x-.5714*(wd/2),y);
  curveVertex(x-.22857*(wd/2),y);
  curveVertex(x+.22857*(wd/2),y);
  curveVertex(x+.5714*(wd/2),y);
endShape(); //end A

stroke(212,187,0);
strokeWeight(x/50);
beginShape();
  curveVertex(x,y-1*(ht/2));
  curveVertex(x+.4*(wd/2),y-.74285*(ht/2));
  curveVertex(x+.6*(wd/2),y);
  curveVertex(x+.4*(wd/2),y+.74286*(ht/2));
  curveVertex(x,y+1*(ht/2));
endShape();//end left leg B

line(x+.4*(wd/2),y+.7428*(ht/2),x+.5714*(wd/2),y+.6171*(ht/2));
line(x+.4*(wd/2),y-.7428*(ht/2),x+.5714*(wd/2),y-.6171*(ht/2));

beginShape();
  curveVertex(x+.1714*(wd/2),y-1*(ht/2));
  curveVertex(x+.5714*(wd/2),y-.6171*(ht/2));
  curveVertex(x+.71428*(wd/2),y);
  curveVertex(x+.5714*(wd/2),y+.6171*(ht/2));
  curveVertex(x+.1714*(wd/2),y+1*(ht/2));
endShape(); //end right leg B

beginShape();
  curveVertex(x+.4*(wd/2),y+.742857*(ht/2));
  curveVertex(x+.5714*(wd/2),y+.6171*(ht/2));
  curveVertex(x+.8*(wd/2),y+.37714*(ht/2));
  curveVertex(x+.85714*(wd/2),y+.03428*(ht/2));
  curveVertex(x+.71428*(wd/2),y-.0857*(ht/2));
  curveVertex(x+.85714*(wd/2),y-.125714*(ht/2));
  curveVertex(x+.8*(wd/2),y-.3828*(ht/2));
  curveVertex(x+.5714*(wd/2),y-.6171*(ht/2));
  curveVertex(x,y-1*(ht/2));
endShape(); // end B curves

}
  
                
                
