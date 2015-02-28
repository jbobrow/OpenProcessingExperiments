
int [] xPosities = new int[10];
int [] yPosities = new int[10];

int schermX = 550;
int schermY = 550;

void setup(){
  size(schermX,schermY);
  smooth();
}


void draw(){
 background(0);
 
 noStroke(); 
 int xwaarde=int(map(mouseX, 0, schermX, 0, 255));
 int ywaarde=int(map(mouseY, 0, schermY, 0, 255));
 fill(255,xwaarde,ywaarde);
 
 for(int i=0; i < 10; i++){
   xPosities[i] = int(random(0,5))*100;
   yPosities[i] = int(random(0,5))*100; 
   
   tekenHartje(xPosities[i],yPosities[i]);  
 }
}

void tekenHartje(int x,int y){
  //triangle(x1, y1, x2, y2, x3, y3);
  triangle(x+31,y+58,x+131,y+58,x+81,y+125);
  //ellipse(x, y, width, height) 
  ellipse(x+56,y+46,55,55);
  ellipse(x+106,y+46,55,55);
}

