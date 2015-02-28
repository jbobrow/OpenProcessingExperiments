
float angulo=0.0;
int vertical;
void setup(){
 size(300,300);
background(255);
  smooth();
  vertical=0;
  }
void draw(){
 background(255);
translate(200,vertical);
  rotate(angulo);
  rect(-30,-30,60,60);
  fill (random(250),random(250),random(250));
  angulo=angulo+0.1;
  vertical=vertical+2;
   if (vertical>258){
   vertical=258;
   angulo=1;
  }
  }


