
/*
I work at the vocational school where we teach multimedia 
designers among others. This week I saw their project 
where they did some experimental typography that can be
presented on a 6x6 LED panel conneced to Arduino board.

My sketch is inspired by similar LED panel typograpy. I used
matrix 5x5 to render word "TYPE" many times.

Designing letter "Y" was the hardest, I tried 5-6 versions.

I learned a lot about using arrays and this is actually
my third and shortest revision of programming the TYPE.

With changing of variables it's easy to change actually:
- textSize array sets the sizes of TYPE
- int i sets the amount of TYPEs

Taavi, Estonia.
*/

//arrays for LED positions' coordinates
int[] xpos = {
1,2,3,4,5,7,11,13,14,15,16,19,20,21,22,23, //1st row
1,2,3,4,5,7,8,10,11,13,14,16,17,19,20, //2nd row
2,3,8,9,10,13,14,15,16,19,20,21,22, //3rd row
2,3,9,13,14,19,20, //4th row
2,3,7,8,9,13,14,19,20,21,22,23}; //5th row

int[] ypos = {
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1, //1st row
2,2,2,2,2,2,2,2,2,2,2,2,2,2,2, //2nd row
3,3,3,3,3,3,3,3,3,3,3,3,3, //etc
4,4,4,4,4,4,4,
5,5,5,5,5,5,5,5,5,5,5,5};

//type size array
int[] textSize ={1,2,3,4};

//color palette for the sketch
color[] c = {#AE08FF,#0C88E8,#00FF2B,#E8CF0C,#FF620D};

//counter of the amount of TYPE's rendered
int i;

void setup() {
  size(800, 600);
  background(0);
}

void draw() {

  i++;
  noStroke();
  ellipseMode(CENTER);
 
 //limiting test for counts of TYPE 
 if  (i < 400){
 
    //pick random textSize from the array
    float r1 = random(4);
    float r = textSize[int(r1)];
    
    //starting coord. for TYPE, keeping the ellipses on canvas 
    float x = random(r, width-(24*r)); 
    float y = random(r, height-(6*r)); 
    
    //ellipse eg LED radius
    float e = 0.8*r; 
    
    //pick random color from the palette
    float c1 = random(5);
    fill(c[int(c1)]);
       
    //render TYPE by picking ellipse coord. from arrays
    for (int i =0; i < xpos.length; i++) {
    ellipse(x+(r*xpos[i]),y+(r*ypos[i]),e,e);
    }
 }

//keyboard shortcut for saving the image
 if (keyPressed) {
   if (key == 'S' || key == 's') {
   save("TYPE.jpg");
   }
 }
}
