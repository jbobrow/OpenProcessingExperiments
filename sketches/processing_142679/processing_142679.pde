
int two = 0;
int one = 0;
void setup(){
  size(850,850);
   background(6,6,6);
   frameRate(10);
}
void draw(){

       
  for (one = 10; one < height; one=one+100){
    for(two = 20; two < width; two=two+100){
    stroke(255);
  fill(random(0,255));  
    triangle(one,two,one+10,two+10,one,two+20);
    triangle(one+10,two+10,one+20,two+20,one+10,two+30);
    triangle(one,two,one-10,two-10,one,two-20);
      triangle(one+10,two+10,one,two,one+10,two-10);
    triangle(one-10,two,one,two+10,one-10,two+20);
    triangle(one,two-10,one-10,two-10,one,two-20);
    triangle(one-10,two-20,one-20,two-20,one-10,two-30);

    }

  }  
     saveFrame();        
}

