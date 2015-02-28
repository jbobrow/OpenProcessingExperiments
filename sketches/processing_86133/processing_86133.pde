
int current_key= -1;
PFont f;
float key_x;
float key_y;
float key_rot;

float key_x_mov;
float key_y_mov;
float key_rot_mov;

float theta;

void setup(){
  size(400,400);
  smooth();
  init_params();  
}


void draw(){
  background(0);  
  
  //look for a reset button
   
  if (keyPressed){
    current_key = (int)key;
  }
  
  if (current_key != -1) {
    
    if (key_x <= 0.0)
      key_x_mov = random(0.0, 1.0);
    else if (key_x >= 400.00)
      key_x_mov = random(-1.0, 0.0);
    if (key_y <= 0.0)
      key_y_mov = random(0.0, 1.0);
    else if (key_y >= 400.00)
      key_y_mov = random(-1.0, 0.0);
    else {
      key_y_mov = random(-1.0, 1.0);
      key_x_mov = random(-1.0, 1.0);
    }
    key_rot_mov = random(-1.0, 1.0);
    textFont(f,36);
    
    pushMatrix();
    
    //translate(key_x, key_y);
    //translate(key_x, key_y);
    rotate(theta);   
    //rotateX(radians(key_rot));
    //rotateY(radians(key_rot));
    char letter = (char)current_key;
    text(letter, key_x , key_y );
    key_x += key_x_mov;
    key_y += key_y_mov;
    key_rot += key_rot_mov;
    theta += 0.1;   

    popMatrix();
        
    println("current_key = " + current_key + " key_x" + key_x + " " + key_y);
  }
  else{
    text("Please select a key to start", 10 , 50);
  }
   
}



void init_params(){
  
  f = createFont("Arial",16, true);
  textFont(f,10);
  fill(255);
  
  key_x = random(width) ;
  key_y = random(height);
  key_rot = random(360);
  
  
  
}
