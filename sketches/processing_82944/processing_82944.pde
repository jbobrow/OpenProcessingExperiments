
int count=0;
PImage bill;
int x = int(random(15,30));
void setup(){
  size(1024,768);
  bill = loadImage("hi.jpg");
  frameRate(5);
  background(bill);
}
void draw(){
  if ((x%15==0) || (x%6==0) || (x%10==0)){
    while(count<x){
      if ((x%6==0) && (x%4==0)){
        fill (136,3,255);}  
      if (x%6==0){
        fill(255,3,4);}
      if  (x%4==0){
        fill (3,8,255);} 
      int t = int(random(2,200));
      int q = int(random(0,200));
      int y = int(random(0,1024));
      int z = int(random(0,768));
      ellipse(z,y,q,t);
      count=count+1;}}
  else{
  if (x%3 == 0){
    while (count<x){
      if ((x%6==0) && (x%4==0)){
        fill (136,3,255);}  
      if (x%6==0){
        fill(255,3,4);}
      if  (x%4==0){
        fill (3,8,255);} 
      int q = int(random(0,200));
      int y = int(random(0,700));
      int z = int(random(0,1000));
      ellipse(z,y,q,q);
      count = count + 1;}}
   if (x%5 == 0){
     while (count<x){
      if ((x%6==0) && (x%4==0)){
        fill (136,3,255);}  
      if (x%6==0){
        fill(255,3,4);}
      if  (x%4==0){
        fill (3,8,255);} 
       int q = int(random(0,200));
       int y = int(random(0,700));
       int z = int(random(0,1000));
       rect(z,y,q,q);
       count=count+1;}}
   if (x%2 ==0){
     while (count<x){
      if ((x%6==0) && (x%4==0)){
        fill (136,3,255);}  
      if (x%6==0){
        fill(255,3,4);}
      if  (x%4==0){
        fill (3,8,255);} 
       int t = int(random(2,200));
       int q = int(random(0,200));
       int y = int(random(0,700));
       int z = int(random(0,1000));
       rect(z,y,q,t);
       count=count+1;}}}
    textSize(100);
    text(x,900,100);}



