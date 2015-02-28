

ArrayList<House> houses;
Monument monuments[] = new Monument[100];
int totalMonuments;

void setup() {
  size(1200, 900);
  background(237, 201, 175);
  smooth();
  houses = new ArrayList<House>();
}

void draw() {
    houses.add(new House(color(random(0, 255), random(0, 255), random(0, 255))));
    for (int i = 0; i < houses.size() && totalMonuments >= 1; i++) {
    House house = houses.get(i);
    house.grow();
    int rand = (int) random(1, 10);
    if (rand < 2 == true) {
    houses.clear();
    }
  }
}

void mousePressed() {
  monuments[totalMonuments] = new Monument();
  totalMonuments++;
  for (int j = 0; j < totalMonuments; j++) {
    monuments[j].build(mouseX, mouseY);
  }
}


float column;
float arch;
int surpass = 30;

class House {
  color c;
  float xpos;
  float ypos;
  
  House(color tempC){
    c = tempC;
    xpos = random(column-40,(column+(2*surpass)+40));
    ypos = random(arch-((1/2)*(arch-(surpass*sqrt(3)))),arch+40);
  }
  
  void grow() {
        rectMode(CENTER);
        stroke(1);
        fill(c);
        rect(xpos,ypos,5,5);
    }
}

class Monument {
  
  Monument () {
    surpass = 30;
    surpass = surpass + 8*totalMonuments;
  }
  
  void build(float cornerX, float cornerY) {
    column = cornerX;
    arch = cornerY;
    stroke(30);
    fill(102,2,60);
    triangle(column,arch,column+surpass,arch-(surpass*sqrt(3)),column+(2*surpass),arch);
  }  
}


