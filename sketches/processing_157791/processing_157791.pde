

int x, y; // translation x and y variables
float howManyLines = 1;

void setup(){
  size(600,400);
  stroke(255);
}

void draw(){
  background(0);
  //howManyLines = (mouseX / 1.5);
  howManyLines*=1.006;
  
  /*
  if (int(howManyLines%2) == 0){
   stroke(0, 200, 255); 
   strokeWeight(2);
  } else {
   stroke(100, 200, 50);
  strokeWeight(1); 
  }
  println(int(howManyLines%2));
  */
  
  
  translate(x,y);

  
  for ( float i = 0; i <= howManyLines; i++){
    
    float maxWeight = 3;
    
    float ii = i;
    float spacing = height / (howManyLines); 
    
    
    float percentComplete = i / howManyLines;
      //stroke(200 + (255 * percentComplete));
    float myWeight = percentComplete * maxWeight;
      
    
    if (i > howManyLines - i){ // causes it to expand in the middle
      ii = -i;
      myWeight = maxWeight - maxWeight * percentComplete; 
    } else {
    }
      strokeWeight( myWeight);
    
    float lineStart = width * percentComplete + ii;
    float lineEnd = (width - width*percentComplete) - ii;
   
    line(    lineStart       , spacing * i,     lineEnd    ,spacing * i);
    
  }
  
}

void mouseDragged(){
 x += mouseX-pmouseX;
 y += mouseY-pmouseY;

}
