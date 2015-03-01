
//different rain drops
float xPosition = 30;
float yPosition ;

float x2Position = 250;
float y2Position ;


float x3Position = 100;
float y3Position ;


float x4Position = 360;
float y4Position ;


void setup () {
   size(400,400);
    noStroke ();
}

void draw () {
  background (#54acff);
//raindrop1
  fill(#c7dff6);
  ellipse( xPosition,yPosition, 20, 100);
  yPosition += 7; 
//raindrop2
  fill(#b7dcff);
  ellipse(x2Position,y2Position,10, 50);
   y2Position += 3; 
//raindrop3
  fill(#b7dcff);
  ellipse(x3Position,y3Position,30, 80);
   y3Position += 5; 
  
//raindrop4
  fill(#b7dcff);
  ellipse(x4Position,y4Position,10, 80);
   y4Position += 2; 
  
//make them repeat  
  if(yPosition> 400) {
    yPosition=0;
    } 

  
  if(y2Position> 400) {
    y2Position=0;
   } 

   
  if(y3Position> 400) {
    y3Position=0;
   } 
   
   
  if(y4Position> 400) {
    y4Position=0;
   } 
}



