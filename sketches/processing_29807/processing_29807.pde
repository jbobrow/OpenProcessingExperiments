
int num = 20;
int[] dx = new int[num];
int[] dy = new int[num];

void setup(){
  size(100,100);
  for ( int i=0; i<num; i++){
    dx[i] = i * 5;
    dy[i] = 12 + (i * 6);
  }
}

void draw(){
background(255);
for (int i = 0; i < num; i++) {
   dx[i] = dx[i] + 1;
   if (dx[i] > 100) {
   dx[i] = -100;
   }
 
 diagonals(dx[i], dy[i]);
}
}

void diagonals(int x, int y) {
    line(x, y, x+20, y-40);
    line(x+10, y, x+30, y-40);
    line(x+20, y, x+40, y-40);
}


/*
int x =0;
int y =55;

void setup(){
  size (100,100);
  smooth();
  stroke(255);
}

void draw(){
 background(0);
 //x=mouseX;
 //y=mouseY;
 
 if (x<width){
 x=x+1;
 }
 else{
 x=-40;
 }
 line(x   , y , x+20 , y-40);
 line(x+10, y , x+30 , y-40);
 line(x+20, y , x+40 , y-40);
}

/*
int x;
int y;

x=5;
y=80;

line(x   , y , x+20 , y-40);
line(x+10, y , x+30 , y-40);
line(x+20, y , x+40 , y-40);
line(x+30, y , x+50 , y-40);
line(x+40, y , x+60 , y-40);


/*
line(10, 80, 30, 40); // Left line
line(20, 80, 40, 40);
line(30, 80, 50, 40); // Middle line
line(40, 80, 60, 40);
line(50, 80, 70, 40); // Right line

//ellipse(10,80,5,5);
//ellipse(30,40,5,5);
*/

