

Tri t = new Tri();
Tri t1 = new Tri();

void setup() {
  size(748, 800);
  background(0);
}

void draw(){
  t.lines(); //Draw lines effect for small triangles var "t"
  
  fill(t.x,t.y+100,0,20); //Fill of background triangles
  t1.triPattern(100,100); //Draw big triangle pattern var "t1"
  
  fill(t.x+100,0,t.y,100); //Fill of small triangles
  t.triPattern(20,140); //Draw small triangle pattern var "t"
  
  //Don't refresh when big triangles finish first.
  //Refresh Background only when small triangle finishes its bottom row.
  
  if(t.x ==0 && t.y == 0){
    background(random(0,20));
    t1.x = 0;
    t1.y = 0;
  }
  
}

class Tri {
  float x, y; //pattern starting point 
  float ln; //length of triangle sides
  float dist = 20.0; //distance between triangles
 
  Tri() {
    //set starting point of pattern
    x = 0;
    y = 0;
  }

  void triPattern(float templength, float distance) {
    //Gets user input for length of triangle and distance between triangle in the x-axis
    noStroke();
    ln = templength;
    dist = distance;

    //Draw Upward or Downward Triangle
    if (random(1) > 0.52) {
      triangle(x, y+ln, x+ln/2, y, x+ln, y+ln);
    } 
    else {
      triangle(x, y, x+ln/2, y+ln, x+ln, y);
    }

    //Draw triangle next to prior triangle
    x += distance;
    
    //Draw next row of triangles & draw new page of triangles
    if (x > width) {
      x = 0;
      y += ln;
    }
    if (y >= height) {
      x = 0;
      y = 0;
    }
  }

  //Draw lines from center point to triangles
  void lines() {
    stroke(200, 40);
    line(x, y, width/2, height/2);
  }
}



