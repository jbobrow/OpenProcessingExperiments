

float theta,x,y,speed,deg;

Thing first;

void setup(){
  size(500,500);
  x = 50;
  y = 50;
  deg=0;
  
  speed=0;
  
  first = new Thing();
  
}

void draw(){
  background(0);
  fill(255);
  
  
  
  
  for(int i= 0, o =50;i<11;i++){
    for(float j= 0, k = 50;j<11;j++){
      
      first.roro(k,o);  
      
      k+=30;
     
      
    }
    o+=30;
    
  }
  
  first.makero();
  
}

class Thing{

 Thing(){

   
 }
  
    void roro(float thing, float thing2){
      

      pushMatrix();
      rectMode(CENTER);

      translate(thing,thing2);
      rotate(deg);
    
      ellipseMode(CENTER);
      
      arc(0,0,30,30,PI,TWO_PI);

      popMatrix();
      
    }
    
    void makero(){
      
      deg+=.05;
      
      if(deg==360||deg==-360){
        deg=0;
      }
      println(deg); 
      
      
    }

}


