
int x1=0;
//where it starts on the screen
int x2=600;
int x3=600;
int x4=0;
int d=1;

color c1 = color(0, random(255), random(255));
color c2 = color(0, random(255), random(255));
color c3 = color(0, random(255), random(255));
color c4 = color(0, random(255), random(255));
//using this up here instead of specifying the color fill down there, the color wont be changing 60 times a second

//if you want to use it in more than one block, dont put it in setup
void setup() {
    size(600, 200);
    noStroke();
    //turns off the outline of the object
    y = height/2;
}

void draw() {
    background(255);
    
    //the second variable in the fill code is the opacity amount
    fill(c1, 100);
    ellipse(x1, height*1/5, d, d);
    //when having it move, you must have a variable, rather than a number
    x1++;
    d++;

    fill(c2, 100);
    ellipse(x2, height*2/5, d, d);
    //when having it move, you must have a variable, rather than a number
    x2 -=2;
    //the -- will make it move to the left instead of right
    d++;
    
    fill(c3, 100);
    ellipse(x3, height*3/5, d, d);
    //when having it move, you must have a variable, rather than a number
    x3--;
    d++;
    
    fill(c4, 100);
    ellipse(x4, height*4/5, d, d);
    //when having it move, you must have a variable, rather than a number
    x4 +=2;
    //this effects the speed! and the - or + chooses which direction its going to move in
    d++;
}
