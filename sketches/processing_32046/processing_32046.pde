
void setup(){
 
  size(500,800);
  background(0,0,20);
  smooth();
  fill(240,240,255,0);
 stroke(255,255,255,70);
  strokeWeight(50);
  
  
int b = 45;
while(b<500) {
  
  //--------------LINE OF LINES-------------------------------
    int a = 10;
          int mysize = 15;
    while(a < height) {
      ellipse(b, a, (random(1,mysize)), (random(1,mysize)));
      ellipse(b+30, a, (random(1,mysize)), (random(1,mysize)));
      ellipse(b-5, a+10, (random(1,mysize)), (random(1,mysize)));
       ellipse(b+35, a+10, (random(1,mysize)), (random(1,mysize)));
       ellipse(b-10, a+20, (random(1,mysize)), (random(1,mysize)));
       ellipse(b+40, a+20, (random(1,mysize)), (random(1,mysize)));
       ellipse(b-15, a+30, (random(1,mysize)), (random(1,mysize)));
       ellipse(b+45, a+30, (random(1,mysize)), (random(1,mysize)));
      ellipse(b-20, a+40,  (random(1,mysize)), (random(1,mysize)));
       ellipse(b+50, a+40, (random(1,mysize)), (random(1,mysize)));
      ellipse(b-25, a+50,  (random(1,mysize)), (random(1,mysize)));
       ellipse(b+55, a+50, (random(1,mysize)), (random(1,mysize)));
       ellipse(b-20, a+60, (random(1,mysize)), (random(1,mysize)));
       ellipse(b+50, a+60, (random(1,mysize)), (random(1,mysize)));
       ellipse(b-15, a+70, (random(1,mysize)), (random(1,mysize)));
       ellipse(b+45, a+70, (random(1,mysize)), (random(1,mysize)));
        ellipse(b-10, a+80, (random(1,mysize)), (random(1,mysize)));
       ellipse(b+40, a+80, (random(1,mysize)), (random(1,mysize)));
        ellipse(b-5, a+90, (random(1,mysize)), (random(1,mysize)));
       ellipse(b+35, a+90, (random(1,mysize)), (random(1,mysize)));
       
  
      a = a + 100;
    }
    //------------------------------------------------------
    b = b + 95;
}

}

