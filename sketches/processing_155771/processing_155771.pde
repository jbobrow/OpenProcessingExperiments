
float circleX;
float circleY;
float circleW;
float circleH;
float circleColor = 0;
float sizeChange; //defines rate of change of width
float sizeChangeH; //defines rate of change of height
int backgroundValue = 0;
int redValue = 255;
int blueValue = 0;
int greenValue = 0;

int redValueB = 0;
int blueValueB = 0;
int greenValueB = 255;

float angle;


void setup(){
  size (500, 500);
  circleX = height/2;
  circleY = height/2;
  circleW = 50;
  circleH = 50;
  ellipseMode (CENTER);
}

void draw(){

  //found this cool thing on the internet:
  background(redValue, greenValue, blueValue);
  //----------------background-----------------
//start at red and go to yellow
 if( greenValue<255 && redValue==255 && blueValue==0){
   greenValue++;
  }
   
  //go from yellow to pure green
  if(greenValue == 255 && redValue>0){
    //redToGreen = false;
   redValue--;
  }
   
  //go from green to cyan/bluish-green
  if(redValue==0 && greenValue==255 && blueValue<255){
   
    blueValue++;
  }
  
    //----------------fill-----------------
  fill(redValueB, greenValueB, blueValueB);
  if( greenValueB<255 && redValueB==255 && blueValueB==0){
   greenValueB++;
  }
   
  //go from yellow to pure green
  if(greenValueB == 255 && redValueB>0){
    //redToGreen = false;
   redValueB--;
  }
   
  //go from green to cyan/bluish-green
  if(redValueB==0 && greenValueB==255 && blueValueB<255){
   
    blueValueB++;
  }
  
 if (circleW<1000 && circleH<800){
  ellipse(circleX, circleY, circleW, circleH);
  sizeChange+=0.01;
  sizeChangeH+=0.001;
  circleW = circleW + sizeChange;
  circleH = circleH + sizeChangeH;
 } else {
   angle+=0.01;
  translate(width/2, height/2);
  rotate(angle);
  ellipse(circleX, circleY, circleW, circleH); 
  if (circleW<1000 && circleH<800){
    sizeChange+=-0.01;
    sizeChange+=-0.001;
    circleW = circleW + sizeChange;
    circleH = circleH + sizeChangeH;
  }
 }


 
 /*if (mousePressed){
  fill(frameCount/2); //rate of color change of fill
  stroke(frameCount/4); //rate of color change of stroke
  ellipse(width/2, height/2, mouseX+10, mouseY+10);
 }
 */
  
  if (keyPressed){
    if (key=='s'){
      saveFrame();
    }
  }
}


