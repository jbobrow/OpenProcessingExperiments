

int numBoxes = 400;
ColorBox[] boxes = new ColorBox[numBoxes];

ArrayList<ColorBox> changelist = new ArrayList<ColorBox>();

void setup(){
  size(400,400);
  int i = 0;
  for(int y = 0; y < height; y+=20){
    for(int x = 0; x < width; x+=20){
      boxes[i] = new ColorBox(i,x,y);
      i++;
    }
  } 
  changelist.add(boxes[0]);
}



void draw(){
  for (int i = 0; i < numBoxes; i++){
    boxes[i].display();
  }
 noLoop(); 
}


void mousePressed(){
  int x = int(mouseX / 20);
  int y = int(mouseY / 20);

  int i = int(x + (y * height/20));
  color myColor = boxes[i].c;
  
  //  Check the color of each of the squares
  checkColorAndAddToArrayList();
  
  //Change the color of all that are touching
  changeColor(myColor);
  loop();
}

void changeColor(color newColor){
  for(int i = 0; i< changelist.size(); i++){
    ColorBox current = (ColorBox)(changelist.get(i));
    current.c = newColor;
  }
}





void checkColorAndAddToArrayList(){
  //  For each one on the list - check its neighbors
  //  If they aren't already on the list, and have the same color as 0, add them to the end of the list
  //  change the color of everything on the list
  color base = boxes[0].c;
  for(int i = 0; i < changelist.size(); i++){
    ColorBox current = changelist.get(i);
    //north
    if(current.index-20 > 0){
      ColorBox test = boxes[current.index-20];
      if(test.c==base){
        if(!changelist.contains(test)){
          changelist.add(test);
        }
      }
    }
    
    //east
    //  Check that current is not on right side of screen
    if((current.index)% 20 != 19){
      ColorBox test = boxes[current.index+1];
      if(test.c == base){
        if(!changelist.contains(test)){
          changelist.add(test);
        }
      }
    }

    //south
    if(current.index+20 < 400){
      ColorBox test = boxes[current.index+20];
      if(test.c==base){
        if(!changelist.contains(test)){
          changelist.add(test);
        }
      }
    }      

    //west
    // Check that current is not on left side of screen
    if(((current.index)%20) != 0){
      ColorBox test = boxes[current.index-1];
      if(test.c==base){
        if(!changelist.contains(test)){
          changelist.add(test);
        }
      }
    }
  }
}









class ColorBox{
  int index;
  int x, y; 
  //color 
  color c;
  int boxSize = 20;

  ColorBox(int newindex, int newx, int newy){
    index = newindex;
    x = newx; 
    y = newy; 
    int randNum = (int) random(5);
    switch(randNum) {
    case 0: 
      c = color(61,76,76);
      break;
    case 1:
      c = color(153,153,46);
      break;
    case 2: 
      c = color(229,229,102);
      break;
    case 3:
      c = color(242,255,191);
      break;
    case 4:
      c = color(100,40,0);
      break;
    }
  }

  void display(){
    fill(c);
    noStroke();
    rect(x,y,boxSize,boxSize);

  }
}






