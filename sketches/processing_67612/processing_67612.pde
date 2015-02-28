
class Person
{
  int age;//age of person responded, radius of arc
  int response;//answer to yes/no question, color
  int enviro;//urban density, thickness
  int genre;//favorite type of movie, quadrant
  //String name;
  float xpos;
  float ypos;

  Person(int a, int r, int e, int g)
  {
    this.xpos = width/2; //centered on sketch
    this.ypos = height/2;
    this.age= a; 
    this.response= r;
    this.enviro = e;
    this.genre = g;
    }

  /*A display method. Visualizes each person as an ellipse. Age controlls the size. */
  void display() 
  {
    noFill();
    stroke(255*response, 0, 0,100);
    strokeCap(SQUARE);
    strokeWeight(int(enviro*10));//urban density variable
    float disperse = random(-20,20);
    arc(width/2, height/2, 120*age+disperse, 120*age+disperse,(PI/4)*genre, ((PI/4)*genre)+(PI/4));
  }
}



