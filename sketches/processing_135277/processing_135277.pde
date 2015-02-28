
//Data 1 - Variables
//Exercise #2
/*3. Create a composition that scales proportionally with
different window sizes. Put different values into size() to test.*/

int width = 1;
int height = 1;

void setup(){
size(400, 400);
}

void draw(){

//size(width, height); don't think you can animate the window size change
width = width + 1;
height = height +1;
ellipse(width/2, height/2, width/2, height/2);

//bezier(200,200, 125, 200, 125, 100, 200,100);
bezier(width/2,height/2, width/3.2, height/2, width/3.2, height/4, width/2,height/4);

//bezier(200, 200, 275, 200, 275, 300, 200, 300);
bezier(width/2,height/2, width/1.4545, height/2, width/1.4545, height/1.333, width/2, height/1.333);


}



