
 int x=1;
 int r=(int)random(15,31);
 PImage b;
void setup()
{
  b = loadImage("bob.jpg");
 size(422,264);
frameRate(1);

}

void draw()
{
  x=1;
 background(b);
 if (r%6==0){
   fill(160,16,16);
 }
 if (r%4==0){
   fill(16,48,160);
 }
 if (r%12==0){
   fill(104,10,118);
 }
 if((r%15==0) || (r%6==0) || (r%10==0)){
   while(x<=r){
     ellipse(int(random(300)),int(random(300)),int(random(80)),int(random(80)));
     x=x+1;
   }
 }
 if (r%3==0) {
   while(x<=r) {
     int a=int (random(45,70));
   ellipse(int(random(300)),int(random(300)),a,a);
   x=x+1;
   }
 }
 
  if (r%5==0) {
   while(x<=r) {
     int b=int (random(45,70));
  rect(int(random(300)),int(random(300)),b,b);
  x=x+1;
   }
 }
    
    if (r%2==0) {
   while(x<=r){
   rect(int(random(300)),int(random(300)),int(random(80)),int(random(80)));
   x=x+1;
   }
   }
   println(r);
   r=2*r;
   if(r>=150){
   r=(int)random(15,31);
 }   
}



