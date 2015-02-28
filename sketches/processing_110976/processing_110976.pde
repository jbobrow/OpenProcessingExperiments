
int flag = 0;
void setup(){
  size(500,500);
  translate(width / 2,height / 2);
  colorMode(RGB,256);
  frameRate(1000);
  ellipseMode(CENTER);
}
int r,g,b;
/*
float r = random(0,256);
float g = random(0,256);
float b = random(0,256);
*/
void draw(){
translate(width / 2,height / 2);
if(flag == 0){
  if(r<256){
    r++;
  }else if(g<256){
    g++;
  }else if(b<256){
    b++;
  }else{
    flag = 1;
    /*
    r = random(256);
    g = random(256);
    b = random(256);
    */
  }
}

if(flag == 1){
  if(r>0){
    r--;
  }else if(g>0){
    g--;
  }else if(b>0){
    b--;
  }else{
    flag = 0;
  }  
}
  background(r,g,b);
  fill(256-r,256-g,256-b);
  ellipse(0,0,400,400);
  fill(256-r+50,256-g+50,256-b+50);
  ellipse(0,0,300,300);
  fill(256-r+100,256-g+100,256-b+100);
  ellipse(0,0,200,200);
  fill(256-r+150,256-g+150,256-b+150);
  ellipse(0,0,100,100);
  println("R:"+r+" G:"+g+" B:"+b);
}
