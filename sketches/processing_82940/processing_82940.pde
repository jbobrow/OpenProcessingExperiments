
float[] xPos = new float[0];
float[] yPos = new float[0];
float[] xVel = new float[0];
float[] yVel = new float[0];
float[] partSize = new float[0];



void setup() {
  size (800, 600);
}


void draw () {
  background(100, 200, 200);

  noStroke();
  //snowman

  fill(255);
  bezier (-50, 600, 100, 400, 400, 400, 600, 600);
  bezier (300, 600, 600, 400, 800, 400, 1000, 600);

  // bottom
  fill(255);
  ellipse (200, 425, 200, 200); 

  // middle
  ellipse (200, 300, 150, 150); 
  //head
  ellipse (200, 200, 100, 100); 


  //tree

  fill(138, 54, 15);
  rect(575, 350, 50, 150);


  fill(0, 255, 0);
  for (int xTri = 600; xTri < 620; xTri +=90) {
    for (int yTri = 50; yTri <350; yTri +=50)
      triangle(xTri, yTri, xTri-100, yTri +100, xTri +100, yTri +100);
  }




  //snow

  
  xPos = append(xPos, random (0, 800));
  yPos = append(yPos, random (0));
  xVel = append(xVel, random(-1, 1));
  yVel = append(yVel, (0.1));
  partSize = append(partSize, random(3, 7));

  fill(255);


  for (int i = 0; i<xPos.length; i++ ) {  

 
    ellipse(xPos[i], yPos[i], partSize[i], partSize[i]);

    
    xPos[i] += xVel[i];
    yPos[i] += yVel[i];

    
    yVel[i]+=0.1;
  }

 
  if (xPos.length>200) {
    xPos = subset(xPos, 1);
    yPos = subset(yPos, 1);
    xVel = subset(xVel, 1);
    yVel = subset(yVel, 1);
    partSize = subset(partSize, 1);
  }
  

     
      

  //coal


  fill(0);
  for (float yCoal=215; yCoal<=500; yCoal+=50) {

    //coal buttons
    ellipse(200, yCoal, 15, 15);
  }
  //coal eyes
  float leftXeye = constrain(map( mouseX, 0, 600, 0, 400), 175, 180);
  float leftYeye = constrain(map( mouseY, 0, 600, 0, 400), 180, 185);
  
  float rightXeye = constrain(map( mouseX, 0, 600, 0, 400), 220, 225);
  float rightYeye = constrain(map( mouseY, 0, 600, 0, 400), 180, 185);
  

  ellipse(leftXeye, leftYeye, 15, 15);
  ellipse(rightXeye, rightYeye, 15, 15);

  //baulballs

  for (float yLight=150; yLight<=400; yLight+=50) {
    fill (255, 0, 0);
    ellipse (700, yLight, 15, 15);
    ellipse (500, yLight, 15, 15);
  


if (mousePressed) {
 fill (0,0,255);
     ellipse (700, yLight, 15, 15);
    ellipse (500, yLight, 15, 15);
    
}

  
}
 

}
