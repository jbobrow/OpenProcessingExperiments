
 int diameter=50;
 
void setup(){
  
 size(600,600);
 background(0);
 }



void draw(){
  background(0);
  for( int i = 50;
  i < 600;
  i+=50 )
  { fill( 255,255,255);
    ellipse(i,mouseX,diameter,mouseY);
  }
  
}
float diameter = 20;
int num = 20;
int b;
boolean a ;
float c; 
 
void setup()
{
    size(600, 600);
    stroke(0); 
    b=0; 
}
void draw() { 


    for (int x = width/num; x < width; x += width/num) { 
        for (int y = height/num; y < height; y+= height/num) {  
   if(dist(mouseX,mouseY,x,y)<20){
 fill(30,25,180);
 ellipse(x,y,30,30);}

 
 else{
 
            fill(255,255,255);
            ellipse(x, y, diameter, diameter);}

         
        }
    }
     
}



