
float x, y;
float vx, vy ;
float ay;
int[] xx = new int[100] ;
int[] yy = new int[100] ;

void setup() {
  size(600, 600);
  x = 0 ;
  y = 250 ;
  vx = 5 ;
  vy = 5 ;
  ay=0.5;
}

void draw() {
  background(250);
  
 for(int i=99; i>0; i--){
    xx[i]=xx[i-1];
    yy[i]=yy[i-1];
  chara(int(x), int( y));

  x = x + vx ;
  y = y + vy ;
  
  if (x > 600) {
  vx = -vx;
  background(#D0E67C);
}
if (x <- 5) {
  vx = -vx;
  background(#7CCDE6);
}
if (y > 550) { 
  vy = -vy;
  background(#F294E7);
} 

 
if (y < -5) 
{
  vy = -vy;
  background(#E67C7C);
}
 
  xx[0]=mouseX;
  yy[0]=mouseY;
  
  chara(xx[99],yy[99]);
  chara(xx[0],yy[0]);
 }

  
  

  if (mousePressed) {
    if ((mouseX > x-50) && (mouseX < x+50) && (mouseY > y-50) && (mouseY < y+50)); 
    x = mouseX ;
    y = mouseY ;
    vx = 0 ;
    vy = 0 ;
    
  }

  }
void mouseReleased() {
  vx = mouseX - pmouseX ;
  vy =mouseY -pmouseY ;

  vx = vx*0.2 ;
  vy = vy*0.2 ;


}

void chara(int a, int b) {
  pushMatrix();
  translate(a, b);
  stroke(0);
  strokeWeight(2);
  fill(255);

  scale(map(a, 0, 600, 2, 0));
  rotate(map(b, 0, 600, 0, radians(3600)));
 
translate(-50,-50);
  fill(111, 225, 000);
  ellipse(50, 50, 60, 60);
  //me
  line(40, 35, 32, 45);
  line(60, 35, 68, 45);
  //kuchi
  fill(a, b, 100);
  rect(40, 55, 20, 10);
  fill(111.225, 000);
  ellipse(50, 50, 30, 10);
  ellipse(50, 70, 30, 10);
  //ashi
  line(72, 70, 90, 90);
  line(28, 72, 10, 90);



  popMatrix();
}




