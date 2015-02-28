
/*
Project title: IxD Interactive Logo
Description: This project forms an interactive logo for the blog of the Interaction Venice Lab.
The number of posts decides the number of plus ("+") and the complexity of the shape; the hue of the sculpture is shaped by the number of images posted; the number of links of a group of five posts decides
the transparency of every shape.
Authors: Graziana Saccente; Sebastian Schutzdeller, Tommaso Tronchin
*/

//  number of posts in the blog
int postValue=50;

//  the number of images decides the hue of the color
int nImg=294;

float x,y,d,r,g,b;
int mx=23;
int[] xArray= new int[mx];
int[] xPos = new int[255];
int[] yPos = new int[255];
int alpArray[] = new int[mx*mx]; 

void setup(){
  
  size(550,550);
  background(255);
  translate(50,50);
  noStroke();
  textAlign(CENTER);  
  textSize(12);
// slider that changes the number of posts
  /*cp5 = new ControlP5(this);
  cp5.addSlider("postValue")
     .setPosition(20,20)
     .setRange(0,100)
     ;
  
  cp5 = new ControlP5(this);
  cp5.addSlider("nImg")
     .setPosition(20,40)
     .setRange(0,500)
     ;
  */
  
  
  // change the trasparency of every single shape with random value
  for (int i=0;i<nImg;i++) {
    alpArray[i]=round(random(0, 255));
  }
  
  //elaboration of x and y positions of the crosses
  for (int i=0;i<postValue;i++) {
    xPos[i] = (round(random(10,mx*mx)/20) * 20);
    yPos[i] = (round(random(10,mx*mx)/20) * 20);
  }
  
}

void draw() {
  /*if(pdfCheck){
    beginRecord(PDF, "file.pdf");
  }*/
  background(255);

  fill(r,g,b,alpArray[0]);
  int s =0;
  beginShape();
  
  //draw the "+" and the vertixes of the logo
  for (int i=0; i< postValue; i++) {
    fill(0);
    text("+", xPos[i], yPos[i]  + 4);
    fill(r,g,b,alpArray[s]);
    vertex(xPos[i], yPos[i]);
  
  // number of edges of the shape
  if (i % 5 == 0) {
      endShape(CLOSE);
      s=s+1;
      beginShape();
    }
  }
  /*
  if(pdfCheck){
    endRecord();
    pdfCheck = false;
  }*/
}

void mousePressed() { 
  //pdfCheck = true;
  
  r=(nImg*3)&0xff;
  g=(nImg*3 >> 1)&0xff;
  b=(nImg*3 >> 2)&0xff;
  
  //elaboration of x and y positions of the crosses
  for (int i=0;i<postValue;i++) {
    xPos[i] = (round(random(10,mx*mx)/20) * 20);
    yPos[i] = (round(random(10,mx*mx)/20) * 20);
  }
  
  // change the trasparency of every single shape with random value
  for (int i=0;i<nImg;i++) {
    alpArray[i]=round(random(20, 255));
  }

}





