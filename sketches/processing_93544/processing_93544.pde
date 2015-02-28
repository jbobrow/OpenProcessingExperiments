
int p1=mouseX;
int p2=mouseY;

void setup() {  // setup() runs once
  size(400, 400);
  background(255);
  noStroke();
  fill(random(0,100),random(0,100));

}
 
void draw() {  

setMouseCircle();
 
setSquareMiddle(); 

setBubbles(); 
}

 //Creates random Bubbles
 void setBubbles(){ 
 float r1 = random(0,400);
 float r2 = random(0,400);  
 float r3 = random(10,60);
 float r4 = random(10,60);
   if(mousePressed && mouseButton == LEFT) {
    smooth();
    fill(random(0,255),random(0,255),random(0,255));
   if((r1+(r3/2))<60|(r1-(r3/2))>340|(r2+(r4/2))<55|(r2-(r4/2))>340){
    stroke(r1,r2,r3,r4);
    line(r1,r2,r3,r4);
    fill(random(0,255),random(0,255));
    ellipse(r1,r2,r3,r4);
    }    
 }
 }
 //Follow Mouse with circles  
 void setMouseCircle(){
 p1= (9*p1 + mouseX) / 10;
 p2= (9*p2 + mouseY) / 10;
 fill(random(0,255),random(0,255),random(0,255));
 if((p1-20)>50&&(p2-20)>50&&(p1+20)<350&&(p2+20)<350){ //Just in square
 ellipse(p1, p2, 20,20);
 }
 }    
    
 //White Square Middle
 void setSquareMiddle(){
 fill(255, 5);
 rect(50,50,width-100, height-100);
 }


  


