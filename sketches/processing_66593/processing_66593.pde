
void setup() {
  size(500,500);
   
  noStroke();
  smooth();
   
  for (int i=0; i<400 ;i=i+10) {//one:create integer;two;test;third:do once per loop
    fill(255,100,50,i);
    ellipse(width/2, i*4, i, i);
    //
  }
   
   for(int i = 0; i < 200; i+=10){
    fill(100);
   ellipse(i*4, height/2, 200-i, 200-i); 
   }
   
//    for (int i=400; i>0 ;i=i-10) {//one:create integer;two;test;third:do once per loop
//    fill(255,100,50,125-i);
//    ellipse(i*4, height/2, 400-i*2, 400-i*2);
//    //
 // }
}

