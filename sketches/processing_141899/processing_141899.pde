

//class MyClass {

//public static void main(string args[]) {

//double a = Math.pow(5);

//MyClass obj = new MyClass();

//obj.setup();

//while(true) {
//    obj.draw();
//}

//}


float a;
float x=600;
float z=30;
float y=0;

void setup(){
  size(750,750);
  background(0);
  fill(0);
}

void draw(){
  a+=PI/102;
  x=x/1.001;
  y+=1;
  noStroke();
  translate(375,375);
  rotate(a);
  if (y%8==0){
    fill(255);
  }else if (y%8==4){
    fill(0);
  }else if (y%8==1){
    fill(210,210,0);
  }else if (y%8==5){
    fill(50,50,255);
  }else{
    noFill();
  }
  ellipse(x,0,x/5,x/3);
}

}
