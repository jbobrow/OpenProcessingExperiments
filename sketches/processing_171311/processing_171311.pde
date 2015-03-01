
void setup() {
  size(600, 600, P3D);
}


float RECT_SZ = 100;
float p = 0;

float distance = 100;
float d = 0;
float inc = 5;

boolean press = false;
boolean click = false;

void draw() {
  
  background(0); 
  stroke(255); 
  noFill();
  float a;
  
  if(click){
    
    for(int i = 1; i <= 5; i ++){
    fill(255);  
    rect(i*95,200,50,50);
    }
    
  }
    
    
  if (distance<d){
    d -= inc;
    press = true; 
  }
  else if (distance > d){
    d += inc;
    press = true; 
  }

  else if (distance == d) press = false;

  noFill();
  for (int i = 1; i <= 30; i ++) {
    float pp = p+i*100 + d ;
    if (pp < 100 ) a = 90;
    else if (pp <300) a = map(pp, 100, 300, 90, 0); 
    else if (pp< 500) a = map(pp, 300, 500, 0, -90); 
    else a = -90;
    ResetMatrix();
    Translate(pp, 400, 0); 
    RotateY(radians(a));
    DrawRect(-RECT_SZ/2, -RECT_SZ/2, RECT_SZ, RECT_SZ);
    
  }
  
  println(mouseX, mouseY);
}

void mousePressed(){
   if (mouseX> 250 && mouseX < 350) {
      if (mouseY> 350 && mouseY < 450){
         click =! click;
         
      }
    }
}
void keyPressed(KeyEvent event) {
  click=false;
  
  if (keyCode == RIGHT) {
    if (press == false) distance += 100;
  }
    
  else if (keyCode == LEFT) {
     if (press == false) distance -= 100;
  }
  
}



void DrawRect(float leftX, float upperY, float sizeX, float sizeY)
{
  float[][] pos = { 
    {
      leftX, upperY, 0, 1
    }
    , {
      leftX+sizeX, upperY, 0, 1
    } 
    , {
      leftX+sizeX, upperY+sizeY, 0, 1
    }
    , {
      leftX, upperY+sizeY, 0, 1
    }
  };
  float[] posFinal = new float[4]; 
  beginShape();
  for (int i=0; i<4; i++) {
    MatVec3d(Matrix, pos[i], posFinal);
    vertex(posFinal[0], posFinal[1], posFinal[2]);
  }
  endShape(CLOSE);
}

