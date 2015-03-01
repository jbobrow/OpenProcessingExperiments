
PShape monkey;
int m;
PFont j;

void setup () {
  size (600,600);
  monkey= loadShape ("monkey.svg");
  
  //printArray (PFont.list());
  j= createFont ("Damascus", 24);
  textFont (j);
  textAlign (CENTER);
}

void draw () {
  
  background (mouseX, mouseY, #A2261A);
    shape (monkey, mouseX, mouseY, 75, 75);
    shape (monkey, 115, 65);
    
    fill (255);
    text ("Count the monkeys", 425, 100);
    
    
    //top left monkeys 
    shape (monkey, 5, 10, 65, 65);
    shape (monkey, 5, 45, 65, 65);
    shape (monkey, 45, 45, 65, 65);
    shape (monkey, 45, 10, 65, 65);
    shape (monkey, 85, 45, 65, 65);
    shape (monkey, 85, 10, 65, 65);
  
    //middle monkeys 
    shape (monkey, 5, 180, 65, 65);
    shape (monkey, 5, 215, 65, 65);
    shape (monkey, 45, 180, 65, 65);
    shape (monkey, 45, 215, 65, 65);
    shape (monkey, 85, 180, 65, 65);
    shape (monkey, 85, 215, 65, 65);
    
    //2nd middle monkeys 
    shape (monkey, 5, 350, 65, 65);
    shape (monkey, 5, 385, 65, 65);
    shape (monkey, 45, 350, 65, 65);
    shape (monkey, 45, 385, 65, 65);
    shape (monkey, 85, 350, 65, 65);
    shape (monkey, 85, 385, 65, 65);
   
   
   //bottom right group of monkeys
   shape (monkey, 5, 500, 65, 65);
   shape (monkey, 5, 535, 65, 65);
   shape (monkey, 45, 500, 65, 65);
   shape (monkey, 45, 535, 65, 65);
   shape (monkey, 85, 500, 65, 65);
   shape (monkey, 85, 535, 65, 65);
}


