
int blueValue=250;
int blackValue=0;
int growing=1;
int growing2=1;
void setup () 
{
  size(1000,600);
 
}
void draw()
{
   background(0,0,blueValue,blackValue);//25,171,blue,black
  
   blueValue=blueValue+(growing);
   print("bluevalue=");
   println(blueValue);
   print("blackvalue=");
   println(blackValue);
   
   if(blueValue==0||blueValue==255 )
   {
     growing=growing*(-1);
   }
   blackValue=blackValue+(growing2);
  if(blackValue==0||blackValue==255 )
   {
     growing2=growing2*(-1);
   }
}


