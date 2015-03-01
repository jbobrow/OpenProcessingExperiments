
size(400, 400);
//background(211,0,0);
//different background color when stop/run
{
  background(random(0,255),random(0,255),random(0,255));
}


for (int z=0;z <= height; z+= 60) {
for (int e=0;e <= width; e += 60) {
  
  noFill();
    ellipse(z, e, 60, 80);




 // determines the d in the rect shape
int d=80;

//colors rects
color squares = color(random(0,255));

 //y less than H
for (int y=0;y<height;y+=50) {
 //x less than W 
  for (int x=10
  ;x<width;x+=100) {
    
    //rect shape  
    
    stroke(random(0,255), random(0,255), random(0,255));
    strokeWeight(3);
    fill(squares);
    rect(x, y, d, d, 25);
    






 

}
    
}}
    
  }



