
class Food {
  PVector pos,vel;
  float quantity,a,b,c,angle,BoWa,speed;
  String textFood;
 char[] letters; 
  boolean consumed=false;
  int g,co;
  
  float d0=10;
float d1=sqrt(sq(d0)+sq(3.3));
float d2=sqrt(sq(2*d0)+sq(3.3));
float d3=sqrt(sq(3*d0)+sq(2));
float an1=atan2(3.3,d1);
float an2=atan2(3.3,d2);
float an3=atan2(2,d3);


  Food(String _text, float _x,float _y,float _z) {
    pos = new PVector(_x,_y,_z);
    textFood = _text;
    quantity =(float)textFood.length()/2;
    letters = textFood.toCharArray();
    
    pos = new PVector(random(width),random(height),random(-500,500));
    vel = new PVector();
    vel.normalize();
    
    co = int(random(20,70));

      a = random(0,1);
      b = random(1,10);
  }

  void display() {
   if (!consumed) {
   
    move();
    ff.pushMatrix();
    ff.noStroke();
    ff.fill(255,100);
     ff.translate(pos.x,pos.y,pos.z);
     rotateY(atan2(-vel.z,vel.x)); 
     rotateZ(acos(vel.y/vel.mag()));
     ff.textFont(font);
     ff.textAlign(CENTER);
     //ff.textMode(SCREEN);
     ff.textSize(10);
     drawBody();
     //ff.hint(ENABLE_ACCURATE_TEXTURES); 
     //ff.text(textFood,0,-6);
     //ff.box(quantity);
    ff.popMatrix();
   }
  }
  
 void move() {
  // movement
  a += .005;
  b += .035;
  if (random(10)>9.5)  { 
  speed = 5*noise(b)/random(0.1,5);
  //if (random(10)>7)
  
 
  } else {
  speed = noise(b)*5;
  }
 vel.add(random(-0.05,0.05),random(-0.05,0.05),random(-0.05,0.05)); 
 vel.normalize(); 
 vel.mult(speed);
 pos.add(vel);

  //boundary
  if (pos.x>width+50) pos.x=-50;
  if (pos.x<-50) pos.x= width+50;
  if (pos.y>height+50) pos.y =-50;
  if (pos.y<-50) pos.y =height+50;
  if (pos.z>500) pos.z =-500;
  if (pos.z<-500) pos.z =500;

  //Fish wave the body according to its speed
  c += 0.1*speed;
  BoWa=sin(c)*PI/15;
}

void drawBody() {
  
  
  for (g=0;g<letters.length; g++) {
    ff.translate(6,0);
    //ff.translate(textWidth(letters[g]),0);
    ff.rotate(BoWa/8);
    ff.textSize(8);
    ff.text(letters[g],0,0);
  }
} 
  
  
  
}


