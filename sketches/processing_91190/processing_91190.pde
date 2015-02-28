
//recreate a pattern
int a= 240;
int k =275;
int s =0;
int c=80;
void setup () {
  size(300,400);
background(240,220,100);
smooth();
}

void draw() {
  stroke(1);
 
fill(240,200,90);
for (int y =0; y<=height; y+=20) {
  
for(int x=0;x<=width; x+=20) {
  
    fill(230,230,190);
   // middle square
   
   
    rect(x,275,20,150);// bottom
    rect(x,0,20,100);//top rows
    
    for (int i=0; i<400; i+=20){
      rect(80,x+20,160,90);//middle
  rect(y,x,0,100);// left and rigth middle bars

  
    
   
   
 rect(a,0,x,20);// right top squares
 rect(a,19,x,20);
 rect(a,39,x,20);
 rect(a,59,x,20);
 rect(a,79,x,20);
 

 for (int s=0; s>=100; s+=5);// top left squares
   rect(0,0,80,20);
   rect(s,20,80,20);
   rect(s,40,80,20);
   rect(s,60,80,20);
   rect(s,80,80,20);
   
   rect(80,k,20,130);// bottom middle square
   rect(100,k,20,130);
   rect(120,k,20,130);
   rect(140,k,20,130);
   rect(160,k,20,130);
   rect(180,k,20,130);
   rect(200,k,20,130);
   rect(200,k,20,130);
   rect(200,k,20,130);
   rect(220,k,20,130);
   

   rect(0,380,c,20);// bottom left
   rect(s,365,c,15);
   rect(s,345,c,20);
   rect(s,325,c,20);
   rect(s,300,c,25);
   rect(s,275,c,25);

//bottom right 
rect(240, 275,100,20);
rect(240, 295,100,20);
rect(240, 315,100,20);

rect(240, 335,100,20);
rect(240, 355,100,20);
fill(230,220,190);
rect(240, 375,100,24);
   
    
  }
    

 
  } 
  }


  
}
