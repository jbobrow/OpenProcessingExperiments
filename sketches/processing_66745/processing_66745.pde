
float x;
float y;
float x2;
float y2;
float xr;
float yr;
float xr2;
float yr2;
int divisions;

void setup(){
  size(600,600);
  stroke(255);
  background(0);
}

void draw(){
  
}

void mouseReleased(){
  spider((int)random(20,150));
}

void spider(float r){
  for(int i=0; i<8; i++){
    x =  (float)(mouseX+(r*Math.sin((i+1)*(PI/4))));
    y =  (float)(mouseY+(r*-Math.cos((i+1)*(PI/4))));
    x2 = (float)(mouseX+(r*Math.sin((i+2)*(PI/4))));
    y2 = (float)(mouseY+(r*-Math.cos((i+2)*(PI/4))));
    divisions = 10;
    noFill();
    line(mouseX, mouseY, x, y);
    for(int j=0; j<divisions; j++){
      xr = (float)(mouseX+((r/divisions)*j*Math.sin((i+1)*(PI/4))));
      yr =  (float)(mouseY+((r/divisions)*j*-Math.cos((i+1)*(PI/4))));
      xr2 = (float)(mouseX+((r/divisions)*j*Math.sin((i+2)*(PI/4))));
      yr2 =  (float)(mouseY+((r/divisions)*j*-Math.cos((i+2)*(PI/4))));      
      bezier(xr, yr, xr, yr, xr2, yr2, xr2, yr2);
    }
  }
}

