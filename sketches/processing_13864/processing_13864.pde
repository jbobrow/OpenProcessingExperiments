
void setup (){size(500,300);
background(0);
}
void draw(){
  stroke(255);

  int i=1;
    int j = 1;
//for(i=1;i>0;i=i+j){
  for(j=1;j>0;j=j*3){ 
  
line(j, 20, 80, 5);
line(180, 266, j, 300);
//ellipse(j,i,20,random(40));
//ellipse(180,j+60,random(20),random(60));

bezier(j, 20,  80, 5,  180, 266,  j, 300);
}}

