
void setup() { 
  size(600, 600);
}

float angle = PI/12;

void draw() {

  translate(width/3, height);
  
  tree(120, 15, 20, angle);
}

void tree(float d, float r, float num, float a) {


  pushMatrix();
  rotate(a);
  if (r < 10){
     stroke(#3B9B1C);
     fill(#4BB927);
     
    }
    else {
     stroke(#AD7B1E);
     fill(#B78323); 
    }
    
  for (int i = 0; i < d; i ++) {

    ellipse(noise(i, i+5)*5, -(i+r/2), r, r);

    if (i == d - 1) {
      float t_x = noise(i, i+5)*5;
      float t_y = -(i+r/2);
      translate(t_x, t_y);
    }
  }



  if (r > 1) {

    //num -= 20;
    //d -= 10;
    r -= 2;

    

    tree (d-20, r, num, -angle);
    tree (d-20, r, num, angle*2);
    tree (d-20, r, num, angle);
    tree (d-20, r, num, -angle*2.5);
  }

  popMatrix();
}
