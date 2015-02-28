

int[] memMouse =  new int[4];
int[] nowMouse =  new int[4];
int[] thenMouse =  new int[4];
int thenCount = 0;

int little = 5;
int middle = 10;
int big    = 25;

void setup() {
 
   size(700, 400); 
   background(#FFFFFF); 
   stroke(#CCCCCC);
}

void draw() {
  
  thenCount++;
  if (thenCount >= 250){
      updateThenMouse();
      thenCount = 0;
      thenBezier();

      println("then Bezier!");
  }
  lessCrazyBezier2();
    updateNowMouse();
  bezEraser();
}

void mouseMoved() {
    
  //crazyBezier();
  //lessCrazyBezier();
  lessCrazyBezier2();
  
  originalBezier();
            
    stroke(random(200, 225));
    curve(memMouse[0], memMouse[1], memMouse[2], memMouse[3], nowMouse[0], nowMouse[1], nowMouse[2], nowMouse[3] );
    
    //stroke(random(255), 64);
    // curve(memMouse[3], memMouse[2], memMouse[1], memMouse[0], nowMouse[3], nowMouse[2], nowMouse[1], nowMouse[0] );
    
   // stroke(random(255), 64);
    //fill(random(255), 32);
    //bezier(memMouse[3], memMouse[2], memMouse[1], memMouse[0], nowMouse[3], nowMouse[2], nowMouse[1], nowMouse[0] );
  
    updateMemMouse();
} 


void crazyBezier(){
    stroke(random(255), 64);
    fill(random(255), 32);
    bezier(memMouse[3]+ nowMouse[0] - memMouse[2] + nowMouse[1], 
            memMouse[1] + nowMouse[1] - nowMouse[2] + memMouse[3], 
            memMouse[rand4()], 
            memMouse[3], 
            nowMouse[rand4()], 
            nowMouse[1], 
            nowMouse[rand4()], 
            nowMouse[3] );
}

void lessCrazyBezier(){
    stroke(random(255), 16);
    fill(random(255), 16);
    bezier(memMouse[ rand4()],
            memMouse[rand4()], 
            memMouse[rand4()], 
            memMouse[3], 
            nowMouse[rand4()], 
            nowMouse[1], 
            nowMouse[rand4()], 
            nowMouse[3] );
}

void lessCrazyBezier2(){
    stroke(random(255),random(255),random(255), 16);
    fill(random(255), 16);
     bezier(memMouse[0] + int(random(-middle, middle)),        //coordinates for the first anchor point
            memMouse[1] + int(random(-middle, middle)), 
            memMouse[2] + int(random(-10, 10)), // coordinates for the first control point
            memMouse[3] + int(random(-10, 10)), 
            nowMouse[0] + int(random(-10, 10)), // coordinates for the second control point
            nowMouse[1] + int(random(-10, 10)), 
            nowMouse[2] + int(random(-10, 10)), // coordinates for the second anchor point
            nowMouse[3] + int(random(-10, 10)) );
}

void bezEraser(){
    stroke(random(200, 255),random(200, 255),random(200, 255), 16);
    // fill(random(230, 255), 64);
     fill(255, int(random(16,64)));
     bezier(memMouse[0] + int(random(-big, big)),        //coordinates for the first anchor point
            memMouse[1] + int(random(-big, big)), 
            memMouse[2] + int(random(-big, big)), // coordinates for the first control point
            memMouse[3] + int(random(-big, big)), 
            nowMouse[0] + int(random(-big, big)), // coordinates for the second control point
            nowMouse[1] + int(random(-big, big)), 
            nowMouse[2] + int(random(-big, big)), // coordinates for the second anchor point
            nowMouse[3] + int(random(-big, big)) );
}

void originalBezier(){
    stroke(random(255), 64);
    fill(255, int(random(16,64)));
    bezier( memMouse[0],        //coordinates for the first anchor point
            memMouse[1], 
            memMouse[2], // coordinates for the first control point
            memMouse[3], 
            nowMouse[0], // coordinates for the second control point
            nowMouse[1], 
            nowMouse[2], // coordinates for the second anchor point
            nowMouse[3] );
}

void thenBezier(){
    stroke((r255()), int(random(16)));
    fill(r255(), int(random(16)));
    bezier( thenMouse[0] + memMouse[0] + int(random(-big, big)) ,        //coordinates for the first anchor point
            thenMouse[1] + rangeRand(memMouse[3]) + rangeRand(big), 
            thenMouse[2] + rangeRand(memMouse[1]) + rangeRand(big), // coordinates for the first control point
            thenMouse[3] + rangeRand(memMouse[2]) + rangeRand(big), 
            nowMouse[0], // coordinates for the second control point
            nowMouse[1], 
            nowMouse[2], // coordinates for the second anchor point
            nowMouse[3] );
    bezier( thenMouse[0] - memMouse[0] - rangeRand(big) ,        //coordinates for the first anchor point
            thenMouse[1] - rangeRand(memMouse[1]) - rangeRand(big), 
            thenMouse[2] - rangeRand(memMouse[2]) - rangeRand(big), // coordinates for the first control point
            thenMouse[3] - rangeRand(memMouse[3]) - rangeRand(big), 
            nowMouse[3], // coordinates for the second control point
            nowMouse[2], 
            nowMouse[1], // coordinates for the second anchor point
            nowMouse[0] );     
            
    stroke((r255()), (r255()), (r255()), int(random(16)));
    fill(r255(), int(random(16)));      
    
    bezier( thenMouse[0] + rangeRand(memMouse[0]) + rangeRand(middle) ,        //coordinates for the first anchor point
            thenMouse[1] + rangeRand(memMouse[3]) + rangeRand(middle), 
            thenMouse[2] + rangeRand(memMouse[1]) + rangeRand(middle), // coordinates for the first control point
            thenMouse[3] + rangeRand(memMouse[2]) + rangeRand(middle), 
            nowMouse[0], // coordinates for the second control point
            nowMouse[1], 
            nowMouse[2], // coordinates for the second anchor point
            nowMouse[3] );
    bezier( thenMouse[0] - rangeRand(memMouse[0]) - rangeRand(middle) ,        //coordinates for the first anchor point
            thenMouse[1] - rangeRand(memMouse[1]) - rangeRand(middle), 
            thenMouse[2] - rangeRand(memMouse[2]) - rangeRand(middle), // coordinates for the first control point
            thenMouse[3] - rangeRand(memMouse[3]) - rangeRand(middle), 
            nowMouse[3], // coordinates for the second control point
            nowMouse[2], 
            nowMouse[1], // coordinates for the second anchor point
            nowMouse[0] );              
}

int rangeRand(int input){
   
    int output = int(random(-input, input));
    
    return output;
}

int r255(){
   
  int thisNum = int(random(255));
  return  thisNum;
  
}

int rand4(){
   
  int thisNum = int(random(4));
  return  thisNum;
  
}
  
void updateThenMouse() {
  thenMouse[0] = mouseX;
  thenMouse[1] =mouseY;
  thenMouse[2] = pmouseX;
  thenMouse[3] = pmouseY;
}

void updateMemMouse() {
  memMouse[0] = mouseX;
  memMouse[1] =mouseY;
  memMouse[2] = pmouseX;
  memMouse[3] = pmouseY;
}

void updateNowMouse() {
  nowMouse[0] = mouseX;
  nowMouse[1] =mouseY;
  nowMouse[2] = pmouseX;
  nowMouse[3] = pmouseY;
}

