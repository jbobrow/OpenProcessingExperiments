
int chaos = 5;

void setup(){
 
  size(500,800);
  background(0,0,30);
  smooth();
  fill(245,245,255,10);
  stroke(245,245,255,0);

int b = 45;
while(b<500) {
  
  //--------------LINE OF LINES-------------------------------
    int a = 10;
          int mysize = 80;
    while(a < height) {
      ellipse(b, a, mysize, mysize);
      ellipse(b+30, a, mysize, mysize);
      ellipse(b-5, a+10, mysize, mysize);
       ellipse(b+35, a+10, mysize, mysize);
       ellipse(b-10, a+20, mysize, mysize);
       ellipse(b+40, a+20, mysize, mysize);
       ellipse(b-15, a+30, mysize, mysize);
       ellipse(b+45, a+30, mysize, mysize);
      ellipse(b-20, a+40, mysize, mysize);
       ellipse(b+50, a+40, mysize, mysize);
      ellipse(b-25, a+50, mysize, mysize);
       ellipse(b+55, a+50, mysize, mysize);
       ellipse(b-20, a+60, mysize, mysize);
       ellipse(b+50, a+60, mysize, mysize);
       ellipse(b-15, a+70, mysize, mysize);
       ellipse(b+45, a+70, mysize, mysize);
        ellipse(b-10, a+80, mysize, mysize);
       ellipse(b+40, a+80, mysize, mysize);
        ellipse(b-5, a+90, mysize, mysize);
       ellipse(b+35, a+90, mysize, mysize);
       
      line(b, a, b+30, a);
      line(b-5,a+10,b-5+40,a+10);
      line(b-10,a+20,b-10+50,a+20);
      line(b-15,a+30,b-15+60,a+30);
      line(b-20,a+40,b-20+70,a+40);
      line(b-25,a+50,b-15+70,a+50);
      line(b-20,a+60,b-10+60,a+60);
      line(b-15,a+70,b-5+50,a+70);
      line(b-10,a+80,b-0+40,a+80);
      line(b-5,a+90,b+35,a+90);
      a = a + 100;
    }
    //------------------------------------------------------
    b = b + 95;
}

}

