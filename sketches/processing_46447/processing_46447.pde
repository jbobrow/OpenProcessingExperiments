
/**
* Inspired by the this example here:
* http://pierreloicdoulcet.fr/tree/
* I decided to make a port to processing.Enjoy!
* Coded by: Rodrigo Amaya, follow me @ramayac.
*/

class Point{
  float x;
  float y;
  Point(float _x, float _y){
    x=_x;
    y=_y;
  }
}

class Tree{
  float xf = 0;
  float yf = 5;
  float gy = 0;
  float gx = 0;
  float gw = 0.01;
  float width = 1;
  Point origen;
  ArrayList sub = new ArrayList();
  int age = 0;

  Tree(float _xf, float _yf, float _gy, float _gx, float _gw, float _width, Point _origen, int _age){
    xf = _xf;
    yf = _yf;
    gy = _gy;
    gx = _gx;
    gw = _gw;
    width = _width;
    origen = _origen;
    age = _age;
  }

  Tree(float _xf, float _yf, float _gy, float _gx, float _gw, float _width, Point _origen, ArrayList _sub, int _age){
    this(_xf, _yf, _gy, _gx, _gw, _width, _origen, _age);
    origen = _origen;
  }
 
}


ArrayList trees = new ArrayList();

int SCREEN_WIDTH = 600;
int SCREEN_HEIGHT = 300;
int OFFSET = 20;
int MAX_AGE = 1200;
int AGE = 1000;
int MAX_RECURSION = 3;
int CHILDREN = 5;

int RecursionCap = 0;

void addTree() {
  int x = mouseX;
    if (x > OFFSET && x < SCREEN_WIDTH - OFFSET){
      Tree tree = new Tree(0.0, 5.0, 0.1, 0.0, 0.01, 1, new Point(x, SCREEN_HEIGHT), 0); 
      trees.add(tree);
    }
}

/*
* Recursive tree drawing function (TODO: move to draw() in Tree class)
*/
void renderTree(Tree branch){
	float x = branch.origen.x;
	float y = branch.origen.y;
        
        //When the tree or branch is young, the color is greener: color(26, 237, 0);
        //and when its old its browner: color(113, 87, 0);
        
        float r = constrain(24*branch.width, 30, 120);
        float g = constrain(255/branch.width, 90, 255);
        color c = color(r, g, 0, 220);
        
	stroke(c);
        strokeWeight(branch.width);
	strokeCap(ROUND);

        line(x, y, x - branch.xf, y - branch.yf);
	
	int i = 0;
	while (i < branch.sub.size()) {
          renderTree((Tree)branch.sub.get(i));
	  ++i;
	}
}

void render(){
  int i = 0;
  while (i < trees.size()){
    Tree t = (Tree)trees.get(i);
    renderTree((Tree)trees.get(i));
    ++i;
  }
}

/*
* Recursive method for growing the Trees
*/
Tree growTree(Tree branch){
	branch.age++;

	if (branch.age < AGE){
  
          	branch.yf += branch.gy;
        	branch.xf += branch.gx;
        	branch.width += branch.gw;
  
                branch.gy = branch.gy - branch.gy / AGE;
        	branch.gx = branch.gx - branch.gx / AGE;
	        branch.gw = branch.gw - branch.gw / AGE;		
  
                //println("age: "+ branch.age + ", size: " + branch.sub.size() + ", width: " + branch.width + ", recursion: " + RecursionCap);
		if (branch.sub.size() == 0 && branch.width > 2 && RecursionCap < MAX_RECURSION){
			int child = CHILDREN;
			while (child-- > 0){
                              Tree c = new Tree(0, 0, random(0,1) * 0.2, (random(0,1) * 2 - 1)*0.1, 0.01, 0, new Point(0, 0), branch.age);
			      branch.sub.add(c);
			}
		}
		
		int i = 0;
		RecursionCap++;
		while (i < branch.sub.size()){
                    Tree t = (Tree)branch.sub.get(i);
                    t.origen.x = branch.origen.x - branch.xf;
                    t.origen.y = branch.origen.y - branch.yf;
                    t = growTree(t);
                    branch.sub.set(i, t);
		    ++i;
		}
		RecursionCap--;
	}
        
        return branch;
}


void setup(){
   size(SCREEN_WIDTH, SCREEN_HEIGHT);
   frameRate(30);
   smooth();
}

void draw(){
  //background(#3BB9FF); //Deep Sky Blue
  background(255);
  
  RecursionCap = 0;
  int i = 0;
  while(i < trees.size()){
    Tree t = (Tree)trees.get(i);
    t = growTree(t);
    trees.set(i, t);
    ++i;
  }
  render();
}

void mousePressed(){
  //println("Added a tree: " + mouseX);
  addTree();
}


