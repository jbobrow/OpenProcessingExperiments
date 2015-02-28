
void setup(){
  size(400,400);
}
int i=1;
int j=1;
void draw(){
for(int x=0;x<width;x+=50){
stroke(40,100,x,20);
noFill();
pushMatrix();
    translate(200,200);  //move the origin to the point(50,50)
    rotate(radians(i));          //rotate from the center, convert degrees to radians
    translate(100,0);             //set the radius
    rotate(radians(j + 25));     //rotate the ellipse about the next axis
    ellipse(200,200,x,x);          //draw the ellipse
popMatrix();
}
for(int y=0;y<width;y+=30){
stroke(40,y,40,20);
pushMatrix();
    translate(200,200);  //move the origin to the point(50,50)
    rotate(radians(i));          //rotate from the center, convert degrees to radians
    translate(100,0);             //set the radius
    rotate(radians(j + 15));     //rotate the ellipse about the next axis
    line(200,200,y,y);          //draw the ellipse
popMatrix();
  j+=30;
  i++;
  
}



}

