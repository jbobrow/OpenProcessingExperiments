
void setup(){
  size(600,600);
}
void draw(){
  if (key == 'q' || key == 'Q'){
      example1();}
  else if (key == 'w' || key == 'W'){
       example2();}
  else if (key == 'e' || key == 'E'){
        example3();}
}
float x=100;
float y=10;
int a=100;
int b=150;
int c=150;

void example1(){
  background(115,mouseY,10);
  rect(50,400,200,200);
  rect(350,400,200,200);
  rect(140,200,110,110);
  rect(350,200,110,110);
  rect(200,100,50,50);
  rect(350,100,50,50);
    for (int i =0;i<=100;i=i+3) {
    for(int j =0;j<100;j+=1) {
      line(mouseX,mouseY,x,y);
      noStroke();
      fill(y,mouseX,x);
      }
    }
}

void example2(){
  noStroke();
  background(mouseX,mouseY,100);
  ellipse(mouseX,600,50,50);
  ellipse(mouseX,500,50,50);
  ellipse(mouseX,400,50,50);
  ellipse(mouseX,300,50,50);
  ellipse(mouseX,200,50,50);
  ellipse(mouseX,100,50,50);
  ellipse(mouseX,0,50,50);
  for (int i=0; i<=100;i+=2) {
      noStroke();
      line(mouseX,mouseY,x,y);
      noStroke();
      fill(mouseX,0,100);
    }
}

void example3(){
  background(200,10,130);
  float x=mouseX;
  float y=mouseY;
  
  float d=dist(200,400,mouseX,mouseY);
  println(x,y);
  
  if(d<=50){
    c=255;
  }
    else{
      c=130;
    }
   fill(a,b,c);
   rect(100,100,100,100);
   rect(0,0,100,100);
   rect(200,200,100,100);
   rect(300,300,100,100);
   rect(400,400,100,100);
   rect(200,0,100,100);
   rect(400,0,100,100);
   rect(300,100,100,100);
   rect(400,200,100,100);
   rect(0,200,100,100);
   rect(100,300,100,100);
   rect(0,400,100,100);
   rect(200,400,100,100);
}


