
PFont fontA;

homosapien[] people;

void setup(){
  size(600, 600);
  smooth();

  people = new homosapien[20];
  // noLoop();
  // people1= new homosapien("Peter", 20, 'M', 170, 60);
  // people2= new homosapien("Gamma", 30, 'F', 180, 70);

  for (int i=0; i< 20; i++){
    if (i % 2 == 0){

      people[i] = new homosapien("P" + i, floor(10+random(30)), 'F', 100+random(80), 30+random(80));

    }
    else{

      people[i] = new homosapien("P" + i, floor(10+random(30)), 'M', 100+random(80), 30+random(80));
    }

    fontA = loadFont("Georgia-48.vlw");
  }
}//end of setup

void draw(){
  background(0);
  for (int i = 0; i < 20; i++){
    people[i].display();
  }
  //people2.display();

  for (int i = 0; i < 20; i++){
    people[i].move();
  }
  // people2.move();
}



class homosapien {
  //Properties
  char gender; // F or M
  float age;
  String name;
  float h; // height
  float w; // weight
  float r;
  float x,y; // location on the stage
  float vx, vy; //speed

  // constructor

  homosapien(String n, float a, char g, float hh, float ww){

    name=n;

    age=a;

    gender=g;

    h=hh;

    w=ww;

    x= random(width);

    y= random(height);

    vx=random(3.0);

    vy=random(3.0);



  }

  //method
  void selfintro(){
    if(gender == 'M'){
      println("Hello! My name is "+ name + " I'm "+age+" years old.");
    }
    else{
      println("Hello! My name is "+ name );

    }
  }
  void greet(homosapien p){
    println("Hi!" + p.name+". Glad to meet you.");
    selfintro();
  }
  void display(){
    if(gender =='M'){

      r=100;

      fill(50,50,150,70);

      noStroke();
    }
    else{
      r=50;
      fill(150,50,50,70);
      noStroke();
    }
    ellipse(x,y,r,r);
    fill (200);
    textFont(fontA, 12);
    text(name, x, y);
  }//end of display
  void move(){
    x = x + vx;
    y = y + vy;
    if (x < 0||x > width){
      vx= -vx;
    }

    if (y < 0||y > height){
      vy= -vy;
    }

  }

}// end of class








