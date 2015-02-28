
Person p1;// p1-p5 all start as non-infected
Person p2;
Person p3;
Person p4;
Person p5;
Virus v1;// virus


void setup() { // starting parameters for sketch
  size(800, 600);// canvas
  background(#09080E);// background 
  // frameRate(20);

  p1 = new Person(13); // p1-p5 & virus initialized  
  p2 = new Person(10);
  p3= new Person (8);
  p4 = new Person(13);
  p5= new Person(9);
  v1 = new Virus(10);
}

void draw() { // cycling through animation
fill(#09080E, 5);
rect(0,0, width, height);
  p1.display();
  p1.move(); // movement is initially limited
  p2.display();
  p2.move();
  p3.display();
  p3.move();
  p4.display();
  p4.move();
  p5.display();
  p5.move();
  v1.display();
  v1.move();


  if (v1.infect(p1)) { //communication between objects, if the virus intersects with a person, the person takes on the virus characteristics
    p1.inter();
    println("match");
  } else {
   p1.safe();
  }
 
 
  if (v1.infect(p2)) { //communication between objects, if the virus intersects with a person, the person takes on the virus characteristics
    p2.inter();
    println("match");
  } else {
   p2.safe();
  }
  
  
   if (v1.infect(p3)) { //communication between objects, if the virus intersects with a person, the person takes on the virus characteristics
    p3.inter();
    println("match");
  } else {
   p3.safe();
  }

   if (v1.infect(p4)) { //communication between objects, if the virus intersects with a person, the person takes on the virus characteristics
    p4.inter();
    println("match");
  } else {
   p4.safe();
  }
    
   if (v1.infect(p5)) { //communication between objects, if the virus intersects with a person, the person takes on the virus characteristics
    p5.inter();
    println("match");
  } else {
   p5.safe();
  }
   



  if (keyPressed)         //Press R to restart
    if (key == 'r' || key == 'R') {
      setup();
    } //--end keyPressed
}



class Person {

  float x, y, m;
  float randomInfect;
  int s;
  int probVirusMove, probInfect, random;
  color cv, cv1, cv2, cp, cp1;




  Person (int _s) {
    x = random(800);
    y = random(600);
    m = .1;
    s= _s;
    probVirusMove=3;
    probInfect=94;
    cp1=color (#DD8830);
    cv1= color(#506477);
    cv2= color(#576691);
    cp=cp1;
  }

  void display( ) {
    noFill();
    stroke(cp);
    ellipse(x, y, s, s);
  }

  void move() {
 int option =  int(random (4));
    if (cp==cv1 || cp==cv2) { 
           
     
      if (option == 0) {      
       
          x = x + (m*100);
     
      } 
      else if (option == 1) {
      
          x = x - (m*100);
     
      } 
      else if (option == 2) {
      
          y = y + (m*100);
       
      } 
      else if (option==3){
       
          y = y - (m*100);
      
      } 
     x = constrain(x, 0, width);
      y = constrain(y, 0, height);  
   }
     
    if (cp==cp1) {      
      if (option == 0) {
        x = x + m;
      } 
      else if (option == 1) {
        x = x - m;
      } 
      else if (option == 2) {
        y = y + m;
      } 
      else {
        y = y - m;
      } 

      x = constrain(x, 0, width);
      y = constrain(y, 0, height);
    }
  }
  //walk() end


  //INTERSECT & NOT INTERSECT FUNCTIONS: CHANGE COLOR 
  void inter() { 

    randomInfect= int(random(100));// establishes a probability for infection based on percentage of men and women in US
    float probability= probInfect/2; //men
    if (randomInfect> probability) { //women
      cp = cv1; //women
      println ("match");
    } 
    else { 
      cp=cv2; //men
      println("check");
    }
  }

  void safe () {
    cp=cp;
  }


/*not using this right now*/
  boolean infect (Person p0) {   // Use Object as arguments in functions 
    //while (cp== cv1 || cp==cv2) {
    float d = dist(x, y, p0.x, p0.y);  
    if (d < (10 + p0.s)) {         //multiplying *5 to increase possibility
      return true;
    } 
    else {
      return false;
    }
  }
}

class Virus {
  float x, y, m;
  float randomInfect;
  int s;
  int probVirusMove, probInfect, random;
  color cv, cv1, cv2, cp, cp1;

  Virus (int _s) {
    x = random(800);
    y = random(600);
    m=.1;
    s=_s;
    probInfect=94;
    cp1=color(#DD8830);
    cv1= color(#506477);
    cv2= color(#576691);//(#F0D53F);
    cv=cv2;
  }

    void display( ) {
      noStroke();
      fill(cv);
      ellipse(x, y, s, s);
    }

    void move() {
      int option =  int(random (4));
    
      if (option == 0) {      
       
          x = x + (m*100);
      
      } 
      else if (option == 1) {
       
          x = x - (m*100);
      
      } 
      else if (option == 2) {
      
          y = y + (m*100);
      
      } 
      else if(option==3){
       
          y = y - (m*100);
       
      }    


      x = constrain(x, 0, width);
      y = constrain(y, 0, height);
    } //walk() end


  

    boolean infect (Person p0) {   // Use Object as arguments in functions 

      float dV = dist(v1.x, v1.y, p0.x, p0.y);  


      if ((dV >0) && (dV < 10 + p0.s) ) {         //multiplying *5 to increase possibility
        return true;
    
      } 
      else {
        return false;
      }
    }
  }
