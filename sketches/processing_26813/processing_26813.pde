
//Louisa  2011

//DECLARE VARIABLES
float theta;

//INITIAL SETTINGS
void setup(){
size(200, 200);
smooth();
theta= 0.0;
}

//REPEAT
void draw(){
  background(105, 52,255);
  theta += 0.02;
  fill(0);
  float x = theta;
  for (int i = 0; i < 20; i++){
    float y = sin(x)* height/2;
    ellipse(i * 10, y + height/2, 15, 15);
    x += 0.2;
    
  }
}
  
    
    




//EVENT HANDLERS

//CUSTOM FUNCTIONS

//CLASSES

