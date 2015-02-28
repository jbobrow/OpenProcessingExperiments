


//********** RANDOM CHAIR PROFILE GENERATOR *****************


PFont f; //declair font
float b; // variable for backrest ScSz
float l; // variable for leg ScSz
float t;  // variable for thickness
int ScSz = 500;
float [][] Chairs =  { {ScSz*0.25,ScSz*0.25},{ScSz*0.5,ScSz*0.25},{ScSz*0.75,ScSz*0.25},
             {ScSz*0.25,ScSz*0.5},{ScSz*0.5,ScSz*0.5},{ScSz*0.75,ScSz*0.5},
             {ScSz*0.25,ScSz*0.75},{ScSz*0.5,ScSz*0.75},{ScSz*0.75,ScSz*0.75} } ;


void setup (){
  size(500,500);
  frameRate(1); // turn this on, and the no loop off if you want it to keep generating chairs.
  smooth();
  stroke(0);
  f = loadFont ("ArialMT-11.vlw"); // load font 
    
}  
void draw (){
  background(255);
   text ("Press 'r' to Regenerate Chairs", 10,10);
  
  
  for(int i = 0; i < 9; i++){
    l = random(10,height*0.08);
    b = random (-(height*0.08),(height*0.08));
    t = random (1,6);  
    chair(b,l,t,Chairs[i][0],Chairs[i][1]);
    //ellipse(Chairs[i][0],Chairs[i][1],10,10);
  }
  
 // noLoop();
}
 
 void keyPressed () { 
  if (key == 'r') {
    background(255);
    redraw();
    
  }
}
  
  
void chair (float b, float l, float t, float x, float y) {
  float leg;
  float seat;
  seat = random(10,(width*0.08));
  
  strokeWeight(t);

 pushMatrix();
    translate (x,y);
     // seat
     
       line(-seat,0,seat,0);
     //legs
         leg = l*(random(0.15,0.4));
       beginShape(LINES);
         
            vertex (-seat,0);
            vertex (-seat-leg,l);
            vertex (seat,0);
            vertex (seat+leg,l);
      
     // BACK REST 
       if(b>0){
         line(seat,0,seat+b*(random(0.15,0.4)),-b);
       }
       if(b<0) {
         line(-seat,0,-seat+(random(0.15,0.4)),b);
       }
     
  popMatrix ();
}

