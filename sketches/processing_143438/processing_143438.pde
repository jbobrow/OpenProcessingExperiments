
//Name: PARK Jeungeun  

//ID: 201420080  
float angle;
void setup(){ 
size(600, 600);
smooth();
}

void draw(){
  
  for(int a = 10; a<600; a = a+20){
  for(int b = 10; b<600; b = b+20){
  
   
      ellipse(a, b, 30, 30);
      fill(0);
      rect(a, b, 30,30);
      fill(151,252,69);
      ellipse(a, b, 20, 20);
      fill(227,16,203);
      ellipse(a, b, 10, 10);
      fill(5,249,255);
      
      strokeWeight(random(5));
     


    }
  }
}
    
