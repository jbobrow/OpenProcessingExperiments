
float x = 100;
float y = 100;
float w = 60;
float h = 60;
float shipSize = 16;

float shipR;
float shipG;
float shipB;


// dots
float r;
float g;
float b;
float a;

float diam;
float dotsx;
float dotsy;



//leaves
int[] xPos = {25, 180, 45};
int[] yPos = {20, 16, 55}; 
boolean[] clicked = {false, false, false};



void setup () {
size(200,200);
smooth();
}



void draw () {
  background(0);
  
  //leaves
 for (int i=0; i<xPos.length;i++) {
  if ((clicked[i]==true) && (yPos[i]<200)) {
   yPos[i]++;
  }
  
  
  shipR = random(255);
  shipG = random(255);
  shipB = random(255);
  fill(shipR,shipG,shipB);  
  
  ellipse(xPos[i],yPos[i]-10,15,10);
  ellipse(xPos[i],yPos[i],45,15);
  
  
  
  
  
  
    
  



 }
 
 if(mousePressed == true) {
  r = random(255);
  g = random(255);
  b = random(255);
  a = random(255);
  diam = random(40);
  x = random(width);
  y = random(height);
  
  // Use values to draw an ellipse
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
 
 
   shipR = random(255);
  shipG = random(255);
  shipB = random(255);
  fill(shipR,shipG,shipB);
  ellipse(x-w/3+7,y+h/2-10,shipSize,shipSize);
  ellipse(x-w/5,y+h/2,shipSize*3,shipSize);
 
}
 
 
 
// Body
stroke(0);
fill(82,252,91);
rect(85,70,30,65);


  fill(frameCount / 2);
// Head
stroke(0);
fill(82,252,91);

ellipse(100,65,90,80); 
fill(255);
ellipse(100,65,90,50); 

// Eyes
fill(mouseX,0,mouseY); 
ellipse(75,65,13,32); 
ellipse(125,65,13,32);


// Legs
// pointa-x,pointa-y,pointb-x,pointb-y)
stroke(255);
fill(255);
line(85,130,80,160);
line(115,130,120,160);		

// feet
stroke(0);
fill(82,252,91);
ellipse(80,162,13,6); 
ellipse(120,162,13,6);

}





void mousePressed () {
   for (int i=0; i<xPos.length;i++) {
     if ((mouseX > xPos[i]-5) && (mouseX < xPos[i]+5)&&(mouseY > yPos[i]-5) && (mouseY < yPos[i]+5)) {
       clicked[i] = true;
     }    
   }
   
}


