
//Cascading Ellipses, Example from class
//Every third ellipse is filled red. 

size(100,600);
smooth();
float ypos = 30;
int d = 60;

for(int i=0; i<=10; i++)
{
   if(i%3 ==0) { // every third...
     fill(255,0,0);
   } else {
     fill(255); 
   }
   
   ellipse(width/2, ypos, d,d);
   ypos += d;  
}

/*
//Alternative Method
size(100,600);
smooth();
int d = 60;

for(int i=30; i<=height; i+=d)
{
   if((i-30)%90 ==0) { // every third...
     fill(255,0,0);
   } else {
     fill(255); 
   }
   
   ellipse(width/2, i, d,d);
}
*/



