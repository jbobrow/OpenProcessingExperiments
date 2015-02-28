
PImage bill;
int x=1;
int r=int (random(15,31));
void setup()
{
size(610,458);
frameRate(1);
bill = loadImage("boops.jpg");
}
void draw()
{
background(bill);
int x=1;
 
 {
   print("The random number is: ");
   print(r);
   println();
 }
 {
   if (r%6==0)
   fill(227,23,23);
 }
 {
  if (r%4==0)
  fill(46,67,198);
 }
 {
   if (r%12==0)
   fill(183,46,198);
 }
 if((r%6==0) || (r%10==0) || (r%15==0)){
   while(x<=r){
     ellipse(int(random(610)),int(random(458)),int(random(45)),int(random(45)));
     x=x+1;
   }}
 {
   if(r%3==0){
   while(x <=r)
   {
     int a=int (random(45,70));
   ellipse(int(random(610)),int(random(458)),a,a);
   x=x+1;
   }
 }
 }
  if (r%5==0)
  {
   while(x<=r)
   {
     int b=int (random(45,70));
  rect(int(random(610)),int(random(458)),b,b);
  x=x+1;
   }
 }
    if (r%2==0)
    {
   while(x<=r)
   {
   rect(int(random(610)),int(random(458)),int(random(45)),int(random(45)));
   x=x+1;
   }
    }
    r=2*r;
    if(r>=150){
      r=(int)random(15,31);
    }
  
 }   




