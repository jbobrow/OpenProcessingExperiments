
int x = 70;
int y = 100;
int xspeed=1;
int distance = 100;
PImage bkround;
 
  
void setup(){
  size(700,525);
  noStroke();
  bkround=loadImage("underthesea.jpg");
}

void draw()
{
  background(bkround);
  x=x+xspeed;
 
  fill(random(255), random(255), random(255));
  for (int i=0; i<8; i++){
      for(int j=0; j<5; j++){
         ellipse(x+i*distance, y+j*distance, 80, 50);
     
      }
//  for (int num_of_dist=0; num_of_dist<10; num_of_dist=num_of_dist+1){
 //ellipse( x, y, 30, 30);
//  println("number of distance " + num_of_dist + " distance " + num_of_dist * distance + " y offset " + (y + distance*num_of_dist) );

  }
}



