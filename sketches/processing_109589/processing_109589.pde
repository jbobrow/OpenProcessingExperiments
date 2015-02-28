
color myColorA;//Declare the color variable for ellipse A 
color myColorB;//Declare the color variable for ellipse B 
color myColorC;//Declare the color variable for ellipse C
color myColorD;//Declare the color variable for ellipse D 
color myColorE;//Declare the color variable for ellipse E 
color myColorF;//Declare the color variable for ellipse F 
color myColorG;//Declare the color variable for ellipse G 
color myColorH;//Declare the color variable for ellipse H 
color myColorI;//Declare the color variable for ellipse I

void setup () {
  size (400,400); // Define display window size
  background(0);//Define background's color
  smooth(); // Draw all geometry with smooth

  
  }
  
void draw() {
   //The first row  
   fill(myColorA);
   ellipse(100,100,100,100);// Define the position of ellipse 
   fill(myColorB);
   ellipse(200,100,100,100);// Define the position of ellipse 
   fill(myColorC);
   ellipse(300,100,100,100);// Define the position of ellipse 
  
  //The middle row 
  fill(myColorD);
  ellipse(100,200,100,100);// Define the position of ellipse 
  fill(myColorE);
  ellipse (200,200,100,100);// Define the position of ellipse 
  fill(myColorF);
  ellipse(300,200,100,100);// Define the position of ellipse 
  
  //The third row 
  fill(myColorG);
  ellipse(100,300,100,100);// Define the position of ellipse 
  fill(myColorH);
  ellipse(200,300,100,100);// Define the position of ellipse 
  fill (myColorI);
  ellipse(300,300,100,100);// Define the position of ellipse 
  
    
}

void keyPressed(){
  if (key==CODED){
    if(keyCode==UP){
      myColorA=color(random(255),random(255),random(255));//set random color for each ellipse 
      myColorB=color(random(255),random(255),random(255));//set random color for each ellipse 
      myColorC=color(random(255),random(255),random(255));//set random color for each ellipse 
    }
  }
}

void mouseDragged(){
 myColorD = color(random(255),random(255),random(255));//set random color for each ellipse 
  myColorE = color(random(255),random(255),random(255));//set random color for each ellipse 
  myColorF = color(random(255),random(255),random(255));//set random color for each ellipse
}

void mouseClicked() {
 myColorG = color(random(255),random(255),random(255));//set random color for each ellipse 
  myColorH = color(random(255),random(255),random(255));//set random color for each ellipse 
  myColorI = color(random(255),random(255),random(255));//set random color for each ellipse 
}
