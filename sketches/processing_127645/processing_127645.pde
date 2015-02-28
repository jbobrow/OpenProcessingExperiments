
//Felipe Martinez
//1-9-2014
//My first game




int t =1;
int z =1;
int x= 1;
int y= 1;

void setup (){
  
size (600,650);
}


void draw(){

  background (255);
 { fill (0,255,0);
rect (0,550,600,50);
}
 
  {noStroke ();
  fill(255,0,0);
  ellipse(x,y,50,50);

if (key == 'w') { 
  y = y-6;
}
  
  if (key == 'd'){
    x = x + 6;
  }
if (key == 's') {
  y= y +6;
}
if (key == 'a'){
  x = x-6;
}
  
if (x > 600) {
 x = x-9 ;
 }
 else if (x < 0) { 
   x = 9;
 }
if (y > 580) {
  y = y-9;
}
else if ( y < 0){
  y = 9;
}
  }
{
fill (0,0,255);
ellipse (z,t,50,50);

if (key=='l'){ 
  z = z + 6;
}
if (key == 'i'){
  t = t - 6;
}

if (key == 'j') {
  z = z - 6;
}

if (key == 'k'){
  t = t + 6;
}
if (z > 600){
  z = z -9;
}
else if (z < 0){
  z = 9;
}
if (t > 580){
  t = t -9;
}
else if (t < 0){
  t = 9;
}


{ textSize(32);
fill(0,0,0);
text("FINISH",250,  580);
}




}




}












  
