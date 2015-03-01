
int x=390+50;
float y=450;
float my=0;
float grav=0.1;
int f1=0;
int c;
int b;
boolean a=true;
float angle=(PI/-15);
float i=0;
void setup() {
  size(1600,900);   
}

void draw() {
  translate(width/2, height/2);
  background(255);
  fill(150);
  textSize(20);
  text("Press any key to restart",1600/2-250,410);
  fill(0);
  textSize(100);
  c= int( randomizer(200));
  b=int(randomizer(200));
   if (mouseX<x+185 && mouseX>x && mouseY<y+80 && mouseY>y){
      a=false;
   }
   if (a==false){
     if(f1==0){
     angle=angle+(PI/2000);
     }
     if(angle>PI/36){
       f1=2;
     }
     if(f1==2){
       angle=angle-(PI/2000);
     }
     if(angle<=PI/-70 && f1==2){
       f1=3;
     }
     if(f1==3){
       angle=angle+(PI/2000);
     }
     if(angle>=0 && f1==3){
       angle=0;
     }
      y=my+y;
      my=my+grav;
      text("UN", x-width/2, y-height/2);
      rotate(angle);
      text("BALANCE", 575-width/2, 450-height/2);
      
      if(y>=height){
        my=my*-0.65;
        
      }

   } 
   else {
    rotate(angle);
    text("BALANCE", 575-width/2, 450-height/2);
    text("UN", x+c -200-width/2, y+b-200-height/2);
   }
 }
      
float randomizer(int n){
  float s= random(-2,2);
  float d;
  d=n+s;
  return d;
}

void keyPressed() {
  a=true;
  y=450;
  angle=(PI/-15);
  f1=0;
}


