

  //Deniz GÃ¼rsel
//denizzgursel@gmail.com
 
int []a = new int[10]; // x coordinate of the ball
int []b = new int[10]; // y coordinate of the ball
int []r = new int[10]; //radius of the ball
 
 
void setup (){
  int i;
  size(300,300);
  frameRate(2);
  for (i=0;i<10;i++){
    a[i]=int(random(250));
    b[i]=int(random(250));
    r[i]=int(random(100));
  }
}
 
//drawing the balls
void draw () {
  int i;
  background(0);//background color=black
  for (i=0;i<10;i++){
    //drawing the ellipse
    //We want to make it cirlce that's why we use same radius 2 times
    ellipse(a[i],b[i],r[i],r[i]);
    r[i]=(r[i]+30)%50;
    // to make the balls get smaller after their radius reach
    //size 50
  }
}





