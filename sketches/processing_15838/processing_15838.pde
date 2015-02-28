
int a = 30;
int b = 30;
void setup () {
  size (800,600);
  background (102,12,15);
}

void draw (){
  fill (7,12,57,5);
  rect (0,0,800,600);
  noStroke ();
  //fill (15,20,126);
 for (int a =30; a<=770; a = a+11){
    for ( int b =30; b <=570; b = b+11){
    ellipse (a,b,10,10);
    //rect (0,0,800,600);
    fill (25,80,156,10);
    }    

  }
  for (int a=10; a<width; a=a+50){
    for (int b=10; b<height; b=b+50){
   //stroke (206,209,240);
      rect (a,b,30,30);
  //fill (random (10,12),random (100,126),random (18,25));
fill (random (80,102),random (10,12),random (9,5));    

    }
  }  
 
  
}



