
float ax = 220+250;
float ay = 180+250;

float bx = 280-250;
float by = 180+250;

float cx = 300-250;
float cy = 200+250;

float dx = 320-250;
float dy = 220+250;

float ex = 320-250;
float ey = 280-250;

float fx = 300-250;
float fy = 300-250;

float gx = 280-250;
float gy = 320-250;

//--HALFWAY--// -250  +250

float hx = 220+250;
float hy = 320-250;

float ix = 200+250;
float iy = 300-250;

float jx = 180+250;
float jy = 280-250;

float kx = 180+250;
float ky = 220+250;

float lx = 200+250;
float ly = 200+250;



void setup() {
  size(500, 500);
  smooth();       //gives lines smooth edges
}

int count = 0;
void keyPressed(){
if(key == 's'){
save("Finals_first_5/"+count+".jpg");
count++;
}
}

void draw() {
 

  strokeWeight(2); //2 pixels thick pen
  background(0); //COLOURS BACKGROUND WHITE
  stroke(255); // 'pen' color white.



  line(200, 300, 300, 200);  
  line(300, 300, 200, 200);  // X

  line(kx, ky-mouseX, ax, ay-mouseX);  //K , A
  line(gx, gy+mouseX, ex, ey+mouseX);   //e , g     //line ends
  line(hx-mouseX, hy, jx-mouseX, jy);
  line(bx+mouseX, by, dx+mouseX, dy);      //line ends

  line(kx-mouseY, ky, jx-mouseY, jy);      //left
  line(ax, ay-mouseY, bx, by-mouseY);      //top
  line(dx+mouseY, dy, ex+mouseY, ey);      //right
  line(hx, hy+mouseY, gx, gy+mouseY);      //bottom

  line(dx+mouseX,dy,dx+mouseY,dy);
  line(ex,ey+mouseX,ex+mouseY,ey); //right
  
  line(kx-mouseY,ky,kx,ky-mouseX);     //changed
  line(jx-mouseY,jy,jx-mouseX,jy);  //left
  
  line(ax,ay-mouseX,ax,ay-mouseY);
  line(bx+mouseX,by,bx,by-mouseY);  //top
  
  line(hx-mouseX,hy,hx,hy+mouseY);
  line(gx,gy+mouseX,gx,gy+mouseY);  //bottom
  
  //oh god
  
  //0-------0
  
  
  

}


