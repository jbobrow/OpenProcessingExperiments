
ArrayList<Person> people = new ArrayList<Person>();

void setup() {
  size(400,400);
  stroke(0);
  strokeWeight(2);
  background(255);
  Person first = new Person(width/2,height/2);
  people.add(first);
}

void draw() {
  for(Person p : people) {
    p.render();
  }
}

void mouseClicked() {
  people.add(new Person(mouseX, mouseY));
}

class Person {
  PVector loc;
  float angle;
  
  public Person(float x, float y) {
    loc = new PVector(x,y);
    angle = (float)(180*Math.random() - 90);
  }
  
  public void render() {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(radians(angle));
    
    //draw person
    ellipseMode(CENTER);
    ellipse(0, 0, 40, 25); //head
    line(0,12.5,0,50); //body
    line(0,20,-25,15); //left arm
    line(0,20,25,15); //right arm
    line(0,50,-20,80); //left leg
    line(0,50,20,80); //right leg

    popMatrix();
  }
  
}



