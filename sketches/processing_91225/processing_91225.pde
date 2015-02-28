
int[] myShape = new int [4];
int[] myColor = new int [2];
int [] mySpeed = {2,1,1,2};

void setup() {
  size(300,200);
  background(0);
}
  
 void draw() {
 
   if(( mouseX < 20) || (mouseX> 280) || ( mouseY > 180 )) {

    myColor[0] = color( random(255), random(255), random(255), random(255)); 
    myColor[1] = color( random(255), random(255), random(255), random(255)); 
   
   frameRate(80);
   fill(myColor[0]);
   strokeWeight(5);
   ellipse(myShape[0],100,75,75);
   fill(myColor[0]);
   triangle(150,50,100,125,200,125);
   fill(myColor[0]);
   rect(50,myShape[1],50,50);
   ellipse(150,myShape[3],75,75);
   rect(200,myShape[2],50,50);
   

   
   myShape[0] = myShape[0] + mySpeed[0]; 
   myShape[1] = myShape[1] + mySpeed[1];
   myShape[2] = myShape[2] + mySpeed[2];
   myShape[3] = myShape[3] + mySpeed[3];



   if (myShape[0] > 280 || myShape[0] < 0)
   mySpeed[0] = mySpeed[0] * -1;
   if (myShape[1] > 180 || myShape[1] < 0)
   mySpeed[1] = mySpeed[1] * -1;
   if (myShape[2] > 180 || myShape[2] < 0)
   mySpeed[2] = mySpeed[2] * -1;
   if (myShape[3] > 180 || myShape[3] < 0)
   mySpeed[3] = mySpeed[3] * -1;

  }
 }
