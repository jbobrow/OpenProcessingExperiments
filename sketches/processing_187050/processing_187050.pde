
// Jesse Parker
// feb 24


color c=0;
float x = 0;
float y = 0;
float xspeed = 1;
float yspeed = 1;
float d =0;

void setup(){
  size(600,400);
}
 
void draw(){

  for(int i =0; i<width/50; i = i +2){ //local variable!
  for(int a =1; a<width/50; a = a+2){
     for(int j =0; j<height/50; j = j +2){
       for(int b =1; b<height/50; b = b +2){
    noStroke();
    fill(i*20, j*20,0);
    rect(i*50,j*50,50,50);
     fill(i*20);
     rect(i*50+20,j*50+20,20,20);
    fill(255-i*20);
    text(width/50*j+i,i*50+23,j*50+35);
      fill(a*20, b*20,255);
    rect(a*50,b*50,50,50);
     fill(a*20);
     rect(a*50+20,b*50+20,20,20);
    fill(255-a*20);
    text(width/50*b+a,a*50+23,b*50+35);
    if(mousePressed){
      c = color(random(255),random(255),random(255));
      background(c);
         noStroke();
    x += xspeed; // Increment x
    y += yspeed; // Increment y
 
    if (x > width || x < 0) {
      xspeed *= - 1;
    }
 
    if (y > height || y < 0) {
      yspeed *= - 1;
    }
 
  d = dist(x,y, mouseX,mouseY);
  if(d < 25){
    c = color(random(255),random(255),random(255));
    x = random(width);
    y = random(height);
    xspeed = random( -3,3);
    yspeed = random( - 3,3);
  }
  fill(255);
  ellipse(x,y,50,50);
  fill(255);
  ellipse(x,y,2,2);
      
    }
     }
  }
  
}
}
}

