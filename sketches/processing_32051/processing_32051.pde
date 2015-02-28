
void setup(){
 
  size(500,800);
  background(0,0,20);
  smooth();
  fill(240,240,255,80);
 stroke(255,255,255,0);
  strokeWeight(2);
  
  
int b = 45;
while(b<500) {
  
  //--------------LINE OF LINES-------------------------------
    int a = 10;
          float mysize = random(90);
    while(a < height) {
 /*     ellipse(b, a, mysize, mysize);
      ellipse(b+30, a, mysize, mysize);
      ellipse(b-5, a+10,mysize, mysize);
       ellipse(b+35, a+10, mysize, mysize);
       ellipse(b-10, a+20,mysize, mysize);
       ellipse(b+40, a+20, mysize, mysize);
       ellipse(b-15, a+30, mysize, mysize);
       ellipse(b+45, a+30, mysize, mysize);
      ellipse(b-20, a+40,  mysize, mysize);
       ellipse(b+50, a+40, mysize, mysize);
      ellipse(b-25, a+50,  mysize, mysize);
       ellipse(b+55, a+50, mysize, mysize);
       ellipse(b-20, a+60, mysize, mysize);
       ellipse(b+50, a+60, mysize, mysize);
       ellipse(b-15, a+70, mysize, mysize);
       ellipse(b+45, a+70, mysize, mysize);
        ellipse(b-10, a+80, mysize, mysize);
       ellipse(b+40, a+80, mysize, mysize);
        ellipse(b-5, a+90, mysize, mysize);
       ellipse(b+35, a+90, mysize, mysize);
       */
       float mysize2 = random(35);
       
         ellipse(b, a, mysize2, mysize2);
      ellipse(b+30, a, mysize2, mysize2);
      ellipse(b-5, a+10, mysize2, mysize2);
       ellipse(b+35, a+10, mysize2, mysize2);
       ellipse(b-10, a+20, mysize2, mysize2);
       ellipse(b+40, a+20, mysize2, mysize2);
       ellipse(b-15, a+30, mysize2, mysize2);
       ellipse(b+45, a+30, mysize2, mysize2);
      ellipse(b-20, a+40, mysize2, mysize2);
       ellipse(b+50, a+40, mysize2, mysize2);
      ellipse(b-25, a+50, mysize2, mysize2);
       ellipse(b+55, a+50, mysize2, mysize2);
       ellipse(b-20, a+60, mysize2, mysize2);
       ellipse(b+50, a+60, mysize2, mysize2);
       ellipse(b-15, a+70, mysize2, mysize2);
       ellipse(b+45, a+70, mysize2, mysize2);
        ellipse(b-10, a+80, mysize2, mysize2);
       ellipse(b+40, a+80, mysize2, mysize2);
        ellipse(b-5, a+90, mysize2, mysize2);
       ellipse(b+35, a+90, mysize2, mysize2);

       
  
      a = a + 100;
    }
    //------------------------------------------------------
    b = b + 95;
}

}

