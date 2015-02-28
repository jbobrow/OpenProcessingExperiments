
/*Fernando GARVERD
first code
*/

int rcolor=255;
int gcolor= 100;
int bcolor= 50; 
int altura=500;
int ancho=500;
int x=50;
int y=50;



void setup(){
  size(altura,ancho);
  background(20);
  smooth();
} 

void draw(){
 rectMode(CENTER);
 //background
 fill(20,20);
 rect(width/2,height/2,width,height);
} 





void  keyPressed(){
 
  if (key=='g'){
      stroke(0,50);
      strokeWeight(2);
  fill(random(gcolor,255),random(bcolor-20),random(20,60));
 rect(mouseX,mouseY,random(10,30),random(10,50)); 
line (mouseX, mouseY, mouseX + random (50, 100), mouseY + random (10));
  }
  
  
  
   // efe
  if (key=='f') {
    noStroke();
    fill(random(20,60),random(160,250),random(60,255),50);
    rect(mouseX,mouseY, random(50,100),random(50,120));
  }
  
  //save
  if (key =='s') {
saveFrame();
} 


  
  // h 
  if(key=='h'){
    noStroke();
    fill(random(255),random(255),random(255),190);
    ellipse(mouseX,mouseY, random(60,100), random(60,120));
}
  
}


   //circle
void mouseDragged() {

   noStroke();
    fill(random(190,255),random(40,45),random(60,30),30);
    ellipse(mouseX,mouseY,random(x,90),random(y,110));
}


