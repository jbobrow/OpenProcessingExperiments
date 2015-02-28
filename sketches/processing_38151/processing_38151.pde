
void setup(){
  
size(250,250);
frameRate(2000);

}

void draw(){
  //creates the white squares randomly between 0 and 100 in both x and y directions
  stroke(155);

  //creates white rectangles that are randomly spawned within the boundaries given
  for(float a=random(0,width); a<=width; a+=100){
    for(float b=random(0,height); b<=height; b+=100){
      fill(155);
  rectMode(CENTER);
  rect(a,b,random(1,4),random(1,4));

//creates the "fuzz" in the back
stroke(random(30,40),random(30,40),random(30,40));

for(int x=0; x<=width; x+=random(4)){
  for (int y=0; y<=height; y+=random(3)){
    point(x,y);
   
}}}}}
 





