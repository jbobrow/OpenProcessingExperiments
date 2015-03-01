
Eye e1, e2;

void setup()
{

  size(500, 500);
  
 

  smooth();

  noStroke();
  

background(61, 120, 129);

//line(30, 30, 30, 200);
//line(30, 200, 200, 200); 
//line(200, 30, 200, 200);
//line(30, 30, 200, 30);

//line(x, x, x, y);
//line(x, y, y, y); 
//line(y, x, y, y);
//line(x, x, y, x);
//line(x,y,y,x);
//line(x,x,y,y);
//line( x, (x+y)/2, y, (x+y)/2);
//line((x+y)/2,x,(x+y)/2,y);


ellipseMode(CENTER);

noStroke();
fill(17, 22, 62);
triangle(250, 100, 50, 450, 450, 450);


fill(255, 220, 180);
ellipse(250, 180, 250, 270);


fill(17, 22, 62);
arc(250, 180, 250, 270, 2.6, 6.8);


fill(17, 22, 62);
triangle(140, 50, 150, 120, 250, 75);
triangle(300, 75, 370, 50, 360, 130);
rect(150, 160, 200, 50);
triangle(250, 180, 230, 240, 270, 240);




fill(182, 154, 121);
ellipse(218, 170, 60, 60);
ellipse(282, 170, 60, 60);


//fill(255, 252, 252);
//ellipse(218, 170, 50, 45);
//ellipse(282, 170, 50, 45);


fill(56, 151, 255);
ellipse(220, 170, 10, 10);
ellipse(280, 170, 10, 10);

fill(17, 22, 62);
rect(180, 120, 150, 50);

stroke(100);
strokeWeight(2.5);
line(220, 260, 260, 270);


noStroke();

  e1 = new Eye( 280, 170, 50);

  e2 = new Eye( 220, 170, 50);
}



void draw() 

{

  



  e1.update(mouseX, mouseY);

  e2.update(mouseX, mouseY);




  e1.display();

  e2.display();
}



class Eye 

{

  int ex, ey;

  int size;

  float angle = 0.0;



  Eye(int x, int y, int s) {

    ex = x;

    ey = y;

    size = s;
  }



  void update(int mx, int my) {

    angle = atan2(my-ey, mx-ex);
  }



  void display() {

    pushMatrix();

    translate(ex, ey);

    fill(255);

    ellipse(0, 0, size, size);

    rotate(angle);

    fill(56, 151, 255);

    ellipse(size/7, 0, size/4, size/4);

    popMatrix();
    
   fill(17, 22, 62); 
   rect(150, 142, 200, 30);
  }
  
 
}



