


//save as a new doc
float inc = 0.1;
float x,y,a,b,s,c;
float coa = 0;
float cob = 0;
float coc = 0;
int i;
int num = 0;
void setup() 
{
  frameRate(15000);
  background(255);
  //size(screen.width, screen.height);
  size(800,800);
  //strokeCap(PROJECT);

}

void draw() 
{
  println(frameRate);
  for (i = 0;i<1000;i++){
    coa = constrain(coa+random(-1,1),-255,255);
    cob = constrain(cob+random(-1,1),-255,255);
    coc = constrain(coc+random(-1,1),-255,255);
    stroke(coa,cob,coc,5);
    x=noise(a)*width;
    y=noise(b)*height;
    //s=noise(c);
    x=abs((x))%width;
    y=abs((y))%height;
    //s=abs(s)%3;
    strokeWeight(3);
    point(x,y);
    a += random(-inc,inc);
    b += random(-inc,inc);
    //c += random(-inc/10,inc/10);
  }
  for (i = 0;i<1000;i++){
    coa = constrain(coa+random(-1,1),-255,255);
    cob = constrain(cob+random(-1,1),-255,255);
    coc = constrain(coc+random(-1,1),-255,255);
    stroke(coa,cob,coc,5);
    x=noise(a)*width*3;
    y=noise(b)*height*3;
    //s=noise(c);
    x=abs((x))%width;
    y=abs((y))%height;
    //s=abs(s)%3;
    strokeWeight(3);
    point(x,y);
    a += random(-inc,inc);
    b += random(-inc,inc);
    //c += random(-inc/10,inc/10);
  }
  //saveFrame("anim-####.jpg");
}
void mouseClicked() {
  switch(num) {
  case 0: 
    noLoop();
    num = 1;  // Does not execute
    break;
  case 1: 
    loop();
    num = 0;  // Prints "One"
    break;
  }
} 



