
int size;

void setup(){
size (1000, 1000);
}

//Creating function "dot" for an ellipse (x, y, diameter) that responds to mouse pos.

void dot(float x, float y, float size){

  if(mouseX <= x-(size/2) && mouseX >= x + (size/2) && mouseY <= y - (size/2) && mouseY >= y + (size/2)){
  size=50;
}
else{size=20;}

  ellipse(x, y, size, size);
}



void draw(){
  background(255);

//array of a 100 lines
int [] lines = new int[100];
for (int i=0; i < 100; i++) {         
  lines[i] = 40*i;
}

//checking if array works
//print(lines[4]);

//creating lines of circles

for (int i=0; i<100; i++){

//each line will have several "dots" being created by the for loop.

 dot(i*40, lines[0], size); 
 dot(i*40, lines[1], size);
 dot(i*40, lines[2], size);
 dot(i*40, lines[3], size);
 dot(i*40, lines[4], size);
 dot(i*40, lines[5], size);
//etc
//now, the "x" and "y" terms of each dot will exist, right?
//so that every dot in fact has an unique "x" value and a "y" value.
//however, the "if" statement contained within the dot function doesn't seem to work.

}

}


