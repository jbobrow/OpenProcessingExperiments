
float angle = 0.0; 
float offset = 200; 
float scalar = 10; 
float speed = 0.02;
float preX = 0.00; 
float preY = 0.00; 
void setup() {
    size(400, 400);
    fill(0); 
    smooth();
    stroke (20); 
    //noLoop();
}

void draw() {
    if (angle < 100) {  
    float x = offset + cos(angle) * scalar;
    float y = offset + sin(angle) * scalar; 
    if (preX == 0.0){
      point( x, y ); //, preX, preY); 
    } else {
      line (x, y, preX, preY);
    }
    preX = x; 
      preY = y;
    angle +=  speed;
    scalar += (0.002* scalar) ;
   }
}   
