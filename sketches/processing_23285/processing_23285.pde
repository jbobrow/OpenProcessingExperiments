
float speed; 

void setup(){
  size(800,700);
 background(0,0,0); 
 
  fill(255);
  smooth();
}
  
  
void draw(){
    
speed = abs (pmouseX - mouseX);
  
  stroke(random(255),random(255),speed);
  strokeWeight(10);
  
  
                                println(speed);
  fill(random(255),speed,speed);
  ellipse(mouseX,mouseY,speed,speed);
  
}

void keypresses(){
  if(key == 's'){
    save("myPicture.tif");
    println("saved!");
    }
} 

