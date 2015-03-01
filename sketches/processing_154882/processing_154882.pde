
float theta = 0.1;
float x = 10;
float y = 800;
float kx = 250;
float ky = 775;
float r = 10;
float ktheta = 0.1;
float ktheta2 = 0.1;
float wx = 260;
float wy = 775;
float wr;
float wtheta = 0.1;
float wtheta2 = 0.1;
float randcol1;
float randcol2;
float randcol3;
float incy = 5; 

void setup(){
  background(0);
  size(500, 1000);
  frameRate(1000);
  smooth();


  
}

void draw(){ 
  
  if(y>=775){
  stroke(230, 147, 58);
  if(y<=795){
    stroke(255);
  }
  point(x+10*cos(theta), y+10*sin(theta));
  theta+=0.1;
  x+=0.1;
  y-=0.01;
  }
  if(y<=775){
    randcol1 = random(255);
    randcol2 = random(255);
    randcol3 = random(255);
    fill(245, 72, 72, 100);
    ellipse(260, 775, 20, 20);
    stroke(randcol1, randcol2, randcol3);
    point(kx + r * cos(ktheta), ky + r * sin(ktheta2));
     point(kx + r * cos(ktheta), ky + r * sin(ktheta));
    r += 0.1;
    ktheta += 0.2;
    ktheta2 += 1;
    }
  if(ktheta>=1000){
    stroke(255);
    wr = random(5, incy);
    
    point(wx+wr*cos(wtheta), wy+wr*sin(wtheta2));
    wtheta += 0.1;
    wtheta2 += 0.1;
    wy -= 0.1;
    incy+= 0.05;
  }
 

}
















