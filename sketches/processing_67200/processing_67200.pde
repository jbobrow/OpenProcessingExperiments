
int numSlice = 8;
float[] sliceStart = new float[numSlice];

int numSalami = 20;
float[] salamiX = new float[numSalami];
float[] salamiY = new float[numSalami];

//boolean mouseClick;    ----failed attempt

void setup(){
  
  size(500, 500);
  background(0);
  noStroke();
  smooth();
  
//  mouseClick = false;   ------failed attempt
  
  for(int i = 0; i < numSlice; i++){
    sliceStart[i] = 0;
  }
  
//----------PROBLEM---------------How do you set a round boundary? 
  for(int j = 0; j < numSalami; j++){
//    salamiX[j] = random(dist(width/2, height/2, 75, 425), (TWO_PI));
//    salamiX[j] = random(dist(width/2, height/2, 0, TWO_PI));
//    salamiY[j] = random(dist(width/2, height/2, 0, TWO_PI));
    salamiX[j] = random(72, 425);
    salamiY[j] = random(72, 425);
//    salamiY[j] = random(dist(width/2, height/2, 75, 425));
  }
}


void draw(){
//  background(0);
    
  for(int i = 0; i < numSlice; i++){
    fill(255, 200, 130);
    stroke(0);
    strokeWeight(2);
    pizzaArc(400, sliceStart[i]);
    sliceStart[i] = (PI/4)*i;
  }
  for(int i = 0; i < numSlice; i++){
    fill(255, 255, 100);
    pizzaArc(350, sliceStart[i]);
    sliceStart[i] = (PI/4)*i;
  }
  
  for(int j = 0; j < numSalami; j++){
    fill(255, 50, 50);
    ellipse(salamiX[j], salamiY[j], 40, 40);
  }
  
  float r = 200;
  float distance = dist(width/2, height/2, mouseX, mouseY);
 
 
//---------PROBLEM-----------------having trouble with mousePressed & mouseClicked  
  if(mousePressed == true && distance <= r){
    fill(0);
    pizzaEaten(0);
  }
  
  
  
  
//-------PROBLEM--------------------How do you make the slices go a way one by one?
//  if(mousePressed == true && distance <= r){
//     for(int i = 0; i < 1; i++){
//      fill(0);
//      pizzaArc(400, sliceStart[i]);
//      sliceStart[i] = (PI/4)*i;
//     }
//  }
}


void pizzaArc(int d, float a){
  strokeWeight(2);
  arc(width/2, height/2, d, d, a, a + PI/4);
}

void pizzaEaten(int a){
  fill(0);
  arc(width/2, height/2, 400, 400, a, a +PI/4);
}


//-------failed attempts--------------------

//float r = 200;
//float distance = dist(width/2, height/2, mouseX, mouseY);
//
//void mouseClicked(){
//  if(mouseClick == false && distance <= r){
//    mouseClick = true;
//    pizzaEaten(0);
//  }
//}

//float r = 200;
//float distance = dist(width/2, height/2, mouseX, mouseY);

//void mouseClicked(){
//  if(distance <= r){
//    for(int i = 0; i < numSlice; i++){
//    fill(0);
//    pizzaArc(400, sliceStart[i]);
//    sliceStart[i] = (PI/4)*i;
//    i = 0;
//    }
//  }
//}



//NEED TO WORK ON SALAMI PLACEMENT
//NEED TO FIGURE OUT HOW TO MAKE THE SLICES DISAPPEAR AND NOT COME BACK WHEN MOUSE IS CLICKED

