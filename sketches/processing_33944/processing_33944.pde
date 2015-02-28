
int savedTime;
int totalTime = 2000;


void setup(){
   size(500,500);
   background(255); 
   savedTime = millis(); 
  
}

void draw(){
    //stroke(0,167,178);
    strokeWeight(6);
    if(mousePressed == true){
    line(pmouseX,pmouseY,mouseX,mouseY);  
    }  
  
  int passedTime = millis()-savedTime;
  if(passedTime > totalTime){
    println("I changed the time! yay!");
    float b = random(0,255);
    stroke(b,10,255);
    savedTime = millis ();
}

}


