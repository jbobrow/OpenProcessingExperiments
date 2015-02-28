
class Bird{
  
  PVector position;
  PVector velocity = new PVector(random(-2,2),random(-2,2));
  PVector acceleration = new PVector(0,0);
  color col;
  // if !male, obviously female...
  boolean male;
  int age = 0;
  int mass = 50;
  //mate buffer makes sure birds cant reproduce like crazy
  int mateBuffer = 0;
    Bird(float _x, float _y,color _col,boolean _male){
    this.position = new PVector(_x, _y);
    this.col = _col;
    this.male = _male;
  }
  
  
  void draw(){
    age++;
    if(mateBuffer > 0){
      mateBuffer--;
    }
    mass = mass + age/20;
    fill(col);   
    //changes stroke depending on gender
    if(male){
      strokeWeight(2);
     stroke(0,0,255);
    }else{
      stroke(255,0,0);
    } 
    //disable to show bird genders 
    noStroke();
    ellipse(position.x,position.y,10+age/100,10+age/100);
    

  }
  
  void move(){
    
    //limits acceleration
    acceleration.limit(.5);
    velocity.add(acceleration);
    //limits velocity
    velocity.limit(3);  
    position.add(velocity);
    //wall bouncing
    if(position.x >= width || position.x <= 0){
      velocity.x = -velocity.x/2;
      acceleration.x = -acceleration.x/2;
    }
    if(position.y >= height || position.y <= 0){
      velocity.y = -velocity.y/2;
      acceleration.y = -acceleration.y/2;
    }

    position.x = constrain(position.x,0,width); 
    position.y = constrain(position.y,0,height);  
  }
}

