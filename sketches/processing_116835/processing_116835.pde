
float a;
float b;
float c;
float d;
float f;
int x;
int y;

void setup(){
  size(600,600);
  background(0);
  text("press mouseleft to start drawing",width/2,height/2);
  frameRate(30);
  f=random(500,800);
//  a=random(0,20);
//  b=random(0,600);
//  c=random(580,600);
//  d=random(0,600);
 // x=abs(mouseX-pmouseX);
  //y=abs(mouseY-pmouseY);
}

void draw(){

  if (mousePressed && (mouseButton == RIGHT)){
    strokeWeight(random(1,10));
    stroke(0);
    line(0,b,600,d);
    stroke(255);
  fill(0);
  rect(mouseX,mouseY,random(10,50),random(10,50));
b=mouseY-20+random(0,40);
  d=mouseY-20+random(0,40); 
  x=x+1;
  }
 // if (mousePressed && (mouseButton == LEFT)){
  //      line(a,0,c,600);
  //  strokeWeight(random(1,10));
   // stroke(255);
//a=mouseX-20+random(0,40);
 // c=mouseX-20+random(0,40); 
//  }
  if (mousePressed && (mouseButton == LEFT)){
        line(0,a,600,c);
    strokeWeight(random(1,10));
    stroke(255);
a=mouseY-20+random(0,40);
  c=mouseY-20+random(0,40); 
   stroke(255);
  fill(0);
  rect(mouseX,mouseY,random(10,50),random(10,50));
  x=x+1;
  }
  if (x>=f){
    background(0);
    fill(255);
    text("press mouseleft to restart drawing",width/2,height/2);
    f=random(500,800);
    x=0;
  }
  if (keyPressed){
    save("pic"+y+".jpg");
    y=y+1;
  }
    
}



