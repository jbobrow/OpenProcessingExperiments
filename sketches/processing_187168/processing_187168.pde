
//global variables
float w = 30;
color c;
color v;
color k = 15;
float n = random(0,100);

//setup blocks create the static part of draw, in this case just the size of composition
void setup(){
   
  //size of composition
  size(600,600);
  
}

//draw block creates dynamic drawing, in this case, everything in comp
void draw(){
  frameRate (30);
  smooth();
  
  //color of background
  background(k);
  
  //transforms the background according to mouse activity
  if (mousePressed && mouseX < height/2) {
    k = #78755f;
    fill(#7d7c78);
    triangle(0,0, 0, width, width, height);}
    else if (mousePressed && mouseX > height/2) {
      k = #e3d252;}
       else {
      k=15;}
   
  //variable that defines the size of the background circles
  int shapeWeight = 50;

  //this function creates a pattern of yellow circles in the background
  //noStroke to have no stroke obviously, than uses two loops to repeat the shape horizontally and vertically
  noStroke();
  for(int i = 0; i<width; i=i+shapeWeight*2) {
    for(int j = 0; j<height; j=j+shapeWeight*2) {
      fill(#fff999);
      if (mousePressed){
      ellipse(i+n, i+n, n, n);
      }else{
      ellipse(i+shapeWeight,j+shapeWeight, shapeWeight, shapeWeight);}
    }
    }
    
  //this rect just creates a "cloak" for the central objects not mix with the background ellipses  
  fill(15);
  rect(200, 200, 200,200);
  
  //red lines, decrease width till half screen, 
  //then increases again
  for(int i = 200; i<403; i= i+3) {
    stroke(c);
    if (i < width/2) {
      line(i,i, 600-i,i);
    } else {
      line (600-i,i, i,i);
    }
  }
  
  //similar loop as the red lines one, this uses vertical change
  //to the blue lines
  for(int i = 200; i<403; i= i+3) {
    stroke(v);
    if (i < height/2) {
      line(i,0+i, i,600-i);
    } else {
      line (i,600-i, i,i);
    }
  }
  
  //changes the color of lines when mouse is pressed
  if (mousePressed) {
    c = #FFEB52; v = #3d3d3d; }
    else {
      c = #FF473E; v = #3BB9FF; }
  
  //calls the custom function to be executed
  mandalinha();
  
}


//custom function to creat the spinning mandala in the center of composition
void mandalinha () {
//  color a = #FF4560;
//  color b = #48A0FF;

  //w variable represents the size of the square used to create the rotation
  //color variables created to fill an array to randomize them later
  w = mouseX*0.08f;
  color a = #Fafa50;
  color b = 50;

  color [] Colors = {a, b};

  //a loop that creates the mandala shape
  noStroke();
  translate(width/2,height/2);
  for (int i = 0; i<600; i+=2){
  
  rotate(10);
  fill(Colors[int(random(0,2))],70);
  rect(0,0, w,w);
  }
 
  
    
}
    


