
int diameter,top,left,i;
 
size(400,400);
noStroke();
 
int eSize = 10;  
 
size(400, 400);  
background(255,200,200);  
smooth();  
 
for(int y=0; y<=height; y+=20){
  for(int x=0; x<=width; x+=20){
 
    if(x > 100 && x < 300){  
      fill(255); 
    }
    else{    
      fill(#CCFFFF);  
    }
    ellipse(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y);  
  }
}
stroke(250,100,100 );
strokeWeight(10);

line(400,300,300,400);
line(400,250,250,400);
line(400,200,200,400);
line(400,150,150,400);

stroke( #CCFFFF );
noFill();
 
ellipseMode( CORNER );  
ellipse( 0, 0, 100, 100 ); 
 
ellipseMode( CENTER );  
ellipse( 250, 250, 100, 100 );
 
ellipseMode( CENTER_RADIUS ); 
ellipse( 250, 250, 100, 100 );





