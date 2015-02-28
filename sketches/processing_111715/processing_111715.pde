
//say hello to mondrian's no iii
//by KokFu Lok

void setup(){
  size(1000,1015);
  background(249,249,249);

}

void draw(){

  //thick line
strokeWeight(20);
line(0,420,1000,420);
line(0,660,1000,660);

 //2nd thick line
strokeWeight(15);
line(455,0,455,1015);
line(105,660,105,1015);
line(770,660,770,1015);
line(455,965,770,965);
  //rectangle
  //red
fill(174,42,23);
noStroke();
rect(0,0,450,410);
//yellow
fill(247,202,45);
noStroke();
rect(0,670,98,345);
//blue
fill(30,47,86);
noStroke();
rect(463,670,300,290);
}



