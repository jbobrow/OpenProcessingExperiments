
// define variables 
int Capital = 0;
float T = 0;
int lambda = 0.5;  //probability play game A
float p = 0.495;   //probability win game A
float p1 = 0.095;
float p2 = 0.745;
float R1,R2;
int M=3;
//set up canvas
size(500,500);
background(255,255,255);


//draw axis
stroke(0, 0, 0);
line(0,height/2,width,height/2);
line(0,0,0,height);
//start from (0,0)

//plot sample path of game A alone
stroke(0,0,250);
while (T<500) // Loop 500 coin tosses
{
        R1 = random(0,1);
      if ( R1 < p)  {
          line(T,height/2-Capital,T+1,height/2-Capital );
          Capital+=1;
          T +=1;
          }
      else{
          line(T,height/2-Capital,T+1,height/2-Capital );
          Capital -= 1;
          T +=1;
           }
}

//Plot sample path of game B alone
T=1;
Capital = 0;
stroke (0,150,0);

 while (T<500) //Loop through 500 coin tosses
{ 
  R1 = random(0,1);   //draw random number between 0 and 1
  R2 = random(0,1);
      if (Capital % M ==0 )
          {
             if ( R2 < p1 )  
              {
              line(T,height/2-Capital,T+1,height/2-Capital );
              Capital += 1;
              T +=1;
              }    
             else
              {
              line(T,height/2-Capital,T+1,height/2-Capital );
              Capital -= 1;
              T +=1;
              }
          }
      else
          {
              if (R2 < p2)
              {
              line(T,height/2-Capital,T+1,height/2-Capital );
              Capital += 1;
              T +=1;
              }    
             else
              {
              line(T,height/2-Capital,T+1,height/2-Capital );
              Capital -= 1;
              T +=1;
              }
          }
 }



//Plot sample path of random game A and game B
T=1; 
Capital = 0;
stroke(0,0,0);

 while (T<500) //Loop through 500 coin tosses
{ 
  R1 = random(0,1);   //draw random number between 0 and 1
  R2 = random(0,1);

  if (R1 < lambda) // Game A
  {
      if ( R1 < p){
          line(T,height/2-Capital,T+1,height/2-Capital );
          Capital+=1;
          T +=1;
          }
      else{
          line(T,height/2-Capital,T+1,height/2-Capital );
          Capital -= 1;
          T +=1;
           }
  }
  else            // Game B
  {
      if (Capital % M ==0 )
          {
             if ( R2 < p1 )  
              {
              line(T,height/2-Capital,T+1,height/2-Capital );
              Capital += 1;
              T +=1;
              }    
             else
              {
              line(T,height/2-Capital,T+1,height/2-Capital );
              Capital -= 1;
              T +=1;
              }
          }
      else
          {
              if (R2 < p2)
              {
              line(T,height/2-Capital,T+1,height/2-Capital );
              Capital += 1;
              T +=1;
              }    
             else
              {
              line(T,height/2-Capital,T+1,height/2-Capital );
              Capital -= 1;
              T +=1;
              }
          }  
  }
  
 }
  


