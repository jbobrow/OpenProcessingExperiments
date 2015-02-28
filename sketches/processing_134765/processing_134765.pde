
// Patrick J. O'Donnel
// ART 3001 - Processing
// Feb 11h, 2014
// Project 1 
// "flock" v. 2.0

void setup() {
  size(1500,1000);
  background(253,245,230);
}

//changeable variables
//width and height of bird bounding box, sp(ace)X and sp(ace)Y, rep(etition) of birds, 
//prob(ability of deviance), r(ounding of flock), of(f) s(et),
float X = 25;
float Y = 15;
float spX = 3;
float spY = 9;
int rep = 30;
float prb = 15;
float r = 4;
float ofs = 2;


//custom variables
//t(ranslation)X, t(ranslation)Y, angle 1 & 2 (for rotation)
float tX = X+spX;
float tY = -Y/2-spY;
float angle = random(-r,r);
float angle2 = random(-r,r);


void draw() {
                 
                   
                   
//I. BIRDS

  // Ia. LESS THAN BIRDS (RIGHT SCREEN BIRDS)
                   
                   pushMatrix();
     
  //for loop: drawing less than birds up and to right
  for (int j = 0; j<=rep*2; j++) { 
    
    
                   pushMatrix(); 
                   
          //flock swoosh         
          rotate(degrees(0.0001*j/10*(sin(angle2))));
          translate(random(-ofs/10,ofs/10), random (-ofs/7,ofs/10));
          
   //for loop: drawing less than bird rows down and to right        
   for (int i = 0; i<=rep*2; i++) {
    
       //translate and rotate organic flow
      
          //flock swoosh
          rotate(degrees(0.00001*(i+0.1)*(sin(angle))));
       
     //if statement restricting to produce 1-brid-only defect; limits the drawing of 1st instane of bird() inside for loops
        float rando = random(100);
        float prb1 = (prb)/3;
        if (rando>prb1) {
          
      
      //bird X,Y is a less than sign, -X,-Y is a greater than sign, drawn at probability 100-prb3
      bird(X,Y);
      
        }
      //if clause for making 3rd bird defect
         pushMatrix();
         float rand = random(100);
      if (rand>100-prb) {
         
        // for loop to potetnailly repeat 3rd bird defect
         for (int k = 0; k<=rep; k++) {
           
           float rand2 = random(100);
           
             if (rand2>100-prb) {
               translate(0.7*tX,0);
               bird (X,Y);
             }
         }  
         
         
      }  
        popMatrix();
        
          //moves birds up and to the right
          translate(random(0.6,1)*tX,0.7*tY);
        
   }                
  
                   popMatrix();
        
        //copies rows of birds down and to the right
        translate(random(0.6,1)*tX,0.7*-tY);
        
 }
                   popMatrix();



  // Ib. DRAWING GREATER THAN BIRDS (LEFT BIRDS)

     
                   pushMatrix();
     
  //for loop: drawing less than birds up and to right
  for (int j = 0; j<=rep*2; j++) { 
    
    
                   pushMatrix(); 
                   
          //flock swoosh         
          rotate(degrees(-0.0001*j/10*(sin(angle2))));
          translate(random(-ofs/10,ofs/10), random (-ofs/5,ofs/5));
          
   //for loop: drawing less than bird rows down and to right        
   for (int i = 0; i<=rep*2; i++) {
    
       //translate and rotate organic flow
      
          //flock swoosh
          rotate(-degrees(-0.000025*(i+0.1)*(sin(angle))));
       
     //if statement restricting to produce 1-brid-only defect; limits the drawing of 1st instane of bird() inside for loops
        float rando = random(100);
        float prb1 = (prb)/3;
        if (rando>prb1) {
          
      
      //bird X,Y is a less than sign, -X,-Y is a greater than sign, drawn at probability 100-prb3
      bird(-X,-Y);
      
        }
      //if clause for making 3rd bird defect
         pushMatrix();
         float rand = random(100);
      if (rand>100-prb) {
         
        // for loop to potetnailly repeat 3rd bird defect
         for (int k = 0; k<=rep; k++) {
           
           float rand2 = random(100);
           
             if (rand2>100-prb) {
               translate(0.6*-1.1*tX,0);
               bird (-X,-Y);
             }
         }  
         
         
      }  
        popMatrix();
        
          //moves birds up and to the right
          translate(random(0.6,1)*-tX,0.7*-tY);
        
   }                
  
                   popMatrix();
        
        //copies rows of birds down and to the right
        translate(random(0.6,1)*-tX,0.7*tY);
        
 }
                   popMatrix();





// II. SKY

  //IIa. SKY TO THE RIGHT
  
 pushMatrix();
 for (float n = 0; n<=rep*2; n++) {   
    pushMatrix();
  for (float m = 0; m<=rep*2; m++) {   
    float rand3 = random(100);
    if (rand3>3*prb) {
      noStroke();
      fill(random(65,132), random(105,112), random(225,255), random(20,40));
    } else if (rand3>5*prb/2) {
      fill(random(65,132), random(105,112), random(225,255), random(5,10));
      strokeWeight(3);
      stroke(random(65,132), random(105,112), random(225,255), random(30,50));
    } else {
      strokeWeight(4);
      fill(random(65,132), random(105,112), random(225,255), random(30,50));
      stroke(random(65,132), random(105,112), random(225,255), random(30,60));
    }
    
    
    sky(X,Y,1,2);
    translate(random(0.5,.9)*tX,random(0.5,.7)*tY);
    
  }
    popMatrix();
    translate(random(0.5,.9)*tX, random(0.5,.7)*-tY);
    
 } 
 popMatrix();
     
     
  //IIb. SKY TO THE LEFT
     
 pushMatrix();  
 for (float n = 0; n<=rep*2; n++) {   
    pushMatrix();
  for (float m = 0; m<=rep*2; m++) {   
    float rand3 = random(100);
    if (rand3>3*prb) {
      noStroke();
      fill(random(65,132), random(105,112), random(225,255), random(20,40));
    } else if (rand3>5*prb/2) {
      fill(random(65,132), random(105,112), random(225,255), random(5,10));
      strokeWeight(3);
      stroke(random(65,132), random(105,112), random(225,255), random(30,50));
    } else {
      strokeWeight(4);
      fill(random(65,132), random(105,112), random(225,255), random(30,50));
      stroke(random(65,132), random(105,112), random(225,255), random(30,60));
    }
    
    
    sky(-X,-Y,-1,-2);
    translate(random(0.5,0.9)*-tX,random(0.5,0.7)*-tY);
    
  }
    popMatrix();
    translate(random(0.5,0.9)*-tX,random(0.5,0.7)*tY);
    
 }
 popMatrix();
     
 noLoop();
 // Saves each frame as line-000001.png, line-000002.png, etc.
  saveFrame("line-######.png");
}

//variables to set m(id)X and m(id)Y
  float mX = 750;
  float mY = 500;

//bird object
void bird (float X, float Y) {
  stroke(0);
  strokeWeight(1.5);
  line(mX+X, mY+Y, mX, mY+Y/2);
  line(mX, mY+Y/2, mX+X, mY);
}

//sky object
void sky (float X, float Y, float s, float r) {
    rect(mX-s*5, mY-s*4, X+r*5, Y+r*4);
  
}
