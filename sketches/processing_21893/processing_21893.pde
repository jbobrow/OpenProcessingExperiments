
int x=0;
void setup(){
  size(500,500);
}
void draw(){
if(keyPressed==true){
  fill(170,141,143);
  for(int m=0; m<500; m+=100){
    for(int n=50; n<500; n+=100){
    rect(n,m,50,50);
    rect(n,m,40,40);
    rect(n,m,30,30);
    }
  }    
for(int o=0; o<500; o+=100){
  for(x=50; x<500; x+=100){
    fill(141,170,164);
    rect(o,x,50,50);
    rect(o,x,40,40);
    rect(o,x,30,30); 
  }
}
  fill(81,149,145);
  ellipse(random(height),random(width),15,15);
  fill(32,88,84);
  ellipse(random(height), random(width),18,18);
  fill(1,118,112);
  ellipse(random(height), random(width),13,13);
  fill(34,67,106);
  ellipse(random(height), random(width),10,10);
  fill(4,63,134);
  ellipse(random(height), random(width),20,20);
  fill(144,71,120);
  ellipse(random(height), random(width),17,17);
  fill(113,25,84);
  ellipse(random(height), random(width),19,19);
  fill(77,118,68);
  ellipse(random(height), random(width),22,22);
  fill(31,88,20);
  ellipse(random(height), random(width),12,12);
  fill(68,111,23);
  ellipse(random(height), random(width),24,24);
  fill(111,83,23);
  ellipse(random(height), random(width),25,25);
  fill(147,118,56);
  ellipse(random(height), random(width),20,20);
  fill(147,61,56);
  ellipse(random(height), random(width),9,9);
}
}




