
int h;
int w;

void setup() {  
  size(400, 400);
  w = width;
  h = height;
}

//int w = width;
//int h = height;

void draw() { 
  background(255);
  strokeWeight(10);
  fill(255);
  ellipse(w/2, h/2, w*2/3, h*2/3);
  line(w/3, h*2/3, w*2/3, h*2/3);
  ellipse(w*3/5, h/2, 20, 20);
  ellipse(w*2/5, h/2, 20, 20);
  
  if(mousePressed == true) { 
    background(20, 200, 50);
    fill(255, 255, 10);
    strokeWeight(1);
    triangle(w*2/3,10, w*2/3,370, 30,w*2/3);
    triangle(20,20, 390,h/2, w/3,370);
    fill(255);
    strokeWeight(10);
    ellipse(w/2, h/2, w*2/3, h*2/3);
    fill(200, 0, 0);
    arc(w/2, h*2/3-45, w/3, h/3, 0, PI);
    fill(255);
    rect(w/3, h/2, w/3, 30);
    rect(275, 275, 75, 100);
    rect(350, 275, -25, -50);
    for (int i=0; i<=3; i++) {
    line(275, 275+(25*i), 325, 275+(25*i));
    arc(w*3/5, h/3+30, 40, 40, PI, TWO_PI);
    arc(w*2/5, h/3+30, 40, 40, PI, TWO_PI);
    }
  }
}
                    
