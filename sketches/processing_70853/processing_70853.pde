
int circle_diameter = 80;

void setup(){

//commands come here
size(600,600);
};

void draw(){
background(180);
line(width/2,0, width/2,height/2 );
line(0,height/2, width,height/2 );

ellipse(width/2,height/2, circle_diameter, circle_diameter);

if((mouseX > width/2) && (mouseY<width/2)){

fill(0,200,40);
circle_diameter --;

};


if((mouseX < width/2) &&(mouseY<width/2)){
fill(255,0,0);
circle_diameter ++;
};

if(mouseY>width/2){
fill(10,30,200);
};
};
