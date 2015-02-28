
void setup(){
  size(500,1000);
}

void bubble(float x,float y, float wdth, float hght ){
  
  
  stroke(1);
  ellipse(x,y,wdth,hght);
  noFill();
  arc(x,y,7*wdth/10,7*hght/10,PI/2,PI);
  arc(x,y,5*wdth/10,7*hght/10,PI/2,PI);
  line((x-(3.5*wdth/10)),y,(x-(2.5*wdth/10)),y);
  
}

void draw(){

bubble(50,50,50,50);
}

