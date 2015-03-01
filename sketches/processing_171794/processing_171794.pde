
int counter;
int width = 250;
int height= 250;

void setup() {  //setup function called initially, only once
  size(width, height);
  background(255);  //set background white
 
}

void draw() {  //draw function loops 
 
 stroke(0,0,255);
 fill(255)
 translate(width/2, height/2)
 arc(0,0,229,250,(2*PI)/3,(4*PI)/3);
 fill(0,0,255);
 text("0",-125,0); //0 inicio
 text("5",0,125); //5 pies minuto
 text("10",0,125); //10 pies minuto
 text("20",0,125); //20 pies minuto 

 
  
}
