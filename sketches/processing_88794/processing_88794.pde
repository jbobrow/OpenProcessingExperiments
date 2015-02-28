

ship shape[];


//change this for a different number of circles;
int widt = 13;

void setup() {
  size(600,600);
  background(0);
  
  
  shape = new ship[width/(widt-5)];
  
  
  
  for (int j = 0; j < width/(widt-5); j++) {
    shape[j] = new ship(widt, j*(widt-5));

  }
 
}

void draw() {
background(100);
  for (int i = 0; i < width/(widt-5); i++)  {
    shape[i].draw();
  }
}

class ship {
 float d = 0;
 float xpos;
 float ypos;
int wiidt;



  ship(int widtvar, float xposvar) {
wiidt=widtvar;
xpos=xposvar;
  }

  void draw() {
d+=0.02;


ypos = width/2+noise(d+(xpos*wiidt)/600)*100;

fill(255, 255, 255, 100);
    ellipse(xpos, ypos, wiidt, wiidt);

}
}

