
int cant = 5;

PVector [] c = new PVector [cant];

void setup () {
  size (950,500);
  background(255);
  smooth();  
  frameRate(128);
  for (int i = 0; i < cant; i++){
    c[i] = new PVector (width/2,height/2);      
  }  
  fill(250);
}

float r = 20;


void draw () {
  for (int i = 0; i < cant; i++){
    ellipse(c[i].x,c[i].y,r,r);
  }
  ani ();
}

void ani () {
  for (int i = 0; i < cant; i++){
    c[i].x = c[i].x + random(-5,5);
    c[i].y = c[i].y + random(-5,5);
  }
  r = r - 0.02;
  if(r < -30){
    r = 20;
  }    
}

void mousePressed () {
  background(255);
   for (int i = 0; i < cant; i++){
     c[i] = new PVector (width/2,height/2);    
  } 
  r = 20;
}



                
                
