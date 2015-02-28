


void setup (){
  size(800,200);
  //not to get a random smiley every second
  noLoop();
}
void draw (){
   background(255);
   
   //2. call the function we created as manmy times as we want 
 for (int i=1; i<width; i+=100){

table(i,10, int(random(50,255)), random (-1,2) );
  
 }
   

}

// 1. create a function called smileyFace and store it in x and y if you want
void table( float x, float y, int fl, float theta){
  
pushMatrix();
translate(x, y);
fill(fl);  
rotate(theta);
rect(0, 0, 50, 60);// Black rectangle
beginShape();
vertex(0, 60);
vertex(50,60);
vertex(60, 70);
vertex(-10, 70);
endShape(CLOSE);
rect (-10,70, 70,10);
//feet
rect(-10,80, 10,50);
rect(50,80, 10,50);

rect(7,80, 10,30);
rect(32,80, 10,30);

popMatrix();

}




