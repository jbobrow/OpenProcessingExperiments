
float circle_x[] = {
};
float circle_y[] = {
};
float x[] = {
};
float y[] = {
};

void setup() {
  size(500, 500);
stroke(255,0,0);
}


void draw() {

  smooth();
  fill(0,10);
  rect(0,0,width,height);
  
  
  noFill();
  
  int i = 0;
  while (i<circle_x.length) {

    



    ellipse (circle_x[i], circle_y[i], 50, 50);

   
    circle_x[i]= circle_x[i] + x[i];
    circle_y[i] = circle_y[i] + y[i];


    if (circle_x[i] > width) {
    
      circle_x[i] = width;
      x[i] = -x[i];

    }

    if (circle_y[i] > height) {
  
      circle_y[i] = height;
      y[i] = -y[i];

    }

    if (circle_x[i] <0) {
     
      circle_x[i] = 0;
      x[i] = -x[i];

    }

    if (circle_y[i]<0) {
      
      circle_y[i] = 0;
      y[i] = -y[i];

    }
    i=i+1;
  }
}
    void mousePressed() {
      circle_x=append(circle_x, mouseX);
      circle_y=append(circle_y, mouseY);
      x=append(x, random(-2, 2));

      y=append(y, random(-2, 4));
    }
  




