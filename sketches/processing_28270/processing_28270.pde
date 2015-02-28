
void setup()
{
size(500,500);
background(151,134,255);

  smooth();
  rectMode(CENTER);
}


void draw (){
  
  
  float f_eins = 0;
float f_zwei = TWO_PI/400;

for (int y=0; y<height;y=y+20){
 
for(int i=-10; i<width+30; i=i+5) {

 fill(f_eins*11,0,f_zwei*50);
  ellipse(i, height/2+sin(f_eins)*250,58, 20);
  f_eins = f_eins + f_zwei;

}

}

   if (mousePressed == true) {
float f_eins2 = 0;
float f_zwei2 = TWO_PI/400;

for (int y=0; y<height;y=y+20){
 
for(int i=-10; i<width+30; i=i+5) {

 fill(f_eins2*11,0,f_zwei2*50);
  ellipse(i, height/2+sin(f_eins2)*250,random(50,64), 20);
  f_eins2 = f_eins2 + f_zwei2;

}

}
   }
}

