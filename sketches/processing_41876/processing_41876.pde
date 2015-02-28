
int i=400;

void setup(){
size (400,400);
smooth();
}

void draw (){
  fill(255);
 //if (mousePressed){ 
if (mousePressed){
//for (int y1=0; y1<mouseY; y1 = y1+25){ 
       //background(200);
       if (mouseY>0){
       for (int x1=0; x1<width; x1 = x1+100){
       noStroke();
       fill(255,0,0);  
       triangle(x1,height,x1+50,mouseY, x1+100,height);
       fill(255,250,0);  
       triangle(x1+20,height,x1+50,mouseY+50, x1+80,height);
       }
       }
      else{
      fill(200);
      rect(0,0,400,400);
      }
}
  for (int y=0; y<mouseY; y = y+25){ 
       //background(200);
       fill(255);
       for (int x=0; x<width; x = x+25){
       noStroke();  
       ellipse (x,y,10,10);
       }
  }
if (keyPressed || key==ENTER){
  if (i>=0){
       rect (0,i,400,400);
       i=i-2;
       }
  }     
}

                
                
