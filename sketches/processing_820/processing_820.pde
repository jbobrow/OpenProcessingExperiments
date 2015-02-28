
//Programmed by Joshua McGrath
//NMD 102
//Had some help from the Processing reference page.


//This code intializes an array which is where we will store the constantly 
//updating data about the boxes.
//For now, I only know how to use standard arrays which must have a set size.
//In the future I will look into Dynamic arrays which change size for you.
int MAX_array = 1000;
int max_cube_ammount = 0;
int cube_ammount = 0;
cube[] companion = new cube[MAX_array];


int i=0; 
float rad=25.0;



void setup(){
  size(400,400);
  background (255);

}

void draw() {
  frameRate(30);




  //this for loop accesses and updates the boxes each time draw iterates, 
  //it is crucial
  for (int j=0; j < i; j++)
  {
    //call the grow function I made below at the 'i' position in the array
    companion[j].grow();
    //call the make function I made below
    companion[j].make();
  }


}
//here the boxes are entered into the array
void mouseReleased(){
  if( i < MAX_array)
  {
    companion[i] = new cube (mouseX, mouseY, rad);
    companion[i].make();
    companion[i].grow();
    i++;
    println(i);
  }
}
//this is a class, from which we can make a 'cube' object

class cube
{
  //these variables are only accessible within the class...
  float xpos;
  float ypos;
  float radius;
  //...but they are passed viable variables when a new object is made
  cube(float x, float y, float r) {
    xpos= x;
    ypos= y;
    radius= r;

  }
//note: the below functions are custom made, and are not native to processing
//in other words, I can call them whatever I want


//fucntion that will make the box and decide its color
  void make() {
    rectMode(CENTER);
    //   fill(125,245, 124, 100);
    float col = random(0, 255);
    float col2 = random(0, 255);
    float col3 = random(0, 255);
    fill(col, col2, col3, 100);
    rect(xpos,ypos,radius, radius);

  }
//expands the radius of the rectangles
  void grow(){

    radius = radius + 1;

  }

}






