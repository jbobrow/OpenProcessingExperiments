
int numLines;
void setup() {
  size(500, 500);
  
  numLines=12;
 
}
void draw() {
 
  for (int i = 0; i < numLines; i = i + 1) { // so here we draw from y = 0 to y = height
    line(i * width/numLines, 0, i * height/numLines, height);   // incrementing along the x axis every 50
    println("i is equal to:  " + i);   // pixels
    
      

   
    
  }
 
  for (int i = 0; i < numLines; i = i + 1) { // and here we draw from (wi
    line(0, i * width/numLines, width, i * height/numLines);
    println("i is equal to:  " + i);
  }
  for (int i =0;i<numLines;i++){
    for(int ii =0;ii<numLines;ii++){
      ellipse(i * width/numLines+ height/numLines/2,ii * height/numLines+ height/numLines/2, height/numLines, height/numLines);
    }
  }
 
 //notice we can use the iterator variable 'i' over again, as it is declared in
  //the forLoop, it is only local to the specific forLoop it is created in
  
}
 
//why 50 as the increment, why not?  try creating a variable gridWidth and using
//it instead
