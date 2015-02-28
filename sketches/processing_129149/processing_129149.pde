
int a = 400;

void setup(){
size(600,600);
background(220);


}

void draw(){
  while(a < 800){
    fill(255,0,0);
    
   line(0,100,600,a);
  a = a+2;
  line(100,100,600,a);
  a = a+2;
  line(200,100,600,a);
  a = a+2;
  line(300,100,600,a);
  a = a+2;
  line(400,100,600,a);
  a = a+2;
  line(500,100,50,a);
  a = a+50;
  }
  
  }


