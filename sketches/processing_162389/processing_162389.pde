
int xPos = 30;
int yPos= 159;
int S=40;
int P=20;
 
void setup( ){
 
size(800,600);
background(#F2DC5F);
fill(255);
rect(150,20,620,500);

 
   
//red
fill(255,0,0);
rect(xPos,yPos,S,S);
//orange
fill(255,128,0);
rect(xPos,yPos+S+P,S,S);
//yellow
fill(255,255,0);
rect(xPos,yPos+S*2+P*2,S,S);
//yellow green
fill(0,255,0);
rect(xPos,yPos+S*3+P*3,S,S);

   //2p
//sky
fill(0,255,255);
rect(xPos+S+P,yPos,S,S);
//skyblue
fill(0,128,255);
rect(xPos+S+P,yPos+S+P,S,S);
//blue
fill(0,0,255);
rect(xPos+S+P,yPos+S*2+P*2,S,S);
//navy
fill(0,0,128);
rect(xPos+S+P,yPos+S*3+P*3,S,S);

 

 
}
 
void draw( ) {

   
if(mousePressed) {
  if( mouseX > 155 && mouseX < 640 && mouseY > 30 && mouseY < 550 ){
  line(pmouseX,pmouseY,mouseX,mouseY);

}
 

 if( mouseX > xPos  && mouseX < xPos+S && mouseY > yPos && mouseY < yPos+S ) {
   stroke(255,0,0);
   strokeWeight(5);
 }
 //orangebutton
 if( mouseX > xPos  && mouseX < xPos+S && mouseY >yPos+S+P && mouseY < yPos+S+P+S ) {
   stroke(255,128,0);
  strokeWeight(5);
 } 
 //yellowbutton
 if( mouseX > xPos  && mouseX < xPos+S && mouseY > yPos+S*2+P*2 && mouseY < yPos+S*2+P*2+S ) {
   stroke(255,255,0);
  strokeWeight(5);
 }
  
//yellow green button 
 if( mouseX > xPos  && mouseX < xPos+S && mouseY > yPos+S*3+P*3 && mouseY < yPos+S*3+P*3+S ) {
   stroke(0,255,0);
  strokeWeight(5);
 }

  
  
 //skybutton 
 if( mouseX > xPos+S+P  && mouseX < xPos+S+P+S && mouseY > yPos && mouseY < yPos+S ) {
   stroke(0,255,255);
    strokeWeight(5);
 }
  //skybluebutton 
 if( mouseX > xPos+S+P  && mouseX < xPos+S+P+S && mouseY > yPos+S+P && mouseY < yPos+S+P+S ) {
   stroke(0,128,255);
  strokeWeight(5);
 }
  //bluebutton 
 if( mouseX > xPos+S+P  && mouseX < xPos+S+P+S && mouseY > yPos+S*2+P*2 && mouseY < yPos+S*2+P*2+S  ) {
   stroke(0,0,255);
  strokeWeight(5);
 }
  //navybutton 
 if( mouseX > xPos+S+P  && mouseX < xPos+S+P+S && mouseY > yPos+S*3+P*3 && mouseY < yPos+S*3+P*3+S ) {
   stroke(0,0,128);
  strokeWeight(5);
 }

}
   
}
 
