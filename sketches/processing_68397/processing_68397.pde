
class City implements Comparable {
  String name;
  long population;
  int x;
  int y;

  City() {
    name = " city";
    population = (long) pow(random(100000000), 0.7);
    x = (int) random(width-20)+10;
    y = (int) random(height-20)+10; 
    //println("Constructor "+nfc((int)population));
  }

  void display() {
    rectMode(CENTER);
    if (over()) {
      fill(255);
      stroke(255);
      text(name+" "+nfc((int)population), x, y);
    }
    else {
      fill(192);
      stroke(192);
    }
    ellipse(x, y, size(), size());
  }

 float distance(City c) {
   return sqrt(sq(abs(x-c.x)) + sq(abs(y-c.y)));
 }

  int size() {
    return 2+(int)sqrt(population)/50;
  }

  int compareTo(Object o) {
    City c = (City) o;
    return (int) (population - c.population);
  }

  boolean over() {
    float disX = x - mouseX;
    float disY = y - mouseY;
    if (sqrt(sq(disX) + sq(disY)) < size()/2 ) {
      return true;
    } 
    else {
      return false;
    }
  }
}


