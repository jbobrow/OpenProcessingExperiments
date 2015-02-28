
void setup(){
size (600,600);
}
void draw(){
  fill(0); //outer black ring
  ellipse(300,300,404,236);
  fill(255,255,0); //yellow ring
  ellipse(300,300,384,216);
  fill(0); //bat
ellipse(300,300,364,196); 
fill(255,255,0);
noStroke();
ellipse(353,234,66,66);
ellipse(251,234,66,66);
rect(320,197,35,40);
rect(240,197,44,40);
quad(294,220,310,220,323,197,282,198);
fill(255,255,0);
bezier(300, 300,  380, 380,  380, 380, 380,  460, 460);


//rotate(PI/4);
//ellipse(560,26,44,88); //lower right

}
