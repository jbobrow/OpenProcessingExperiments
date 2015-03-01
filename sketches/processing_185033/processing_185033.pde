
size(400,400);
background(0);


noFill();
strokeWeight(1);
for(int i=0;i<=400;i+=10){
  
  
 for (int p=0;p<=200;p+=5) {

//colors slowly changing   
 float r= map(i,0,400,0,100);
  float g= map(i,0,400,255,100);
   float b= map(i,0,400,200,255);
   
//color 
   stroke(r,g,b);
   
   //target pattern
   ellipse(width/2,height/2,i,i);
   
   //background pattern
   rect(0,0,p*2,p*2);
 } 
  
  
}


