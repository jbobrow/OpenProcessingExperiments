
// A fenestrated facade with randomly placed "screens" over random
 // windows across the facadw, within a random color palette. 


void setup() {

  size(600, 400);
  background(179, 200, 211);
  fill(52, 55, 57);
  rect (0, 300, width, 100);
  stroke(255);
  strokeWeight(9);
  line(0, 300, 600, 300);
  colorMode(RGB);
}

int window=75;
float count=0;
float x;



void draw() {

  if(random(50)>20){
    fill(random(200,255), random(180,200),29);
  } 
  else{
    fill(150,153,151);
  }
  //this chunk tells each "fixed" command to become more random. 
    //This is how i am "controlling" the randomness.

    x=(count*100+10);
      if (x <= 300); {
  stroke(0);
  strokeWeight(1);
   
  rect(x, 50, window, window/2);
  
  
  if (count<=2); {
  stroke(0);
  strokeWeight(1);
  rect(count*100+10, 100, window, window/2);
if(random(50)>20){
    fill(random(200,255), random(180,200),29);
  } 
  else{
    fill(150,153,151);
  }

  stroke(0);
  strokeWeight(1);
  rect(count*100+10, 150, window, window/2);

if(random(50)>20){
    fill(random(200,255), random(180,200),29);
  } 
  else{
    fill(150,153,151);
  }


  stroke(0);
  strokeWeight(1); 
  rect(count*100+10, 200, window, window/2);

if(random(50)>20){
    fill(random(200,255), random(180,200),29);
  } 
  else{
    fill(150,153,151);
  }
  stroke(0);
  strokeWeight(1);
  rect(count*100+10, 250, window, window/2);


  }
  }

window++;
  count++;
}

//



