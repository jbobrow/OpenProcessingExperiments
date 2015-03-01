
void setup(){
size(900,550);
rect(20,60,70,90);
background(42,0700,0200);
frameRate(8);
}

void draw(){{ 

for(int X = 0; X< 950; X = X+50){
  fill(random(160,180),0200);
 for( int Y = 0; Y < 600; Y = Y +50)
{ //fill(random(50,250),0,200);
 rect( X-20, Y-20, 30, 30);
 rotate(radians(45));
 rect( X-10, Y-10, 30, 30);
 rotate(radians(45));
 rect( X-50, Y-50, 30, 30);
 rotate(radians(45));
 rect( X-60, Y-60, 30, 30);
 rotate(radians(45));

 rect( X-100, Y-100, 30, 30);
 rotate(radians(45));
 rect( X-150, Y-120, 30, 30);
 rotate(radians(45));
}
}
}
}
