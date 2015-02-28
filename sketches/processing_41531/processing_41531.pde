

void setup(){
  
 size(700,400);
 background(0);
 frameRate(40);


}

void draw(){
 fill(0,10);
 rect(-10,-10,710,410);
 smooth();

}
       



void lightning(){

 
int st=round(random(700)); 
int end=350;
int y = 0;
int y2 = 40; 


while ( y2 < 500){

 end = (st-40) + round(random(80));
 stroke (255);
  line ( st, y, end, y2);
  y = y2;
  y2 += round(random(80));
  st = end; 
 
 end = (st-40) + round(random(80));
 stroke (255);
  line ( st, y, end, y2);
  y = y2;
  y2 += round(random(80));
  st = end;
}
}

void mouseClicked() {
 lightning();

}

