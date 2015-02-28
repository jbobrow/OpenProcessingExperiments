
/**
 * //inclass assigment-用class和PVector來模擬球體運動
 * //author-hsiu wen,ou
 * //reference :http://www.processing.org/learning/pvector/
                http://www.openprocessing.org/visuals/?visualID=9323 author:nik chien 
 */
Ball ball;
Ball ball2;

void setup(){
  size(200,200);
  smooth();
 
  ball = new Ball(100,100,1,3.3); //(x1,y1,xspeed1,yspeed1);
  ball2 = new Ball(random(width),random(height),2,2.3);
}
void draw(){
  if(mousePressed){
    saveFrame("ball-####.jpg");
  }
  noStroke();
  fill(50);
  rect(0,0,width,height);
  //隨時更新改變
  ball.update();
  ball2.update();
  //顯示
  ball.display();
  ball2.display();
}
class Ball{
  //function is PVector,向量的語言,用來裝data的值.
  //位置和速度為objects.
  PVector location;
  PVector velocity;
  
  Ball(PVector loc,PVector vel){
    location=loc;
    velocity=vel;
  }
  //現在要各找兩個float來儲存location和velocity的x和y的變量.
  Ball(float x,float y,float xspeed,float yspeed){  
    location = new PVector(x,y); 
    velocity = new PVector(xspeed,yspeed);
  }
  void update(){
    //到這裡以前，
    //給予限制條件，讓模擬更真
    //如果x位置>寬，速度向量改為反方向
    if (location.x > width ||location.x<0) {
      velocity.x=velocity.x* -1;
    } 
   /** else if (location.x < 0) {//奇怪?這樣會導致球彈過一次後就消失，
       在上面if式子裡加入||(or)變成功讓球彈起來~
     velocity.x=velocity.x* -1;
    } 
    */
    if (location.y >height ||location.y<0 ) {
      velocity.y=velocity.y* -1; 
    }
    /**
    else if (location.y > height) {
      velocity.y=velocity.y* -1; 
    } 
    */
    //x=x+xspeed
    //y=y+yspeed
    //需要把位置物件以點運算
    location.add(velocity);
  }
  void display(){
    stroke(0);
    fill(random(255),80,50);
    ellipse(location.x,location.y,30,30);
  }
}










