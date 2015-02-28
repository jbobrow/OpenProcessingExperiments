
PrintWriter output;

int count = 0;
int x = 0;
int y = 0;
int i=0;
int timer = 0;
float m;

ArrayList xp = new ArrayList();
ArrayList yp = new ArrayList();

void setup(){
  output = createWriter("coordinates.txt");
  size(1240,800, P3D); 
  background(0);  
  noFill();
  stroke(255);
  strokeWeight(1);
  
}

void draw(){
  background(0);
  
  int sx,ex,sy,ey;
  float z = 0;
  xp.add(mouseX);
  yp.add(mouseY); 
  if(xp.size() > 1){
    for(int i = xp.size()-1 ; i > 0 ; i--){
	sx = (Integer) xp.get(i);
	ex = (Integer) xp.get(i-1);
	sy = (Integer) yp.get(i);
	ey = (Integer) yp.get(i-1);
	line(sx,sy,z,ex,ey,z-1);
	z -= 1;
}
 
    output.println ("x=" + mouseX);
    output.println ("y=" + mouseY);
    output.println ("z=" + z);
  } 
}
 void keyPressed(){ 
    output.flush();
    output.close();
    exit();
  }



