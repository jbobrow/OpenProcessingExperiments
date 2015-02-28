
int counter = 0;
int rCounter = 360;
float colorCounterR = random(0, 255);
float colorCounterG = random(0, 255);
float colorCounterB = random(0, 255);
float rColorCounterR = random(0, 255);
float rColorCounterG = random(0, 255);
float rColorCounterB = random(0, 255);
int recSize = 75;
float sRecSize = 20;
int circSize = 10;
int mCircSize = 50;
int bR= 255;
int bG=0;
int bB=0;


void setup() {

  size(1000, 1000);
}

void draw() {

  background(bR,bG,bB);




//fades from red to green to blue to red
if(bR > 0){
 bR--;
}

if(bR == 0 && bB == 0  ){
if(bG<256){
  bG++;
} 

}
if(bG == 255)
{
bG=0;
}

if(bR == 0 && bG == 0){
  if(bB < 256){
bB++;
  }
}  

if(bB == 255){
  bB = 0;
  bR = 255;
}



if(keyPressed){ //press keys for either squares, circles or triangles in background
  
  if(key == 'c' || key == 'C'){// if c is pressed generates 200 random cicrles in background 
        for(int i = 0; i < 200; i++)
        {
          noStroke();
          fill(random(1,254),random(1,254),random(1,254),40);
          ellipse(random(0,1000),random(0,1000), 100,100);
        }
  }
  
  
  if(key == 'r' || key == 'R'){// if r is pressed generates 200 random rectangles in background 
        for(int i = 0; i < 200; i++)
        {
          noStroke();
          fill(random(1,254),random(1,254),random(1,254),40);
          rect(random(0,1000),random(0,1000), 100,100);
        }
  }
  
  if(key == 't' || key == 'T'){// if t is pressed generates 200 random triangles in background 
 
        for(int i = 0; i < 200; i++)
        {
        float  triPointX = random(-100,1000);
        float triPointY = random(-100,1000);
          noStroke();
          fill(random(1,254),random(1,254),random(1,254),40);
          triangle(triPointX, triPointY, triPointX+50, triPointY+100, triPointX-50, triPointY+100);
        }
  }
  
  
}









  strokeWeight(1);
  stroke(0);

  pushMatrix();//generates inner circles
  translate(width/2, height/2);
  fill(colorCounterR, colorCounterG, colorCounterB);
  ellipse(0, 0, circSize, circSize);//center circle doesnt rotate
  rotate(radians(rCounter));//rotates around counter clockwise
  fill(rColorCounterR, rColorCounterG, rColorCounterB);//fills with random color
  ellipse(0+circSize*2, 0, circSize, circSize);//generates four circles in '+' formation around origin
  ellipse(0-circSize*2, 0, circSize, circSize);
  ellipse(0, 0+circSize*2, circSize, circSize);
  ellipse(0, 0-circSize*2, circSize, circSize);
  popMatrix();

  pushMatrix();//right side square
  translate(width/2+100, height/2);//translate whole grid to middle//right square
  rotate(radians(counter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, recSize, recSize);
  popMatrix();

  pushMatrix(); //left side square
  translate(width/2-100, height/2);//translate whole grid to middle
  rotate(radians(counter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, recSize, recSize);
  popMatrix();

  pushMatrix();//top square
  translate(width/2, height/2-100);//translate whole grid to middle
  rotate(radians(counter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, recSize, recSize);
  popMatrix();

  pushMatrix();//bottom square
  translate(width/2, height/2+100);//translate whole grid to middle, top square
  rotate(radians(counter));//rotation based on radians//
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, recSize, recSize);
  popMatrix();

  pushMatrix();//generates second ring of circles
  translate(width/2, height/2);
  rotate(radians(rCounter));//rotates around counter clockwise
  fill(rColorCounterR, rColorCounterG, rColorCounterB);//fills with random color
  ellipse(0+mCircSize*4.1, 0, mCircSize, mCircSize);//generates four circles in '+' formation around origin
  ellipse(0-mCircSize*4.1, 0, mCircSize, mCircSize);
  ellipse(0, 0+mCircSize*4.1, mCircSize, mCircSize);
  ellipse(0, 0-mCircSize*4.1, mCircSize, mCircSize);
  ellipse(0+mCircSize*2, 0-mCircSize*3.5, mCircSize, mCircSize);//generates top right circles
  ellipse(0+mCircSize*3.5, 0-mCircSize*2, mCircSize, mCircSize);
  ellipse(0-mCircSize*2, 0-mCircSize*3.5, mCircSize, mCircSize);//generates top left circles
  ellipse(0-mCircSize*3.5, 0-mCircSize*2, mCircSize, mCircSize);
  ellipse(0-mCircSize*3.5, 0+mCircSize*2, mCircSize, mCircSize);//generates bottom left circles
  ellipse(0-mCircSize*2, 0+mCircSize*3.5, mCircSize, mCircSize);
  ellipse(0+mCircSize*3.5, 0+mCircSize*2, mCircSize, mCircSize);//generates bottom right circles
  ellipse(0+mCircSize*2, 0+mCircSize*3.5, mCircSize, mCircSize);
  popMatrix();


  pushMatrix();//top second circle  ring
  translate(width/2, height/2-300);//translate whole grid to middle//right square
  rotate(radians(rCounter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, sRecSize, sRecSize);
  popMatrix();

  pushMatrix();//right second ring
  translate(width/2+300, height/2);//translate whole grid to middle//right square
  rotate(radians(rCounter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, sRecSize, sRecSize);
  popMatrix();

  pushMatrix();//left second circle  ring
  translate(width/2-300, height/2);//translate whole grid to middle//right square
  rotate(radians(rCounter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, sRecSize, sRecSize);
  popMatrix();

  pushMatrix();//bottom second circle  ring
  translate(width/2, height/2+300);//translate whole grid to middle//right square
  rotate(radians(rCounter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, sRecSize, sRecSize);
  popMatrix();


  pushMatrix();//top right second circle ring
  translate(width/2+220, height/2-220);//translate whole grid to middle//right square
  rotate(radians(rCounter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, sRecSize, sRecSize);
  popMatrix();

  pushMatrix(); // top left circle ring
  translate(width/2-220, height/2-220);//translate whole grid to middle//right square
  rotate(radians(rCounter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, sRecSize, sRecSize);
  popMatrix();

  pushMatrix();//bottom left second circle ring
  translate(width/2-220, height/2+220);//translate whole grid to middle//right square
  rotate(radians(rCounter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, sRecSize, sRecSize);
  popMatrix();

  pushMatrix();// bottom right second circle ring
  translate(width/2+220, height/2+220);//translate whole grid to middle//right square
  rotate(radians(rCounter));//rotation based on radians
  fill(colorCounterR, colorCounterG, colorCounterB);
  rectMode(CENTER);
  rect(0, 0, sRecSize, sRecSize);
  popMatrix();



  pushMatrix();//generates top left circles
  translate(width/8, height/8);
  fill(rColorCounterR, rColorCounterG, rColorCounterB);//fills with random color
  ellipse(0, 0, circSize, circSize);
  rotate(radians(mouseX+mouseY));//rotates depending on mouse postion, move mouse right rotates right, left, rotates left, up rotates left, down rotates right
  fill(rColorCounterR, rColorCounterG, rColorCounterB);//fills with random color
  ellipse(0+circSize*4, 0, circSize, circSize);//right
  ellipse(0+circSize*8, 0, circSize, circSize);
  ellipse(0-circSize*4, 0, circSize, circSize);//left
  ellipse(0-circSize*8, 0, circSize, circSize);
  ellipse(0, 0+circSize*4, circSize, circSize);//bottom
  ellipse(0, 0+circSize*8, circSize, circSize);
  ellipse(0, 0-circSize*4, circSize, circSize);//top
  ellipse(0, 0-circSize*8, circSize, circSize);
  popMatrix();


  pushMatrix();//generates bottom left circles
  translate(width/8, height-(height/8));
  fill(rColorCounterR, rColorCounterG, rColorCounterB);//fills with random color
  ellipse(0, 0, circSize, circSize);
  rotate(radians(mouseX+mouseY));//rotates depending on mouse postion, move mouse right rotates right, left, rotates left, up rotates left, down rotates right
  ellipse(0+circSize*4, 0, circSize, circSize);//right
  ellipse(0+circSize*8, 0, circSize, circSize);
  ellipse(0-circSize*4, 0, circSize, circSize);//left
  ellipse(0-circSize*8, 0, circSize, circSize);
  ellipse(0, 0+circSize*4, circSize, circSize);//bottom
  ellipse(0, 0+circSize*8, circSize, circSize);
  ellipse(0, 0-circSize*4, circSize, circSize);//top
  ellipse(0, 0-circSize*8, circSize, circSize);
  popMatrix();

  pushMatrix();//generates top right circles
  translate(width-(height/8), height/8);
  fill(rColorCounterR, rColorCounterG, rColorCounterB);//fills with random color
  ellipse(0, 0, circSize, circSize);
  rotate(radians(mouseX+mouseY));//rotates depending on mouse postion, move mouse right rotates right, left, rotates left, up rotates left, down rotates right

  ellipse(0+circSize*4, 0, circSize, circSize);//right
  ellipse(0+circSize*8, 0, circSize, circSize);
  ellipse(0-circSize*4, 0, circSize, circSize);//left
  ellipse(0-circSize*8, 0, circSize, circSize);
  ellipse(0, 0+circSize*4, circSize, circSize);//bottom
  ellipse(0, 0+circSize*8, circSize, circSize);
  ellipse(0, 0-circSize*4, circSize, circSize);//top
  ellipse(0, 0-circSize*8, circSize, circSize);
  popMatrix();


  pushMatrix();//generates top right circles
  translate(width-(width/8), height-(height/8));
  fill(rColorCounterR, rColorCounterG, rColorCounterB);//fills with random color
  ellipse(0, 0, circSize, circSize);
  rotate(radians(mouseX+mouseY));//rotates depending on mouse postion, move mouse right rotates right, left, rotates left, up rotates left, down rotates right

  ellipse(0+circSize*4, 0, circSize, circSize);//right
  ellipse(0+circSize*8, 0, circSize, circSize);
  ellipse(0-circSize*4, 0, circSize, circSize);//left
  ellipse(0-circSize*8, 0, circSize, circSize);
  ellipse(0, 0+circSize*4, circSize, circSize);//bottom
  ellipse(0, 0+circSize*8, circSize, circSize);
  ellipse(0, 0-circSize*4, circSize, circSize);//top
  ellipse(0, 0-circSize*8, circSize, circSize);
  popMatrix();





  sRecSize = sRecSize + 0.2 ;

  counter++;
  rCounter--;

  colorCounterR++;
  
  colorCounterG++;
  colorCounterB++;

  rColorCounterR--;
  rColorCounterG--;
  rColorCounterB--;

  if (sRecSize > 60) {
    sRecSize = 30;
  }



  if (colorCounterR > 255 && colorCounterG >255 && colorCounterB>255) {//fades to white then resets to random
    colorCounterR = random(0, 255);
    colorCounterG = random(0, 255);
    colorCounterB = random(0, 255);
  }

  else if (rColorCounterR <0 && rColorCounterG < 0 && rColorCounterB<0) {//fades to black then resets to random
    rColorCounterR = random(0, 255);
    rColorCounterG = random(0, 255);
    rColorCounterB = random(0, 255);
  }

  if (counter == 360) { //prevents counter from going infinite resets and continues to rotate
    counter =0;
  }

  if (rCounter == 0) {
    rCounter = 360;
  }




}



