
int x = 300;
int y = 600;
float z = 30;
void setup(){
 size(600,600);
background(#FF0867);
}

void draw(){
  rectMode(CENTER);
  noStroke();
  fill(#3FFF00);
 while(x > 6){
   rect(x,600-x,y,z);
   rect(x,600-x,z,y);
   x = x/2;
   y = y/2;
   if(z>1){
   z = z*.33;
   }
   if(z<1){z=1;}
 }
}


