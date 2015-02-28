
//Rotation testing
//Coursera Course on Processing

float counter = 0;
float speed = 0;

void setup(){

    size(600,400);
    background(0);
    noFill();
    stroke(255);
    strokeWeight(2);
    
}//end of setup

void draw(){
   
   translate(250,250);
   background(0);
   for(int i = 0; i < 20; i++){
       rotate(counter);
       rect(i , i , i * 5, i * 5);
   }
   
   counter = counter + speed;
   speed = map(mouseX , 0 , width , -0.01 , 0.01);
   
    

}//end of draw
