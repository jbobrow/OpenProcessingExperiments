
balloon one;
balloon two;
balloon three;
balloon four;
balloon five;
balloon six;
balloon seven;
balloon eight;
balloon nine;
balloon ten;
balloon eleven;
balloon tweleve;
balloon thirteen;
PImage sky;


void setup() {
  size(350, 800);
  smooth();
  one = new balloon("A", 50, 20,random(0.5));
  two = new balloon("R", 80, 60,random(0.5));
  three = new balloon("T", 110, 60,random(0.5) );
  four = new balloon("C", 120, 60,random(0.5));
  five = new balloon("E", 140, 60,random(0.5));
  six = new balloon("N", 160, 20,random(0.5));
  seven = new balloon("T", 180, 60,random(0.5));

  eight = new balloon("E", 230, 60,random(0.5) );
  nine = new balloon("R", 255, 60,random(0.5));
  ten = new balloon("C", 2870, 60,random(0.5));
  eleven = new balloon("O", 299, 20,random(0.5));
  tweleve = new balloon("L", 310, 60,random(0.5));
  thirteen = new balloon("L", 300, 60,random(0.5) );

  textSize(40);
  sky = loadImage("1.png");
}

void draw() {
  background(255);

image(sky, 0, 0);



  one.update(); 
  one.display();
  one. wrap();


  two .update(); 
  two .display();
  two . wrap();

  three .update(); 
  three .display();
  three . wrap();

  four .update(); 
  four .display();
  four . wrap();

  five .update(); 
  five .display();
  five . wrap();
  
  six.update(); 
  six.display();
  six. wrap();


  seven .update(); 
  seven .display();
  seven . wrap();

  eight .update(); 
  eight .display();
  eight . wrap();

  nine .update(); 
  nine .display();
  nine . wrap();

  ten .update(); 
  ten .display();
  ten . wrap();

  eleven.update(); 
  eleven.display();
  eleven. wrap();


  tweleve .update(); 
  tweleve .display();
  tweleve . wrap();

  thirteen .update(); 
  thirteen .display();
  thirteen . wrap();
}

class balloon {
  //data
  float xpos, ypos;
  float w, h;
  float fillVol;
  float yspeed;
  String name;
  float r;
  float g;
  float b;
  float t;
float s;

  balloon( String n, float x, float y,float s ) {
    xpos = x;
    ypos = y;
    w=75;
    h=100;
    yspeed= random(1.5, 5);
    s=random(0.5);
    r = random(255);
    g = random(255);
    b = random(255);
    t = 150;
    name=n;
  }

  void display() {
  

    stroke(100);
    strokeWeight(2); 
    line( xpos, ypos+50, xpos, ypos+250);


    
fill(r, g, b, t);   

    noStroke();
  
    ellipse(xpos, ypos, w, h);
  triangle(xpos, ypos+50,xpos-10, ypos+65,xpos+10, ypos+65);
  
  
    fill(1);
    text(name, xpos-13, ypos+20);
    
       fill(r, g, b, t);   

noFill();
    pushMatrix();
    stroke(255,190);
    strokeWeight(3);
    arc(xpos, ypos, w-20, h-20, radians(-65), radians(0));
    arc(xpos, ypos, w-20, h-20, radians(20), radians(30));
    popMatrix();
  
  }
  
  
  void update() {
    ypos = ypos - yspeed;
    
  }

  void wrap() {
    if (ypos < -250) {
      ypos = height+250;
    }
  }
}





