
//import processing.pdf.*;
int cpt1 = 0; int cpt2 = 0; int cpt3 = 0; 
float side ; int prof = 100; 
int nbcube = 20; int pas = 1; int cpt = 10; 
PFont myFont; 

void setup() {
  size(900,700,P3D);     // noLoop();
  myFont = createFont("CourierNewPS-BoldMT", 30);
  textFont(myFont); 
  background(255); 
//beginRaw(PDF, "cube 50.pdf");
 }
void draw() {
  background(255);   
 textFont(myFont,22);                        

 fill(0); 
 text("cube de "+nbcube+" ", 30, 30 , 0); 
 translate(width/2, height/2, -prof);                   
rotateX(((-PI/2)/width)* mouseY );
rotateY(((TWO_PI)/width)* mouseX );

  float cote = height/2 ;                               
  side = cote/nbcube; 
           
  for(int j = 1 ; j <= nbcube ; j = j+ pas) {          
    
      for(int k = 1 ; k <= nbcube ; k = k+ pas)  {

        for(int m = 1 ; m <= nbcube ; m = m+ pas){
cpt3 = cpt3 + 1 ;                                     
           for(int i = 1; i<= nbcube ; i = i + 1) {

        if( cpt3 == i*i*i )       {                                                       //When cpt3 equals one of the first 50 integers            
                  strokeWeight(6); stroke((255/nbcube)*j, 0, 255-(255/nbcube)*j );        //no alpha component
              fill(255-((255/nbcube)*j), 0, (255/nbcube)*j  );    
                                              
text(cpt3, (-cote/2)+ (j*side)+2, -(cote/2)+ (k*side), m*(side));                     
               }
             else {    
               strokeWeight(2); stroke((255/nbcube)*j, 0, 255-(255/nbcube)*j, 40 );       //alpha = 40
              fill((255/nbcube)*j, 0, 255-(255/nbcube)*j , 40 );
            }
             }
text(cpt3, (-cote/2)+ (j*side)+2, -(cote/2)+ (k*side), m*(side));

          }}}
cpt3 = 0 ; 
    
//  endRaw();
}






