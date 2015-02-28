
    //import processing.opengl.*;




int index;
float w,h;
float rx, ry;
int nx=11, ny=4;
float cols, rows;
float alphas;

void setup(){
  
 size(640,450); 
 smooth(); 
 w= width;
 h = height;
 
 for(int x= 0; x<nx; x++) {
        alphas = random(11); 
 }
 rows= ny;
 ry= h/rows;
}




void draw(){
  background(0);
  cols= (sin(index*0.009+(sin(index*0.0001)*21.0))*1.945+0.5)*(nx-1);
  rx= w/cols;
  
  for(int x=0;x<cols;x++)  {
    for(int y= 0; y<rows; y++) {
    float c= sin((index+(x*rows)+y)*cos(index*11.0012f)*(sin(index*11.09906f)*0.9f))*0.5f+0.5f;
                        float g= c*(sin(index*0.002f+(float(x)/nx*2*PI))*cos(index*0.019f+(float(y)/ny*2*PI)))*12.0f+9.0f;
  alphas =x*nx+y+ c;
  
  fill(c,c,random(255));
  stroke(0,0,random(255),random(255));
  rect(x*rx+g, y*ry+g, rx-(g*2), ry-(g*2));
  
  }
  }
  index++;
}
