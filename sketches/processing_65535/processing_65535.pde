
ArrayList stars;
menu menu;

void setup(){
  size(500,500);
  background(0);
  //background stars
  stars = new ArrayList();
  for(int i = 1; i <= 500; i++){
    stars.add(new star());
  }
  //Menu System
  menu = new menu();
}
void draw(){
  background(0);
  //Background stars
  for(int i = 0; i <= stars.size()-1; i++){
    star starUse = (star) stars.get(i);
    starUse.display();
  }
  //Menu System
  menu.display();
}

