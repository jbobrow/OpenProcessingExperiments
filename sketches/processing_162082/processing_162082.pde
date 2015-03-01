
int xPos = 45;
int yPos= 80;
int S=40;
int P=20;

void setup( ){

size(800,600);
background(150);

//board
noStroke();
fill(200);
rect(190,40,570,520);
fill(255);
rect(200,50,550,500);
fill(200);
rect(30,40,130,520);

//button
   //1p
  
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
//green
fill(0,128,0);
rect(xPos,yPos+S*4+P*4,S,S);

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
//purple
fill(128,0,128);
rect(xPos+S+P,yPos+S*4+P*4,S,S);


//eraser
fill(255);
rect(xPos,yPos+S*8+P,S+S+P,S+S+P); 


}

void draw( ) {

  
if(mousePressed) {
  //area
  if( mouseX > 220  && mouseX < 780 && mouseY > 20 && mouseY < 530 ){
  line(pmouseX,pmouseY,mouseX,mouseY); 
float W = dist(pmouseX,pmouseY,mouseX,mouseY); 
strokeWeight(W);
}

//button area 
//redbutton  
 if( mouseX > xPos  && mouseX < xPos+S && mouseY > yPos && mouseY < yPos+S ) {
   stroke(255,0,0);
  
 }
 //orangebutton
 if( mouseX > xPos  && mouseX < xPos+S && mouseY >yPos+S+P && mouseY < yPos+S+P+S ) {
   stroke(255,128,0);

 }  
 //yellowbutton
 if( mouseX > xPos  && mouseX < xPos+S && mouseY > yPos+S*2+P*2 && mouseY < yPos+S*2+P*2+S ) {
   stroke(255,255,0);

 }
 
//yellow green button  
 if( mouseX > xPos  && mouseX < xPos+S && mouseY > yPos+S*3+P*3 && mouseY < yPos+S*3+P*3+S ) {
   stroke(0,255,0);

 }
 //greenbutton
 if( mouseX > xPos  && mouseX < xPos+S && mouseY > yPos+S*4+P*4 && mouseY < yPos+S*4+P*4+S ) {
   stroke(0,128,0);
   
 }
 
 
 
 //skybutton  
 if( mouseX > xPos+S+P  && mouseX < xPos+S+P+S && mouseY > yPos && mouseY < yPos+S ) {
   stroke(0,255,255);
  
 }
  //skybluebutton  
 if( mouseX > xPos+S+P  && mouseX < xPos+S+P+S && mouseY > yPos+S+P && mouseY < yPos+S+P+S ) {
   stroke(0,128,255);

 }
  //bluebutton  
 if( mouseX > xPos+S+P  && mouseX < xPos+S+P+S && mouseY > yPos+S*2+P*2 && mouseY < yPos+S*2+P*2+S  ) {
   stroke(0,0,255);

 }
  //navybutton  
 if( mouseX > xPos+S+P  && mouseX < xPos+S+P+S && mouseY > yPos+S*3+P*3 && mouseY < yPos+S*3+P*3+S ) {
   stroke(0,0,128);

 }
  //purplebutton  
 if( mouseX > xPos+S+P  && mouseX < xPos+S+P+S && mouseY > yPos+S*4+P*4 && mouseY < yPos+S*4+P*4+S) {
   stroke(128,0,128);

 }
 
 
 
 //eraser
 if( mouseX > xPos  && mouseX < xPos+S+S+P && mouseY > yPos+S*8+P && mouseY < yPos+S*8+P+S+S+P ){
stroke(255);
strokeWeight(50);

} 
  
}

}

