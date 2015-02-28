

ArrayList animals;
Animal temp_Animal;

float xdirection = .98;
float ydirection = .98;
float xspeed = 1;
float yspeed = 1;
float velocityX,velocityY;
int animal_how_many = 100;




void setup(){
  size(640,480,P3D);
  animals = new ArrayList();
}

void draw(){
  background(255);
  if(animals.size()<animal_how_many){
    for(int i=0;i<animal_how_many;i++){
      animals.add(new Animal(random(0,width),random(0,height),i/2,100,random(5),random(0,255)));
    }
  }
 if(animals!=null){
    for(int i=0;i<animals.size();i++){
      temp_Animal=(Animal)animals.get(i);
      temp_Animal.draw();
      temp_Animal.move();
      if(mousePressed){
        temp_Animal.Vektor(mouseX,mouseY);
        temp_Animal.xprev = temp_Animal.xprev-temp_Animal.dx;
        temp_Animal.yprev= temp_Animal.yprev-temp_Animal.dy;
      }
      else
        temp_Animal.xnow+=random(-1,1);
      temp_Animal.ynow+=random(-1,1);
    }
  }
  control();
}

void control(){
  if(keyPressed&&key=='+'){
    animal_how_many=100;
  }
  if(keyPressed&&key=='-'){
    animal_how_many=1;
  }
}



