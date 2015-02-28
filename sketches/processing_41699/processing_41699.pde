
int j = 0;
Cat[] cats = new Cat[20];


void setup() {
  size(500, 500);
  
 int i = 0;
  
  while (i < 20){
  
  cats[i] = new Cat(width/2,i*10,random(5));  
   
   cats[i].meow();
  
  
  i++;

 
  
  }
}


void draw() {

int i = 0;  
  
  background(150);
  
  while(i < 20){
  
  cats[i].drawMe();
  cats[i].run();
  
  i++;
  
  }

}





class Cat {

  float speed;
  float xPos;
  float yPos;

  Cat(float x,float y, float s) {
    
    xPos = x;
    yPos = y;
    speed = s;
  }


  void meow() {
    println("meow");
  }

  void run() {
    xPos = xPos+speed;

    if (xPos > width) {
      xPos = 0;
    }
  }

  void drawMe() {

    fill(255);
    noStroke();
    ellipse(xPos, yPos, 20, 20);
    ellipse(xPos+10, yPos-5, 10, 10);
    stroke(0);
    line(xPos-10, yPos, xPos-25, yPos);
  }
}


